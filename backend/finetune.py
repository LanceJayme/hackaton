from transformers import GPT2LMHeadModel, GPT2TokenizerFast, Trainer, TrainingArguments, TextDataset, DataCollatorForLanguageModeling

tokenizer = GPT2TokenizerFast.from_pretrained("gpt2")
model = GPT2LMHeadModel.from_pretrained("gpt2")

# Prepare your dataset as before
train_dataset = TextDataset(
    tokenizer=tokenizer,
    file_path="processed_conversations.txt",
    block_size=64
)
data_collator = DataCollatorForLanguageModeling(
    tokenizer=tokenizer, mlm=False,
)
training_args = TrainingArguments(
    output_dir="./output",
    overwrite_output_dir=True,
    num_train_epochs=3,
    per_device_train_batch_size=2,
    save_steps=10_000,
    save_total_limit=2,
    prediction_loss_only=True,
)
trainer = Trainer(
    model=model,
    args=training_args,
    data_collator=data_collator,
    train_dataset=train_dataset,
)
trainer.train()
model.save_pretrained("./my-finetuned-bot")
tokenizer.save_pretrained("./my-finetuned-bot")