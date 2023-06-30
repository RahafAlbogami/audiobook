class Book {
  final String poster;
  final String bookCover;
  final String title;
  final String authoer;
  final String rate;
  final List<String> tags;
  final String summary;
  final String audioUrl;
  final bool isRecommended;

  Book(
      {required this.poster,
      required this.bookCover,
      required this.title,
      required this.authoer,
      required this.rate,
      required this.tags,
      required this.summary,
      required this.audioUrl,
      required this.isRecommended});
}
