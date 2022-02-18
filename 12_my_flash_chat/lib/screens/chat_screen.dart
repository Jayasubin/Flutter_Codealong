import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_flash_chat/components/chat_stream_builder.dart';

import '/components/logout_alert.dart';
import '/screens/welcome_screen.dart';
import '/constants.dart';

final _database = FirebaseFirestore.instance;
late User loggedInUser;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static String screenID = 'chat_Screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _ChatScreenState();

  final _authProvider = FirebaseAuth.instance;
  TextEditingController textCont = TextEditingController();
  late String message;

  Future<void> getCurrentUser() async {
    try {
      final user = _authProvider.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextButton(
              child: const Text(
                'Logout',
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                bool result = await showDialog(
                    context: context,
                    builder: (BuildContext context) => const LogoutAlert());

                if (result) {
                  _authProvider.signOut();
                  Navigator.popAndPushNamed(context, WelcomeScreen.screenID);
                } else {}
              },
            ),
          ),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ChatStreamBuilder(
                inputStream: _database.collection('my_flash_chat').snapshots(),
              ),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: textCont,
                        onChanged: (value) {
                          message = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        textCont.clear();
                        _database.collection('my_flash_chat').add({
                          'senderID': loggedInUser.email,
                          'message': message,
                        });
                      },
                      child: const Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
