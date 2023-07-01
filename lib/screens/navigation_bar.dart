import 'package:audiobook/screens/home_screen.dart';
import 'package:audiobook/screens/library_screen.dart';
import 'package:audiobook/screens/search_screen.dart';
import 'package:flutter/material.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const LibraryScreen()
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0E0E29),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/image/Logo Small.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        title: const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Audi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: 'Books',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w300,
                ),
              ),
              TextSpan(
                text: '.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: SizedBox(
              width: 30,
              height: 30,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("asset/image/Setting.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xFF0E0E29),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xFF0E0E29),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        elevation: 0,
        selectedLabelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Color(0xFFBBB1FA),
          fontSize: 10,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        onTap: (value) {
          // Respond to item press.
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              icon: _currentIndex == 0
                  ? Column(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset("asset/image/Home-fill.png"),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        )
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset("asset/image/Home.png"),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        )
                      ],
                    )),
          BottomNavigationBarItem(
            label: 'Search',
            icon: _currentIndex == 1
                ? Column(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.asset("asset/image/Search-fill.png"),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      )
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.asset("asset/image/Search.png"),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      )
                    ],
                  ),
          ),
          BottomNavigationBarItem(
            label: 'Library',
            icon: _currentIndex == 2
                ? Column(
                    children: [
                      SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset("asset/image/Document-fill.png")),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      )
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Image.asset("asset/image/Document.png"),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      )
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
