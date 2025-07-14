import 'package:flutter/material.dart';

class ChatbotOverlay extends StatefulWidget {
  final Widget child;
  const ChatbotOverlay({super.key, required this.child});

  @override
  _ChatbotOverlayState createState() => _ChatbotOverlayState();
}

class _ChatbotOverlayState extends State<ChatbotOverlay> {
  bool _isChatbotVisible = false;
  bool _isVoiceMode = true;
  bool _isChatInputActive = false;

  List<_ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _toggleChatbot() {
    setState(() {
      _isChatbotVisible = !_isChatbotVisible;
      if (_isChatbotVisible && _messages.isEmpty) {
        _messages.add(_ChatMessage(
            text: "Hi! I'm Codey. Ask me anything about programming.",
            isUser: false));
      }
      if (!_isChatbotVisible) {
        _isVoiceMode = true;
        _isChatInputActive = false;
        _messages.clear();
      }
    });
  }

  void _handleSubmitted(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add(_ChatMessage(text: text, isUser: true));
      _messages.add(_ChatMessage(
        text: "Codey: A variable stores data that can change later.",
        isUser: false,
      ));
    });

    _textController.clear();

    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 60,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              children: [
                TextSpan(text: 'ASK '),
                TextSpan(
                    text: 'CODEY', style: TextStyle(color: Color(0xFF9C4DFF))),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, color: Colors.black54),
            onPressed: _toggleChatbot,
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble(_ChatMessage msg) {
    return Align(
      alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: msg.isUser ? Color(0xFF9C4DFF) : Color(0xFFF0F0F0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(msg.isUser ? 16 : 0),
            bottomRight: Radius.circular(msg.isUser ? 0 : 16),
          ),
        ),
        child: Text(
          msg.text,
          style: TextStyle(
            color: msg.isUser ? Colors.white : Colors.black87,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildChatList() {
    return Flexible(
      child: ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.only(top: 8, bottom: 12),
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          return _buildChatBubble(_messages[index]);
        },
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isChatInputActive = false;
              });
            },
            child: Icon(Icons.mic, color: Color(0xFF9C4DFF)),
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _textController,
              decoration:
                  InputDecoration.collapsed(hintText: 'Type your message...'),
              onSubmitted: _handleSubmitted,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Color(0xFF9C4DFF)),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  Widget _buildVoiceMode() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/Cody3.png', width: 120, height: 120),
          SizedBox(height: 12),
          Text("Hi, I'm Codey.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text("Tell me, what do you want to know?",
              style: TextStyle(fontSize: 14, color: Colors.black54)),
          SizedBox(height: 24),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Color(0xFF9C4DFF).withOpacity(0.2),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isChatInputActive = true;
                    });
                  },
                  child: Icon(Icons.keyboard, color: Color(0xFF9C4DFF)),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFF9C4DFF),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.mic, color: Colors.white, size: 28),
                    ),
                  ),
                ),
                Icon(Icons.check, color: Color(0xFF9C4DFF)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_isChatbotVisible)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  children: [
                    _buildHeader(),
                    _isChatInputActive ? _buildChatList() : _buildVoiceMode(),
                    if (_isChatInputActive) _buildInputField(),
                  ],
                ),
              ),
            ),
          ),
        Positioned(
          top: 28,
          right: 16,
          child: GestureDetector(
            onTap: _toggleChatbot,
            child: Image.asset(
              'assets/ChatbotIcon.png',
              width: 40,
              height: 40,
            ),
          ),
        ),
      ],
    );
  }
}

class _ChatMessage {
  final String text;
  final bool isUser;
  _ChatMessage({required this.text, required this.isUser});
}
