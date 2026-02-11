import '../models/chat_model.dart';

List<ChatModel> dummyChats = [
  ChatModel(
    username: "stellar_art ✨",
    profilePic: "https://i.pravatar.cc/150?img=32",
    lastMessage: "Sent you a post by van_gogh",
    timestamp: "2h",
    hasUnreadMessages: true,
  ),
  ChatModel(
    username: "lone_wanderer",
    profilePic: "https://i.pravatar.cc/150?img=44",
    lastMessage: "Mentioned you in their story",
    timestamp: "8h",
    isActive: true,
    hasUnreadMessages: true,
  ),
  ChatModel(
    username: "coffee_codes",
    profilePic: "https://i.pravatar.cc/150?img=60",
    lastMessage: "3+ new messages",
    timestamp: "1d",
    hasUnreadMessages: false,
  ),
];