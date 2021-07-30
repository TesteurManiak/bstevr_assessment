class ChatModel {
  final String author;
  final int numberOfViews;
  final String? title;
  final String source;

  ChatModel({
    required this.author,
    required this.numberOfViews,
    this.title,
    required this.source,
  });
}
