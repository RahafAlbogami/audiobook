import 'package:audiobook/model/book_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


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

  List<String> listOfPoster = [
    "asset/image/Image Placeholder 1.png",
    "asset/image/Image Placeholder 3.jpg",
    "asset/image/Image Placeholder 1.png",
    "asset/image/Image Placeholder 3.jpg",
    "asset/image/Image Placeholder 1.png",
    "asset/image/Image Placeholder 3.jpg"
  ];

  List<Book> listOfBooks = [
    Book(
      poster: "asset/image/Image Placeholder 1.png",
      bookCover: "asset/image/book cover 1.png",
      title: "Title",
      authoer: "Title",
    ),
    Book(
      poster: "asset/image/Image Placeholder 3.jpg",
      bookCover: "asset/image/book cover 1.png",
      title: "Title",
      authoer: "Title",
    ),
    Book(
      poster: "asset/image/Image Placeholder 1.png",
      bookCover: "asset/image/book cover 1.png",
      title: "Title",
      authoer: "Title",
    ),
    Book(
      poster: "asset/image/Image Placeholder 3.jpg",
      bookCover: "asset/image/book cover 1.png",
      title: "Title",
      authoer: "Title",
    ),
    Book(
      poster: "asset/image/Image Placeholder 1.png",
      bookCover: "asset/image/book cover 1.png",
      title: "Title",
      authoer: "Title",
    )
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
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 20.0, bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Categories',
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
                      ...List.generate(listOfPoster.length,
                          (index) => recommendedItem(listOfPoster[index])),
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
                    children: [bestSellerItem(), bestSellerItem()],
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
                    newRelease(listOfBooks[0].bookCover),
                    newRelease(listOfBooks[0].bookCover),
                    newRelease(listOfBooks[0].bookCover),
                    newRelease(listOfBooks[0].bookCover),
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
                    newRelease(listOfBooks[0].bookCover),
                    newRelease(listOfBooks[0].bookCover),
                    newRelease(listOfBooks[0].bookCover),
                    newRelease(listOfBooks[0].bookCover),
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
    return Padding(
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
    );
  }

  Widget recommendedItem(String poster) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 6, 0),
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
                  image: AssetImage(poster),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bestSellerItem() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 6, 0),
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
                      image: const DecorationImage(
                        image:
                            AssetImage("asset/image/Image Placeholder 2.png"),
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
                  children: const [
                    SizedBox(
                      width: 155,
                      child: Text(
                        'Light Mage',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    SizedBox(
                      width: 155,
                      child: Text(
                        'Laurie Forest',
                        style: TextStyle(
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
                const SizedBox(height: 10),
                const SizedBox(
                  width: 155,
                  child: Text(
                    '1,000+ Listeners',
                    style: TextStyle(
                      color: Color(0xFFEBEBF5),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget newRelease(String bookCover) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
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
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(bookCover),
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
          const SizedBox(
            width: 160,
            child: Text(
              'The Black Witch',
              style: TextStyle(
                color: Color(0xFFF5F5FA),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
