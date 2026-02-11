import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import '../widgets/chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  final Chat chat;

  const ChatScreen({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(chat.contact.image)),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(chat.contact.name, style: const TextStyle(color: Colors.black, fontSize: 16)),
                const Text("Active now", style: TextStyle(color: Colors.green, fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.phone, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Center(child: Text("Today", style: TextStyle(color: Colors.grey, fontSize: 12))),
                const SizedBox(height: 20),
                const ChatBubble(text: "Hi, Hajeera.", isMe: true),
                const ChatBubble(text: "Are you available for a UI work?", isMe: true),
                const ChatBubble(text: "If you are interested, let me know.", isMe: true),
                ChatBubble(text: "Hey, I'm open for work, plz share me further details.", isMe: false),
                ChatBubble(text: chat.lastMessage, isMe: false),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: Row(
          children: [
            const Icon(Icons.add_circle_outline, color: Colors.grey),
            const SizedBox(width: 10),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(hintText: "Type something...", border: InputBorder.none),
              ),
            ),
            const Icon(Icons.send, color: Color(0xFFC7B8F5)),
          ],
        ),
      ),
    );
  }
}