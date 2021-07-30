import 'package:chat_screen/ui/chat_screen/widgets/custom_icon_btn.dart';
import 'package:flutter/material.dart';

const _kBarHeight = 100.0;

class MessageBottomBar extends StatefulWidget with PreferredSizeWidget {
  final Function()? addMessageCallback;
  final Function(String)? submitMessageCallback;

  MessageBottomBar({this.addMessageCallback, this.submitMessageCallback});

  @override
  State<StatefulWidget> createState() => _MessageBottomBarState();

  @override
  Size get preferredSize => Size.fromHeight(_kBarHeight);
}

class _MessageBottomBarState extends State<MessageBottomBar> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, -1),
            blurRadius: 3,
          )
        ],
      ),
      height: _kBarHeight,
      width: size.width,
      child: Row(
        children: [
          CustomIconBtn(
            iconData: Icons.add,
            onPressed: widget.addMessageCallback,
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Chat with the crew...',
              ),
            ),
          ),
          CustomIconBtn(
            iconData: Icons.send,
            onPressed: () {
              if (widget.submitMessageCallback != null) {
                widget.submitMessageCallback!(_controller.text);
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
