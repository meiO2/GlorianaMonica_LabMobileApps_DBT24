import '../models/chat_model.dart';
import '../data/contact_data.dart'; 

List<Chat> chatdata = [
  Chat(
    id: 'chat1',
    contact: dummyContacts[0], // This is 'Klein'
    lastMessage: 'Yo! You online?',
    time: '12:00 PM',
    unreadCount: 1,
  ),
  Chat(
    id: 'chat2',
    contact: dummyContacts[1], // This is 'Grace'
    lastMessage: 'See you at the meeting.',
    time: 'Yesterday',
  ),
  Chat(
    id: 'chat2',
    contact: dummyContacts[2],
    lastMessage: 'Okay',
    time: 'Yesterday',
  ),
];