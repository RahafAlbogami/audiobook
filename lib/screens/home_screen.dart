import 'package:audiobook/model/book_model.dart';
import 'package:audiobook/screens/book_details_screen.dart';
import 'package:flutter/material.dart';

import '../utilities/enter_route.dart';

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

  List<Book> listOfBooks = [
    Book(
        poster: "asset/image/theLastWhish.jpg",
        bookCover: "asset/image/theLastWhishBookCover.jpg",
        title: "The Last Wish",
        authoer: "Andrzej Sapkowski",
        rate: "4.0",
        tags: ["Fantasy", "Drama", "Fiction"],
        summary: "Geralt the Witcher—revered and hated—is a man whose magic powers, enhanced by long training and a mysterious elixir, have made him a brilliant fighter and a merciless assassin. Yet he is no ordinary murderer: his targets are the multifarious monsters and vile fiends that ravage the land and attack the innocent.",
        audioUrl: "https://free.audiobookslab.com/audio/the-last-wish-complete.mp3?_=1",
        isRecommended: true),
    Book(
        poster: "asset/image/SwordOfDestiny.jpg",
        bookCover: "asset/image/SwordOfDestinyBookCover.jpg",
        title: "Sword of Destiny",
        authoer: "Andrzej Sapkowski",
        rate: "4.0",
        tags: ["Fantasy", "Drama", "Fiction"],
        summary: "Geralt is a witcher, a man whose magic powers, enhanced by long training and a mysterious elixir, have made him a brilliant fighter and a merciless assassin. Yet he is no ordinary murderer: his targets are the multifarious monsters and vile fiends that ravage the land and attack the innocent.",
        audioUrl: "",
        isRecommended: true),
    Book(
        poster: "asset/image/bloodOfElves.jpg",
        bookCover: "asset/image/bloodOfElvesBookCover.jpg",
        title: "Blood of Elves",
        authoer: "Andrzej Sapkowski",
        rate: "4.0",
        tags: ["Fantasy", "Drama", "Fiction"],
        summary: "For over a century, humans, dwarves, gnomes, and elves have lived together in relative peace. But times have changed, the uneasy peace is over, and now the races are fighting once again. The only good elf, it seems, is a dead elf.",
        audioUrl: "",
        isRecommended: true),
    Book(
        poster: "asset/image/timeOfContempt.jpg",
        bookCover: "asset/image/timeOfContemptBookCover.jpg",
        title: "The Time of Contempt",
        authoer: "Andrzej Sapkowski",
        rate: "4.0",
        tags: ["Fantasy", "Drama", "Fiction"],
        summary: "Geralt is a witcher: guardian of the innocent; protector of those in need; a defender, in dark times, against some of the most frightening creatures of myth and legend. His task, now, is to protect Ciri. A child of prophecy, she will have the power to change the world for good or for ill -- but only if she lives to use it.",
        audioUrl: "",
        isRecommended: true),
    Book(
        poster: "asset/image/towerOfSwallows.jpg",
        bookCover: "asset/image/towerOfSwallowsBookCover.jpg",
        title: "The Tower of Swallows",
        authoer: "Andrzej Sapkowski",
        rate: "4.0",
        tags: ["Fantasy", "Drama", "Fiction"],
        summary: "The world has fallen into war. Ciri, the child of prophecy, has vanished. Hunted by friends and foes alike, she has taken on the guise of a petty bandit and lives free for the first time in her life. But the net around her is closing. Geralt, the Witcher, has assembled a group of allies determined to rescue her. Both sides of the war have sent brutal mercenaries to hunt her down. Her crimes have made her famous.",
        audioUrl: "",
        isRecommended: true),
    Book(
        poster: "asset/image/ladyOfTheLake.jpg",
        bookCover: "asset/image/ladyOfTheLakeBookCover.jpg",
        title: "The Lady of the Lake",
        authoer: "Andrzej Sapkowski",
        rate: "4.0",
        tags: ["Fantasy", "Drama", "Fiction"],
        summary: "After walking through the portal in the Tower of Swallows while narrowly escaping death, Ciri finds herself in a completely different world... an Elven world. She is trapped with no way out. Time does not seem to exist and there are no obvious borders or portals to cross back into her home world.",
        audioUrl: "",
        isRecommended: true),
    Book(
        poster: "",
        bookCover: "asset/image/hp1_500x500._CB1198675309_.jpg",
        title: "Harry Potter and the Philosopher’s Stone",
        authoer: "J.K. Rowling",
        rate: "4.0",
        tags: ["Fantasy", "Drama", "Fiction"],
        summary: "Harry Potter thinks he is an ordinary boy - until he is rescued by an owl, taken to Hogwarts School of Witchcraft and Wizardry, learns to play Quidditch and does battle in a deadly duel. The Reason ... HARRY POTTER IS A WIZARD!",
        audioUrl: "",
        isRecommended: false),
    Book(
        poster: "",
        bookCover: "asset/image/hp2_500x500._CB1198675309_.jpg",
        title: "THarry Potter and the Chamber of Secrets",
        authoer: "J.K. Rowling",
        rate: "4.0",
        tags: ["Fantasy", "Drama", "Fiction"],
        summary: "Ever since Harry Potter had come home for the summer, the Dursleys had been so mean and hideous that all Harry wanted was to get back to the Hogwarts School for Witchcraft and Wizardry. But just as he’s packing his bags, Harry receives a warning from a strange impish creature who says that if Harry returns to Hogwarts, disaster will strike.",
        audioUrl: "",
        isRecommended: false),
    Book(
        poster: "",
        bookCover: "asset/image/Image Placeholder 4.png",
        title: "Harry Potter and the Prisoner of Azkaban",
        authoer: "J.K. Rowling",
        rate: "4.0",
        tags: ["Fantasy", "Drama", "Fiction"],
        summary: "Harry Potter, along with his best friends, Ron and Hermione, is about to start his third year at Hogwarts School of Witchcraft and Wizardry. Harry can't wait to get back to school after the summer holidays. (Who wouldn't if they lived with the horrible Dursleys?) But when Harry gets to Hogwarts, the atmosphere is tense. There's an escaped mass murderer on the loose, and the sinister prison guards of Azkaban have been called in to guard the school...",
        audioUrl: "",
        isRecommended: false),
    Book(
        poster: "",
        bookCover: "asset/image/hp6_500x500._CB1198675309_.jpg",
        title: "Harry Potter and the Half-Blood Prince",
        authoer: "J.K. Rowling",
        rate: "4.0",
        tags: ["Fantasy", "Drama", "Fiction"],
        summary: "It is the middle of the summer, but there is an unseasonal mist pressing against the windowpanes. Harry Potter is waiting nervously in his bedroom at the Dursleys' house in Privet Drive for a visit from Professor Dumbledore himself. One of the last times he saw the Headmaster was in a fierce one-to-one duel with Lord Voldemort, and Harry can't quite believe that Professor Dumbledore will actually appear at the Dursleys' of all places. Why is the Professor coming to visit him now? What is it that cannot wait until Harry returns to Hogwarts in a few weeks' time? Harry's sixth year at Hogwarts has already got off to an unusual start, as the worlds of Muggle and magic start to intertwine",
        audioUrl: "",
        isRecommended: false),
    Book(
        poster: "",
        bookCover: "asset/image/hp7_500x500._CB1198675309_.jpg",
        title: "Harry Potter and the Deathly Hallows",
        authoer: "J.K. Rowling",
        rate: "4.0",
        tags: ["Fantasy", "Drama", "Fiction"],
        summary: "Harry has been burdened with a dark, dangerous and seemingly impossible task: that of locating and destroying Voldemort's remaining Horcruxes. Never has Harry felt so alone, or faced a future so full of shadows. But Harry must somehow find within himself the strength to complete the task he has been given. He must leave the warmth, safety and companionship of The Burrow and follow without fear or hesitation the inexorable path laid out for him...",
        audioUrl: "",
        isRecommended: false)
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
                      ...List.generate(
                          listOfBooks
                              .where((i) => i.isRecommended)
                              .toList()
                              .length,
                          (index) => recommendedItem(listOfBooks
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
                          listOfBooks
                              .where((i) => !i.isRecommended)
                              .toList()
                              .length,
                          (index) => bestSellerItem(listOfBooks
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
                        listOfBooks
                            .where((i) => i.isRecommended)
                            .toList()
                            .length,
                        (index) => newRelease(listOfBooks
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
                        listOfBooks
                            .where((i) => !i.isRecommended)
                            .toList()
                            .length,
                        (index) => newRelease(listOfBooks
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
