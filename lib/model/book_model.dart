class Book {
  final String poster;
  final String bookCover;
  final String title;
  final String authoer;
  final int rate;
  final List<String> tags;
  final String summary;
  final String audioUrl;
  final bool isRecommended;
  final List<Chapters> chapters;

  Book(
      {required this.poster,
      required this.bookCover,
      required this.title,
      required this.authoer,
      required this.rate,
      required this.tags,
      required this.summary,
      required this.audioUrl,
      required this.isRecommended,
      required this.chapters});
}

class Chapters {
  final int chapterId;
  final String chapterName;
  final String chapterUrl;

  Chapters(
      {required this.chapterId,
      required this.chapterName,
      required this.chapterUrl});
}
