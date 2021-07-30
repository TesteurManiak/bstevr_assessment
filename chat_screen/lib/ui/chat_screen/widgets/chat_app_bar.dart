import 'dart:async';

import 'package:chat_screen/ui/chat_screen/widgets/chat_tab_view.dart';
import 'package:chat_screen/ui/chat_screen/widgets/suggestions_tab_view.dart';
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
    return SliverAppBar(
      floating: true,
      expandedHeight: size.height / 3 + 95,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {},
      ),
      centerTitle: false,
      title: const Text(
        'FAMILY',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
      flexibleSpace: LayoutBuilder(
        builder: (_, constraints) {
          final isSemiCollapsed = constraints.biggest.height <= size.height / 4;
          _appBarHeightController.sink.add(constraints.biggest.height);
          return FlexibleSpaceBar(
            background: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 56),
                if (!isSemiCollapsed)
                  Padding(
                    padding: const EdgeInsets.only(left: 68, bottom: 16),
                    child: const Text(
                      '6 Members',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                TabBar(
                  indicatorColor: Colors.lightGreenAccent,
                  controller: _tabController,
                  onTap: (index) => setState(() => _currentTabIndex = index),
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
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      ChatTabView(isSemiCollapsed),
                      SuggestionsTabView(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
