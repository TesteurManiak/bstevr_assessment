import 'package:chat_screen/models/message_model.dart';
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

  int _currentTabIndex = 0;

  late final _tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: _currentTabIndex,
  );

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
          message: 'random user message',
          date: DateTime.now(),
          alignment: MessageAlignment.left,
        ),
      );
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MessageBottomBar(
        submitMessageCallback: _submitMessage,
        addMessageCallback: _addMessage,
      ),
      body: NestedScrollView(
        body: ListView(
          children: [
            ..._messages
                .map<Widget>((message) => MessageBubble(message))
                .toList(),
          ],
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {},
            ),
            title: Text(
              'FAMILY',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            bottom: TabBar(
              indicatorColor: Colors.lightGreenAccent,
              controller: _tabController,
              onTap: (index) => setState(() => _currentTabIndex = index),
              tabs: const [
                Text(
                  'CHAT',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'SUGGESTIONS',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
