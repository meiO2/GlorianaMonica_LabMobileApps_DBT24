import 'package:flutter/material.dart';
import '../data/message_data.dart';
import '../widgets/message_bubble_widget.dart';

class IndividualChatScreen extends StatelessWidget {
  final String username;
  final String profilePic;

  const IndividualChatScreen({
    super.key, 
    required this.username, 
    required this.profilePic
  });

  @override
  Widget build(BuildContext context) {
    // Get messages for THIS specific user, or an empty list if not found
    final messages = chatThreads[username] ?? [];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(radius: 16, backgroundImage: NetworkImage(profilePic)),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                const Text("Active now", style: TextStyle(fontSize: 11, color: Colors.white54)),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(Icons.phone_outlined),
          SizedBox(width: 20),
          Icon(Icons.videocam_outlined),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              itemCount: messages.length,
              itemBuilder: (context, index) => MessageBubbleWidget(message: messages[index]),
            ),
          ),
          _buildInputBar(),
        ],
      ),
    );
  }

  Widget _buildInputBar() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(color: Color(0xFF3797EF), shape: BoxShape.circle),
            child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Message...",
                  hintStyle: TextStyle(color: Colors.white54, fontSize: 14),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.mic_none, color: Colors.white),
          const SizedBox(width: 12),
          const Icon(Icons.image_outlined, color: Colors.white),
          const SizedBox(width: 12),
          const Icon(Icons.add_circle_outline, color: Colors.white),
        ],
      ),
    );
  }
}