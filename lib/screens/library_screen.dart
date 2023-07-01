import 'package:flutter/material.dart';

import '../model/book_model.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  List<Book> listOfBooks = [
    Book(
        poster: "asset/image/theLastWhish.jpg",
        bookCover: "asset/image/theLastWhishBookCover.jpg",
        title: "The Last Wish",
        authoer: "Andrzej Sapkowski",
        rate: "4.0",
        tags: ["Fantasy", "Drama", "Fiction"],
        summary:
            "Geralt the Witcher—revered and hated—is a man whose magic powers, enhanced by long training and a mysterious elixir, have made him a brilliant fighter and a merciless assassin. Yet he is no ordinary murderer: his targets are the multifarious monsters and vile fiends that ravage the land and attack the innocent.",
        audioUrl:
            "https://free.audiobookslab.com/audio/the-last-wish-complete.mp3?_=1",
        isRecommended: true,
        chapters: [
          Chapters(
              chapterId: 1,
              chapterName: "First Chapter",
              chapterUrl:
                  "https://free.audiobookslab.com/audio/the-last-wish-complete.mp3?_=1"),
          Chapters(
              chapterId: 2,
              chapterName: "Second Chapter",
              chapterUrl:
                  "https://free.audiobookslab.com/audio/the-last-wish-complete.mp3?_=2")
        ]),
    Book(
        poster: "asset/image/SwordOfDestiny.jpg",
        bookCover: "asset/image/SwordOfDestinyBookCover.jpg",
        title: "Sword of Destiny",
        authoer: "Andrzej Sapkowski",
        rate: "4.0",
        tags: ["Fantasy", "Drama", "Fiction"],
        summary:
            "Geralt is a witcher, a man whose magic powers, enhanced by long training and a mysterious elixir, have made him a brilliant fighter and a merciless assassin. Yet he is no ordinary murderer: his targets are the multifarious monsters and vile fiends that ravage the land and attack the innocent.",
        audioUrl:
            "https://ipaudio.club/wp-content/uploads/HQ/TRECIA/Sword%20of%20Destiny/01.mp3?_=1",
        isRecommended: true,
        chapters: [
          Chapters(
              chapterId: 1,
              chapterName: "First Chapter",
              chapterUrl:
                  "https://free.audiobookslab.com/audio/the-last-wish-complete.mp3?_=1"),
          Chapters(
              chapterId: 2,
              chapterName: "Second Chapter",
              chapterUrl:
                  "https://free.audiobookslab.com/audio/the-last-wish-complete.mp3?_=2")
        ]),
    Book(
        poster: "asset/image/bloodOfElves.jpg",
        bookCover: "asset/image/bloodOfElvesBookCover.jpg",
        title: "Blood of Elves",
        authoer: "Andrzej Sapkowski",
        rate: "4.0",
        tags: ["Fantasy", "Drama", "Fiction"],
        summary:
            "For over a century, humans, dwarves, gnomes, and elves have lived together in relative peace. But times have changed, the uneasy peace is over, and now the races are fighting once again. The only good elf, it seems, is a dead elf.",
        audioUrl:
            "https://ipaudio6.com/wp-content/uploads/BOOKAUDIO/Blood%20of%20Elves/1.mp3?_=1",
        isRecommended: true,
        chapters: [
          Chapters(
              chapterId: 1,
              chapterName: "First Chapter",
              chapterUrl:
                  "https://free.audiobookslab.com/audio/the-last-wish-complete.mp3?_=1"),
          Chapters(
              chapterId: 2,
              chapterName: "Second Chapter",
              chapterUrl:
                  "https://free.audiobookslab.com/audio/the-last-wish-complete.mp3?_=2")
        ])
  ];

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return true;
      },
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 0),
        child: ListView(
          children: [
            const Text(
              'Explore',
              style: TextStyle(
                color: Color(0xFFF5F5FA),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.018,
            ),
            Container(
              width: 335,
              height: 53,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: ShapeDecoration(
                color: const Color(0xFF1C1C4D),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Search Books or Author...',
                    style: TextStyle(
                      color: Color(0xFF6A6A8B),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            ...List.generate(listOfBooks.length,
                ((index) => audiobookItem(listOfBooks[index]))),
          ],
        ),
      ),
    );
  }

  Widget audiobookItem(Book item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item.bookCover),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: 215,
                child: Text(
                  item.title,
                  style: const TextStyle(
                    color: Color(0xFFF5F5FA),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                width: 215,
                child: Text(
                  item.authoer,
                  style: const TextStyle(
                    color: Color(0xFFEBEBF5),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
