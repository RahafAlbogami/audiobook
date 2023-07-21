import 'dart:ui';

import 'package:audiobook/modelSheet/chapters_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../model/book_model.dart';

class AudioPlayerScreen extends StatefulWidget {
  final Book bookDetail;
  const AudioPlayerScreen({super.key, required this.bookDetail});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  AudioPlayer audioPlayer = AudioPlayer()
    ..setPlayerMode(PlayerMode.mediaPlayer);
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  int currentChapter = 0;
  int maxChapters = 0;
  int minChapters = 0;
  int currentSpeed = 1;
  int selectedChapter = 0;

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  void initState() {
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((event) {
      if (mounted) {
        setState(() {
          isPlaying = event == PlayerState.playing;
        });
      }
    });

    audioPlayer.onDurationChanged.listen((event) {
      if (mounted) {
        setState(() {
          duration = event;
        });
      }
    });

    audioPlayer.onPositionChanged.listen((event) {
      if (mounted) {
        setState(() {
          position = event;
        });
      }
    });

    audioPlayer.onPlayerComplete.listen((event) {
      if (mounted) {
        if (currentChapter < maxChapters) {
          setState(() {
            currentChapter = currentChapter + 1;
          });
          changeAudio(currentChapter);
        }
      }
    });
  }

  Future setAudio() async {
    String url = widget.bookDetail.chapters[currentChapter].chapterUrl;

    if (mounted) {
      setState(() {
        maxChapters = widget.bookDetail.chapters.length - 1;
      });
    }
    await audioPlayer.play(UrlSource(url));
  }

  Future changeAudio(int chapterIndex) async {
    String url = widget.bookDetail.chapters[chapterIndex].chapterUrl;
    //audioPlayer.setSourceUrl(url);

    setState(() {
      duration = Duration.zero;
      position = Duration.zero;
    });

    await audioPlayer.play(UrlSource(url));
  }

  Future speedAudio() async {
    if (currentSpeed == 2) {
      await audioPlayer.setPlaybackRate(1);
      setState(() {
        currentSpeed = 1;
      });
    } else {
      await audioPlayer.setPlaybackRate(2);
      setState(() {
        currentSpeed = 2;
      });
    }
    audioPlayer.resume();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E29),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xFF0E0E29),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.bookDetail.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
        onTap: (value) async {
          // Respond to item press.

          if (value == 1) {
            selectedChapter = await ChaptersBottomSheet()
                .buildBottomsheet(context, widget.bookDetail.chapters);

            setState(() {
              currentChapter = selectedChapter;
            });
            await changeAudio(currentChapter);
          } else if (value == 2) {
            await speedAudio();
          }
        },
        items: [
          BottomNavigationBarItem(
            label: 'Bookmark',
            icon: Column(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset("asset/image/Bookmark.png"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                )
              ],
            ),
          ),
          BottomNavigationBarItem(
            label: 'Chapters',
            icon: Column(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset("asset/image/Paper.png"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                )
              ],
            ),
          ),
          BottomNavigationBarItem(
            label: currentSpeed == 1 ? "Speed 2x" : "Speed 1x",
            icon: Column(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset("asset/image/Time Square.png"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                )
              ],
            ),
          ),
          BottomNavigationBarItem(
            label: 'Download',
            icon: Column(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset("asset/image/Arrow - Down Square.png"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                )
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 20.0, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 319,
                height: 335,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.bookDetail.bookCover),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.0)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 319,
                        height: 319,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.bookDetail.bookCover),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.045,
              ),
              Text(
                widget.bookDetail.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Opacity(
                opacity: 0.50,
                child: Text(
                  widget.bookDetail.authoer,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Slider(
                min: 0,
                max: (duration.inSeconds.toDouble() + 300),
                value: position.inSeconds.toDouble(),
                activeColor: const Color(0xFF4838D1),
                inactiveColor: const Color(0xFFDDD7FC),
                thumbColor: const Color(0xFF4838D1),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);

                  await audioPlayer.resume();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatTime(position),
                      style: const TextStyle(
                        color: Color(0xFF9292A2),
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      formatTime(duration - position),
                      style: const TextStyle(
                        color: Color(0xFF9292A2),
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("asset/image/Volume Up.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (currentChapter > minChapters) {
                          setState(() {
                            currentChapter = currentChapter - 1;
                          });
                          await changeAudio(currentChapter);
                        }
                      },
                      child: Opacity(
                        opacity: currentChapter > minChapters ? 1 : 0.5,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "asset/image/Arrow - Left Circle.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          await audioPlayer.resume();
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: isPlaying
                                ? const AssetImage("asset/image/pause.png")
                                : const AssetImage("asset/image/Play2.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (currentChapter < maxChapters) {
                          setState(() {
                            currentChapter = currentChapter + 1;
                          });
                          await changeAudio(currentChapter);
                        }
                      },
                      child: Opacity(
                        opacity: currentChapter < maxChapters ? 1 : 0.5,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "asset/image/Arrow - Right Circle.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("asset/image/Upload.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  widget.bookDetail.chapters[currentChapter].chapterName,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: const TextStyle(
                    color: Color(0xFF9292A2),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
