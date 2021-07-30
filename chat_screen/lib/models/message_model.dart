import 'package:flutter/material.dart';

enum MessageAlignment { left, right }

extension MessageAlignmentModifier on MessageAlignment {
  Alignment toMaterialAlignment() => this == MessageAlignment.left
      ? Alignment.centerLeft
      : Alignment.centerRight;
}

class MessageModel {
  final String senderName;
  final String initials;
  final String message;
  final DateTime date;
  final MessageAlignment alignment;

  MessageModel({
    required this.senderName,
    required this.initials,
    required this.message,
    required this.date,
    required this.alignment,
  });
}
