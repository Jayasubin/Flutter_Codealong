import 'package:flutter/material.dart';

class MessageContainer extends StatelessWidget {
  final String text;
  final String sender;
  final bool isMe;

  const MessageContainer({
    Key? key,
    required this.sender,
    required this.text,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                sender,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
                ),
              ),
              Material(
                borderRadius: BorderRadius.only(
                  topLeft: isMe
                      ? const Radius.circular(30)
                      : const Radius.circular(5),
                  topRight: isMe
                      ? const Radius.circular(5)
                      : const Radius.circular(30),
                  bottomLeft: const Radius.circular(30),
                  bottomRight: const Radius.circular(30),
                ),
                elevation: isMe ? 5 : 1,
                color: isMe ? Colors.blueAccent : Colors.white60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 9,
                    horizontal: 18,
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                      color: isMe ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
