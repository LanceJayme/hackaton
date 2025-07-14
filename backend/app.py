from flask import Flask, request, jsonify
from flask_cors import CORS
from rapidfuzz import fuzz
from transformers import AutoTokenizer, AutoModelForCausalLM, pipeline
import whisper
import datetime
import os

app = Flask(__name__)
CORS(app)  # Allow requests from Flutter

@app.route('/chat', methods=['POST'])
def load_faq(filepath):
    qa_pairs = []
    if not os.path.exists(filepath):
        print(f"FAQ file not found: {filepath}")
        return qa_pairs
    with open(filepath, encoding='utf-8') as f:
        lines = f.read().split('\n')
    question, answer = None, None
    for line in lines:
        if line.startswith('User: '):
            question = line[6:].strip()
        elif line.startswith('Bot: '):
            answer = line[5:].strip()
            if question and answer:
                qa_pairs.append((question, answer))
                question, answer = None, None
    return qa_pairs

FAQ_PATH = os.path.join(os.path.dirname(__file__), 'processed_conversations.txt')
FAQ_PAIRS = load_faq(FAQ_PATH)

def find_best_answer(user_question, threshold=75):
    best_score = 0
    best_answer = None
    for q, a in FAQ_PAIRS:
        score = fuzz.ratio(user_question.lower(), q.lower())
        if score > best_score:
            best_score = score
            best_answer = a
    if best_score >= threshold:
        return best_answer
    return None

# Load your finetuned model and tokenizer only once
MODEL_PATH = os.path.join(os.path.dirname(__file__), 'my-finetuned-bot')
try:
    tokenizer = AutoTokenizer.from_pretrained(MODEL_PATH)
    model = AutoModelForCausalLM.from_pretrained(MODEL_PATH)
    generator = pipeline("text-generation", model=model, tokenizer=tokenizer)
except Exception as e:
    print(f"Error loading model: {e}")
    generator = None

@app.route('/api/chat', methods=['POST'])
def chat():
    try:
        data = request.get_json()
        user_question = data.get('message', '').strip()
        if not user_question:
            return jsonify({'answer': "Please enter a question."})

        # 1. Try FAQ matching
        answer = find_best_answer(user_question)
        if answer:
            return jsonify({'answer': answer})

        # 2. Fallback to model
        if generator is None:
            return jsonify({'answer': "Sorry, the AI model is not available right now."})

        prompt = f"User: {user_question}\nBot:"
        response = generator(prompt, max_new_tokens=50, do_sample=False)[0]['generated_text']
        print("Model raw output:", response)  # For debugging

        # Extract only the bot's answer
        if "Bot:" in response:
            answer = response.split("Bot:")[-1].strip()
        else:
            answer = response.strip()
        # Optionally, only return the first sentence
        answer = answer.split(".")[0] + "." if "." in answer else answer
        if not answer:
            answer = "Sorry, I don't know the answer to that."
        return jsonify({'answer': answer})
    except Exception as e:
        print("Exception in /api/chat:", e)
        return jsonify({'answer': f"Error: Exception: {e}"}), 500


if __name__ == '__main__':
    app.run(port=5000)


