import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF181818) : Colors.white;
    final inputBarColor = isDark ? const Color(0xFF23272F) : Colors.grey[200];
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                ChatBubble(isUser: false, text: 'Hello! How can I help you today?'),
                ChatBubble(isUser: true, text: 'What is the weather like?'),
                ChatBubble(isUser: false, text: 'It\'s sunny and 25°C.'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            color: inputBarColor,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(color: isDark ? Colors.white : Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      hintStyle: TextStyle(color: isDark ? Colors.white54 : Colors.black54),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: isDark ? Colors.white : Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.mic, color: isDark ? Colors.white : Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isUser;
  final String text;
  const ChatBubble({required this.isUser, required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final userColor = isDark ? const Color(0xFF0059D6) : Colors.blue[200];
    final botColor = isDark ? const Color(0xFF23272F) : Colors.grey[300];
    final textColor = isDark ? Colors.white : Colors.black;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isUser ? userColor : botColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }
}
