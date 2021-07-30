import 'package:chat_screen/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel messageModel;

  MessageBubble(this.messageModel);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final spacing = SizedBox(width: size.width / 6);
    final avatar = Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: Text(
        messageModel.initials,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (messageModel.alignment == MessageAlignment.left) avatar,
          if (messageModel.alignment == MessageAlignment.right) spacing,
          Expanded(
            child: Align(
              alignment: messageModel.alignment.toMaterialAlignment(),
              child: Column(
                crossAxisAlignment:
                    messageModel.alignment == MessageAlignment.left
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          if (messageModel.alignment == MessageAlignment.left)
                            TextSpan(
                              text: '${messageModel.senderName}\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          TextSpan(text: messageModel.message),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    DateFormat.Hm().format(messageModel.date),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (messageModel.alignment == MessageAlignment.right) avatar,
          if (messageModel.alignment == MessageAlignment.left) spacing,
        ],
      ),
    );
  }
}
