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
  final _messages = List<MessageModel>.generate(
    20,
    (index) => MessageModel(
      senderName: 'Lastname',
      initials: 'FL',
      message:
          'Lorem ipsum dolor sit amet, consectetur ipsum dolor sit amet, consecteturipsum dolor sit amet',
      date: DateTime.now(),
      alignment:
          index % 2 == 0 ? MessageAlignment.left : MessageAlignment.right,
    ),
  );

  int _currentTabIndex = 0;

  late final _tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: _currentTabIndex,
  );

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MessageBottomBar(),
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
