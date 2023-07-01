import 'package:flutter/material.dart';

import '../model/book_directory.dart';
import '../model/book_model.dart';
import '../utilities/enter_route.dart';
import 'book_details_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final BookDirectory bookDirectory = BookDirectory();

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
            ...List.generate(bookDirectory.listOfBooks.length,
                ((index) => audiobookItem(bookDirectory.listOfBooks[index]))),
          ],
        ),
      ),
    );
  }

  Widget audiobookItem(Book item) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        EnterRoute(
            enterPage: BookDetailsScreen(
          bookDetail: item,
        )),
      ),
      child: Padding(
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
      ),
    );
  }
}
