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
  bool _canSubmit = false;

  void _textInputListener() {
    if (_controller.text.isEmpty && _canSubmit == true) {
      setState(() => _canSubmit = false);
    } else if (_controller.text.isNotEmpty && _canSubmit == false) {
      setState(() => _canSubmit = true);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_textInputListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_textInputListener);
    _controller.dispose();
    super.dispose();
  }

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
            backgroundColor:
                _canSubmit ? Colors.lightGreenAccent : Colors.transparent,
            iconData: Icons.send,
            onPressed: () {
              if (_canSubmit &&
                  widget.submitMessageCallback != null &&
                  _controller.text.isNotEmpty) {
                widget.submitMessageCallback!(_controller.text);
                _controller.clear();
                setState(() {
                  _canSubmit = false;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
