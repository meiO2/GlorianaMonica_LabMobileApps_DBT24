class ChatModel {
  final String username;
  final String profilePic;
  final String lastMessage;
  final String timestamp;
  final bool hasUnreadMessages;
  final bool isActive;

  ChatModel({
    required this.username,
    required this.profilePic,
    required this.lastMessage,
    required this.timestamp,
    this.hasUnreadMessages = false,
    this.isActive = false,
  });
}