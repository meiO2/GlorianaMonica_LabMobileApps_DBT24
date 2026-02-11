import 'package:flutter/material.dart';
import '../data/chat_data.dart';
import '../widgets/chat_item_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        // Centers the username globally in the AppBar
        centerTitle: true, 
        title: const Row(
          mainAxisSize: MainAxisSize.min, // Keeps title and icon tight for centering
          children: [
            Text(
              'user_dev_01', 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down, size: 20),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.edit_note, size: 30),
          ),
        ],
      ),
      body: Column(
        children: [
          // Non-functional Search Bar UI
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.white54, size: 20),
                  SizedBox(width: 12),
                  Text(
                    "Search or ask Meta AI", 
                    style: TextStyle(color: Colors.white54, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          // Tab Headers
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Text(
                  "Messages", 
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Spacer(),
                Text(
                  "Requests", 
                  style: TextStyle(
                    color: Colors.blue, 
                    fontWeight: FontWeight.bold, 
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          // Chat List
          Expanded(
            child: ListView.builder(
              itemCount: dummyChats.length,
              itemBuilder: (context, index) {
                return ChatItemWidget(chat: dummyChats[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}