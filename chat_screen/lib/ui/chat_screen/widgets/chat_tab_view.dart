import 'package:chat_screen/models/chat_model.dart';
import 'package:chat_screen/ui/chat_screen/widgets/chat_widget.dart';
import 'package:flutter/material.dart';

class ChatTabView extends StatelessWidget {
  final bool isCollapsed;

  ChatTabView(this.isCollapsed);

  final _chats = List<ChatModel>.generate(
    10,
    (index) => ChatModel(
      author: 'Firstname',
      numberOfViews: 3,
      title: index % 2 == 0
          ? 'Lorem ipsum Title is Solor Quis Per Num of Lines'
          : null,
      source: index % 2 == 0 ? 'espn.com' : 'Gif',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
      scrollDirection: Axis.horizontal,
      itemCount: _chats.length,
      separatorBuilder: (_, __) => const SizedBox(width: 8),
      itemBuilder: (_, index) => ChatWidget(_chats[index]),
    );
  }
}
