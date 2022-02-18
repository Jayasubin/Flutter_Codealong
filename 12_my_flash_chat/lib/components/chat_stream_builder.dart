import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_flash_chat/screens/chat_screen.dart';

import 'message_container.dart';

class ChatStreamBuilder extends StatelessWidget {
  ChatStreamBuilder({required this.inputStream});

  final Stream<QuerySnapshot> inputStream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: inputStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final messages = snapshot.data.docs.reversed;
            List<MessageContainer> widgets = [];

            try {
              for (var message in messages) {
                final text = message.data()['message'];
                final senderID = message.data()['senderID'];

                final messageWidget = MessageContainer(
                    sender: senderID,
                    text: text,
                    isMe: (senderID == loggedInUser.email));
                widgets.add(messageWidget);
              }
            } catch (e) {
              rethrow;
            }

            return Expanded(
              child: ListView(
                reverse: true,
                children: widgets,
              ),
            );
          } else if (snapshot.hasError) {
            return const Icon(Icons.error_outline);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
