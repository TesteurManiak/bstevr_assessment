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
    final appBarTheme = Theme.of(context).appBarTheme;
    final scale = 1 - shrinkOffset / maxExtent;
    final isSemiCollapsed = scale < 0.75;
    return Container(
      decoration: BoxDecoration(
        color: appBarTheme.backgroundColor,
        boxShadow: [
          if (appBarTheme.elevation != null && appBarTheme.elevation! > 0)
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 6,
              offset: Offset(0, appBarTheme.elevation!),
            )
        ],
      ),
      child: TabBarView(
        controller: tabController,
        children: [
          ChatTabView(isSemiCollapsed, maxExtent * scale),
          SuggestionsTabView(),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate _) => true;
}
