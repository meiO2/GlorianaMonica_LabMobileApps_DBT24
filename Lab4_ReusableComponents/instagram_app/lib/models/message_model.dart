enum MessageType { text, image, reel }

class MessageModel {
  final String content;
  final String timestamp;
  final bool isMe;
  final MessageType type;
  final String? senderName;

  MessageModel({
    required this.content,
    required this.timestamp,
    required this.isMe,
    this.type = MessageType.text,
    this.senderName,
  });
}