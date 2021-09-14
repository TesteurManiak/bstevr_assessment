import 'package:chat_screen/ui/chat_screen/widgets/chat_tab_view.dart';
import 'package:chat_screen/ui/chat_screen/widgets/suggestions_tab_view.dart';
import 'package:flutter/material.dart';

class CustomHeader extends SliverPersistentHeaderDelegate {
  @override
  final double maxExtent;

  @override
  final double minExtent;

  final TabController? tabController;

  CustomHeader({
    required this.maxExtent,
    required this.minExtent,
    this.tabController,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final scale = 1 - shrinkOffset / maxExtent;
    final isSemiCollapsed = scale < 0.75;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 6,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              BackButton(),
              const Text(
                'FAMILY',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          if (!isSemiCollapsed)
            Padding(
              padding: const EdgeInsets.only(left: 32, bottom: 16),
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
            controller: tabController,
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
              controller: tabController,
              children: [
                ChatTabView(isSemiCollapsed, maxExtent * scale),
                SuggestionsTabView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate _) => true;
}
