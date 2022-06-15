import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/bottom.dart';
import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';
import 'chat.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: const Bottom(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border:
                          Border.all(color: const Color(0xfff1f5f6), width: 2),
                      color: Colors.transparent,
                    ),
                    height: height / 19,
                    width: width / 8,
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: notifire.getdarkscolor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 20,
                ),
                Text(
                  CustomStrings.message,
                  style: TextStyle(
                      color: notifire.getdarkscolor,
                      fontFamily: 'Gilroy Bold',
                      fontSize: height / 43),
                ),
              ],
            ),
            SizedBox(
              height: height / 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: serchfild(),
            ),
            SizedBox(
              height: height / 25,
            ),
            chts("image/p1.png"),
            SizedBox(
              height: height / 70,
            ),
            chats(
              "image/p2.png",
              CustomStrings.wow,
              CustomStrings.thx,
            ),
            SizedBox(
              height: height / 70,
            ),
            chts("image/p3.png"),
            SizedBox(
              height: height / 70,
            ),
            chats(
              "image/p4.png",
              CustomStrings.lucy,
              CustomStrings.thx,
            ),
            SizedBox(
              height: height / 70,
            ),
            chts("image/p1.png"),
            SizedBox(
              height: height / 70,
            ),
            chats("image/p2.png", CustomStrings.lucy, CustomStrings.thx),
            SizedBox(
              height: height / 70,
            ),
          ],
        ),
      ),
    );
  }

  Widget chts(img) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const Chat(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: height / 10,
              width: width,
              decoration: BoxDecoration(
                color: notifire.getbcolor,
                border: Border.all(color: notifire.getbcolor),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: width / 25),
                child: Row(
                  children: [
                    Image.asset(
                      img,
                      height: height / 15,
                    ),
                    SizedBox(
                      width: width / 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height / 100,
                        ),
                        Text(
                          CustomStrings.rocks,
                          style: TextStyle(
                            fontSize: height / 47,
                            fontFamily: 'Gilroy Bold',
                            color: notifire.getdarkscolor,
                          ),
                        ),
                        SizedBox(
                          height: height / 100,
                        ),
                        const Text(
                          CustomStrings.way,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Gilroy Medium',
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: height / 17,
                      width: width / 17,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: notifire.getprocolor,
                      ),
                      child: Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                            fontSize: height / 60,
                            fontFamily: 'Gilroy Bold',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget serchfild() {
    return Container(
      color: Colors.transparent,
      height: 40,
      child: TextField(
        style: TextStyle(color: notifire.getdarkscolor),
        decoration: InputDecoration(
          labelText: CustomStrings.search,
          labelStyle: const TextStyle(color: Colors.grey),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          suffixIcon: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                "image/search.png",
                color: notifire.getprocolor,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: notifire.getprocolor, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget chats(img, name1, name2) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const Chat(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: height / 13,
              width: width,
              decoration: BoxDecoration(
                color: notifire.getbcolor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: width / 25),
                child: Row(
                  children: [
                    Image.asset(
                      img,
                      height: height / 15,
                    ),
                    SizedBox(
                      width: width / 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height / 100,
                        ),
                        Text(
                          name1,
                          style: TextStyle(
                            fontSize: height / 47,
                            fontFamily: 'Gilroy Bold',
                            color: notifire.getdarkscolor,
                          ),
                        ),
                        SizedBox(
                          height: height / 200,
                        ),
                        Text(
                          name2,
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Gilroy Medium',
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
