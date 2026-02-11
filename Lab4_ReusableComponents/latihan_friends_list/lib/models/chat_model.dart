import 'contact_model.dart';

class Chat {
  final String id;
  final Contact contact; // Nesting the contact model here
  final String lastMessage;
  final String time;
  final int unreadCount;

  const Chat({
    required this.id,
    required this.contact,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
  });
}