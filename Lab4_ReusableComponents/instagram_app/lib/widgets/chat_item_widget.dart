import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import '../screens/individual_chat_screen.dart'; // Ensure this import is correct

class ChatItemWidget extends StatelessWidget {
  final ChatModel chat;
  const ChatItemWidget({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // The magic happens here: Navigator opens the specific convo
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IndividualChatScreen(
              username: chat.username,
              profilePic: chat.profilePic,
            ),
          ),
        );
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(chat.profilePic),
          ),
          if (chat.isActive)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        chat.username,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              chat.lastMessage,
              style: TextStyle(
                color: chat.hasUnreadMessages ? Colors.white : Colors.white54,
                fontWeight: chat.hasUnreadMessages ? FontWeight.bold : FontWeight.normal,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 4),
          Text("• ${chat.timestamp}", style: const TextStyle(color: Colors.white54)),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (chat.hasUnreadMessages)
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            ),
          const SizedBox(width: 16),
          const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 28),
        ],
      ),
    );
  }
}