import 'package:audiobook/model/on_boarding_model.dart';
import 'package:audiobook/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../utilities/enter_route.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  bool isDotActive = false;
  int _pageIndex = 0;
  List<OnBoard> onBoardingListItem = [
    OnBoard(
        title: "Title One",
        description: 'Lorem ipsum dolor sit amet la maryame dor sut colondeum.',
        assetPath: "asset/image/Illustration.png"),
    OnBoard(
        title: "Title Two",
        description: 'Lorem ipsum dolor sit amet la maryame dor sut colondeum.',
        assetPath: "asset/image/Illustration 2.png"),
    OnBoard(
        title: "Title Three",
        description: 'Lorem ipsum dolor sit amet la maryame dor sut colondeum.',
        assetPath: "asset/image/Illustration 3.png"),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E29),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 224,
                  height: 155,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("asset/image/Ellipse 16 (Stroke).png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Container(
                    width: 85,
                    height: 132,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("asset/image/Ellipse 17.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.47,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowIndicator();
                return true;
              },
              child: PageView.builder(
                itemCount: onBoardingListItem.length,
                controller: _pageController,
                onPageChanged: (index) => {
                  setState(() => {_pageIndex = index})
                },
                itemBuilder: ((context, index) => onBoardingItem(
                    onBoardingListItem[index],
                    onBoardingListItem[index].assetPath)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: SizedBox(
              width: 60,
              height: 12,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(onBoardingListItem.length,
                      (index) => dotIndicator(index == _pageIndex)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: _pageIndex != 2
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                const WelcomeScreen(),
                            transitionDuration: const Duration(milliseconds: 600),
                            reverseTransitionDuration: Duration.zero,
                          ),
                        ),
                        child: Container(
                          width: 140,
                          height: 56,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Expanded(
                                child: SizedBox(
                                  child: Text(
                                    'Skip',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease),
                        child: Container(
                          width: 140,
                          height: 56,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF4838D1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Expanded(
                                child: SizedBox(
                                  child: Text(
                                    'Next',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : GestureDetector(
                    onTap: () => Navigator.of(context).pushAndRemoveUntil(
                        EnterRoute(enterPage: const WelcomeScreen()),
                        (Route<dynamic> route) => false),
                    child: Container(
                      width: 295,
                      height: 56,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF4838D1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                'Lets Get Started',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }

  Widget dotIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 12,
      height: 12,
      decoration: ShapeDecoration(
        color: isActive ? const Color(0xFF4838D1) : const Color(0xFF2E2E5D),
        shape: const OvalBorder(),
      ),
    );
  }

  Widget onBoardingItem(OnBoard onBoardITem, String assetDot) {
    return Column(
      children: [
        Container(
          width: 260,
          height: 260,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(assetDot),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          width: 287,
          padding: const EdgeInsets.all(8),
          child: Text(
            onBoardITem.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFF5F5FA),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          width: 287,
          padding: const EdgeInsets.all(8),
          child: Text(
            onBoardITem.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFF5F5FA),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
