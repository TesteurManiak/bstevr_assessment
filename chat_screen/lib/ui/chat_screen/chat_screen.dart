import 'package:chat_screen/models/message_model.dart';
import 'package:chat_screen/ui/chat_screen/widgets/custom_header.dart';
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

  late final _tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: _currentTabIndex,
  );

  int _currentTabIndex = 0;

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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: MessageBottomBar(
        submitMessageCallback: _submitMessage,
        addMessageCallback: _addMessage,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            leading: BackButton(),
            title: const Text(
              'FAMILY',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: const Text(
                '6 Members',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: TabBar(
                indicatorColor: Colors.lightGreenAccent,
                controller: _tabController,
                tabs: const <Widget>[
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
                  ),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: CustomHeader(
              maxExtent: size.height / 3,
              minExtent: size.height / 4.5,
              tabController: _tabController,
            ),
            pinned: true,
          ),
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
