import 'package:audiobook/model/book_model.dart';
import 'package:audiobook/model/book_directory.dart';

import 'package:audiobook/screens/book_details_screen.dart';
import 'package:flutter/material.dart';

import '../utilities/enter_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final  BookDirectory bookDirectory = BookDirectory();
  List<String> listOfTopic = [
    "Art",
    "Business",
    "Biography",
    "Comedy",
    "Culture",
    "Education",
    "News",
    "Philosophy",
    "Psychology",
    "Technology",
    "Travel"
  ];

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return true;
      },
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 20.0, bottom: 5),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    color: Color(0xFFF5F5FA),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.016,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.056,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(listOfTopic.length,
                          (index) => categoryItem(listOfTopic[index])),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 35.0, bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Recommended For You',
                      style: TextStyle(
                        color: Color(0xFFF5F5FA),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'See more',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFFBBB1FA),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.016,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.39,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                          bookDirectory.listOfBooks
                              .where((i) => i.isRecommended)
                              .toList()
                              .length,
                          (index) => recommendedItem( bookDirectory.listOfBooks
                              .where((i) => i.isRecommended)
                              .toList()[index])),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 35.0, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Best Seller',
                      style: TextStyle(
                        color: Color(0xFFF5F5FA),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'See more',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFFBBB1FA),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SizedBox(
                  height: 135,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                          bookDirectory.listOfBooks
                              .where((i) => !i.isRecommended)
                              .toList()
                              .length,
                          (index) => bestSellerItem(bookDirectory.listOfBooks
                              .where((i) => !i.isRecommended)
                              .toList()[index])),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 35.0, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'New Releases',
                      style: TextStyle(
                        color: Color(0xFFF5F5FA),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'See more',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFFBBB1FA),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...List.generate(
                        bookDirectory.listOfBooks
                            .where((i) => i.isRecommended)
                            .toList()
                            .length,
                        (index) => newRelease(bookDirectory.listOfBooks
                            .where((i) => i.isRecommended)
                            .toList()[index])),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 15.0, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Trending Now',
                      style: TextStyle(
                        color: Color(0xFFF5F5FA),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'See more',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFFBBB1FA),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...List.generate(
                        bookDirectory.listOfBooks
                            .where((i) => !i.isRecommended)
                            .toList()
                            .length,
                        (index) => newRelease(bookDirectory.listOfBooks
                            .where((i) => !i.isRecommended)
                            .toList()[index])),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget categoryItem(String topic) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: const Color(0xFF2E2E5D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                topic,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget recommendedItem(Book item) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 6, 0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          EnterRoute(
              enterPage: BookDetailsScreen(
            bookDetail: item,
          )),
        ),
        child: SizedBox(
          width: 200,
          height: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(item.poster),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bestSellerItem(Book item) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 6, 0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          EnterRoute(
              enterPage: BookDetailsScreen(
            bookDetail: item,
          )),
        ),
        child: Container(
          width: 350,
          height: 135,
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: const Color(0xFF2E2E5D),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.50, color: Color(0xFF0E0E29)),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage(item.bookCover),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 190,
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: 155,
                        child: Text(
                          item.authoer,
                          style: const TextStyle(
                            color: Color(0xFFEBEBF5),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: Image.asset("asset/image/star-filled.png"),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: Image.asset("asset/image/star-filled.png"),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: Image.asset("asset/image/star-filled.png"),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: Image.asset("asset/image/star-filled.png"),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: Image.asset("asset/image/star-outlined.png"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget newRelease(Book item) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          EnterRoute(
              enterPage: BookDetailsScreen(
            bookDetail: item,
          )),
        ),
        child: Column(
          children: [
            SizedBox(
              width: 160,
              height: 160,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 160,
                    height: 160,
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            SizedBox(
              width: 160,
              child: Text(
                item.title,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFFF5F5FA),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
