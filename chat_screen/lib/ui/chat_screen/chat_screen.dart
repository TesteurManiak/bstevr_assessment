import 'package:chat_screen/models/message_model.dart';
import 'package:chat_screen/ui/chat_screen/widgets/chat_app_bar.dart';
import 'package:chat_screen/ui/chat_screen/widgets/message_bottom_bar.dart';
import 'package:chat_screen/ui/chat_screen/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  final _messages = <MessageModel>[];

  void _submitMessage(String message) {
    setState(() {
      _messages.add(MessageModel(
        senderName: 'Current User',
        initials: 'CU',
        message: message,
        date: DateTime.now(),
        alignment: MessageAlignment.right,
      ));
    });
  }

  void _addMessage() {
    setState(() {
      _messages.add(
        MessageModel(
          senderName: 'Random User',
          initials: 'RU',
          message:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum in efficitur ipsum. Donec ultrices ut sapien non hendrerit. Suspendisse nunc.',
          date: DateTime.now(),
          alignment: MessageAlignment.left,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MessageBottomBar(
        submitMessageCallback: _submitMessage,
        addMessageCallback: _addMessage,
      ),
      body: CustomScrollView(
        slivers: [
          ChatAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              ..._messages
                  .map<Widget>((message) => MessageBubble(message))
                  .toList(),
            ]),
          ),
        ],
      ),
    );
  }
}
