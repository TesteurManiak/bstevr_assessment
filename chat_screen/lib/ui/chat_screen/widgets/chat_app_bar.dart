import 'dart:async';

import 'package:chat_screen/ui/chat_screen/widgets/custom_header.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatAppBarState();
}

class _ChatAppBarState extends State<ChatAppBar>
    with SingleTickerProviderStateMixin {
  int _currentTabIndex = 0;

  final _appBarHeightController = StreamController<double>();

  late final _tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: _currentTabIndex,
  );

  @override
  void dispose() {
    _tabController.dispose();
    _appBarHeightController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverPersistentHeader(
      delegate: CustomHeader(
        maxExtent: size.height / 3 + 95,
        minExtent: size.height / 4,
        tabController: _tabController,
      ),
      pinned: true,
    );
  }
}
