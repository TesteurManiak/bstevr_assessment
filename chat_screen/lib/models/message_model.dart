enum MessageAlignment { left, right }

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
