import 'package:flutter/material.dart';
import '../models/message_model.dart';

class MessageBubbleWidget extends StatelessWidget {
  final MessageModel message;

  const MessageBubbleWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    // Check if content is an image or reel to remove bubble padding
    bool isMedia = message.type == MessageType.image || message.type == MessageType.reel;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Display sender name above media if it's from the other person
          if (!message.isMe && isMedia && message.senderName != null) ...[
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 4),
              child: Row(
                children: [
                  const CircleAvatar(radius: 8, backgroundColor: Colors.white24),
                  const SizedBox(width: 6),
                  Text(
                    message.senderName!,
                    style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
          
          // The actual message bubble
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75, // Bubble takes max 75% width
            ),
            decoration: BoxDecoration(
              color: message.isMe 
                  ? const Color(0xFF3797EF) // Blue for your messages
                  : Colors.white.withOpacity(0.1), // Dark grey for others
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: Radius.circular(message.isMe ? 20 : 5),
                bottomRight: Radius.circular(message.isMe ? 5 : 20),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: isMedia
                  ? Image.network(
                      message.content,
                      fit: BoxFit.cover,
                      // Placeholder while loading image
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const SizedBox(
                          height: 200,
                          width: 200,
                          child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                        );
                      },
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Text(
                        message.content,
                        style: const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
            ),
          ),

          // "Seen" indicator for your own messages
          if (message.isMe)
            const Padding(
              padding: EdgeInsets.only(top: 4, right: 4),
              child: Text(
                "Seen",
                style: TextStyle(color: Colors.white38, fontSize: 10),
              ),
            ),
        ],
      ),
    );
  }
}