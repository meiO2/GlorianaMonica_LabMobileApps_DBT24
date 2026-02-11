import '../models/message_model.dart';

Map<String, List<MessageModel>> chatThreads = {
  "stellar_art ✨": [
    MessageModel(content: "Did you see the new gallery opening?", timestamp: "10:00 AM", isMe: false),
    MessageModel(content: "https://picsum.photos/id/15/400/500", timestamp: "10:05 AM", isMe: false, type: MessageType.image, senderName: "stellar_art ✨"),
    MessageModel(content: "Wow, that looks incredible! I'm definitely going.", timestamp: "10:10 AM", isMe: true),
  ],
  "lone_wanderer": [
    MessageModel(content: "Just reached the summit!", timestamp: "Yesterday", isMe: false),
    MessageModel(content: "https://picsum.photos/id/1015/400/600", timestamp: "Yesterday", isMe: false, type: MessageType.image, senderName: "lone_wanderer"),
    MessageModel(content: "The view is breathtaking. Be safe on the way down!", timestamp: "Yesterday", isMe: true),
    MessageModel(content: "# aku kepo", timestamp: "9:00 PM", isMe: true),
  ],
  "coffee_codes": [
    MessageModel(content: "https://picsum.photos/id/1/400/300", timestamp: "2 days ago", isMe: false, type: MessageType.reel, senderName: "coffee_codes"),
    MessageModel(content: "I finally fixed that bug in the navbar logic.", timestamp: "1 day ago", isMe: false),
    MessageModel(content: "Nice! Was it a state management issue?", timestamp: "1 day ago", isMe: true),
    MessageModel(content: "Yeah, forgot to call setState() haha.", timestamp: "Today", isMe: false),
  ],
};