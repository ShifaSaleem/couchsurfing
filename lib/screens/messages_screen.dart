import 'package:flutter/material.dart';

import '../models/dummy_data.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messages')),
      body: ListView.builder(
        itemCount: DummyData.messages.length,
        itemBuilder: (context, index) {
          final message = DummyData.messages[index];
          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(message.photo)),
            title: Text(message.name),
            subtitle: Text(message.lastMessage),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(chatId: message.chatId, userName: message.name),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
