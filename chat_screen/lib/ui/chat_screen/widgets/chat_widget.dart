import 'package:chat_screen/models/chat_model.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final ChatModel chatModel;
  final double maxHeight;

  ChatWidget(this.chatModel, this.maxHeight);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cardWidth = size.width / 3.4;
    return SizedBox(
      height: maxHeight,
      width: cardWidth,
      child: Column(
        children: [
          Flexible(
            child: Stack(
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: cardWidth,
                    minWidth: cardWidth,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  width: cardWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (chatModel.title != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              chatModel.title!,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        Row(
                          children: [
                            Text(
                              chatModel.numberOfViews.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            const Icon(Icons.person,
                                color: Colors.white, size: 12),
                            Expanded(child: Container()),
                            Text(
                              chatModel.source,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            chatModel.author,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
