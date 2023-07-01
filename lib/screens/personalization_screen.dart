import 'package:audiobook/screens/navigation_bar.dart';
import 'package:audiobook/screens/personalization_complete_screen.dart';
import 'package:flutter/material.dart';

import '../utilities/enter_route.dart';

class PersonalizationScreen extends StatefulWidget {
  const PersonalizationScreen({super.key});

  @override
  State<PersonalizationScreen> createState() => _PersonalizationScreenState();
}

class _PersonalizationScreenState extends State<PersonalizationScreen> {
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

  List<String> choosenTopic = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E29),
      body: Stack(
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
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Personalize Suggestion',
                  style: TextStyle(
                    color: Color(0xFFF5F5FA),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                const SizedBox(
                  width: 287,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Choose ',
                          style: TextStyle(
                            color: Color(0xFFF5F5FA),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'min. 3 topic',
                          style: TextStyle(
                            color: Color(0xFFF5F5FA),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' you like, we will give you more often that relate to it.',
                          style: TextStyle(
                            color: Color(0xFFF5F5FA),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.057,
                ),
                Container(
                  width: 295,
                  height: 53,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1C1C4D),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          choosenTopic.isNotEmpty
                              ? choosenTopic.join(", ")
                              : 'Placeholder',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF6A6A8B),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                SizedBox(
                  width: 295,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 10,
                    children: [
                      ...List.generate(listOfTopic.length,
                          (index) => topicItem(listOfTopic[index])),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: choosenTopic.isNotEmpty
                      ? Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: choosenTopic.length.toString(),
                                style: const TextStyle(
                                  color: Color(0xFFF5F5FA),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const TextSpan(
                                text: ' topics Selected',
                                style: TextStyle(
                                  color: Color(0xFFF5F5FA),
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        )
                      : null,
                ),
                GestureDetector(
                  onTap: () => choosenTopic.isNotEmpty
                      ? Navigator.of(context).pushAndRemoveUntil(
                          EnterRoute(
                              enterPage: const PersonalizationCompleteScreen()),
                          (Route<dynamic> route) => false)
                      : null,
                  child: Opacity(
                    opacity: choosenTopic.isNotEmpty ? 1 : 0.50,
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
                                'Submit',
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
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushAndRemoveUntil(
                      EnterRoute(enterPage: const NavigationBarScreen()),
                      (Route<dynamic> route) => false),
                  child: Container(
                    width: 295,
                    height: 56,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'Skip',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget topicItem(String topic) {
    return GestureDetector(
      onTap: () => setState(() {
        choosenTopic.contains(topic)
            ? choosenTopic.remove(topic)
            : choosenTopic.add(topic);
      }),
      child: Container(
        height: 29,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: ShapeDecoration(
          color: choosenTopic.contains(topic) ? const Color(0xFF4838D1) : null,
          shape: RoundedRectangleBorder(
            side: choosenTopic.contains(topic)
                ? const BorderSide(width: 1)
                : const BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(24),
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
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
