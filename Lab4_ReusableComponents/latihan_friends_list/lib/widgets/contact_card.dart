import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import '../screens/chat_screen.dart'; // Import your chat screen

class ContactCard extends StatelessWidget {
  final Chat chat;

  const ContactCard({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // This handles the click
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(chat: chat),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Stack(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(chat.contact.image),
              ),
              if (chat.contact.status == 'Online')
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.5),
                    ),
                  ),
                ),
            ],
          ),
          title: Text(
            chat.contact.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(
            chat.lastMessage,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey[600]),
          ),
          trailing: Text(
            chat.time,
            style: TextStyle(color: Colors.grey[400], fontSize: 12),
          ),
        ),
      ),
    );
  }
}