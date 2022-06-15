import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/details.dart';
import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Popular extends StatefulWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
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
                    Navigator.pop(context);
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
                  CustomStrings.popular,
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
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Column(
                children: [
                  popular("image/wash4.png", CustomStrings.cl,"image/wash5.png", CustomStrings.sl,),
                  SizedBox(height: height / 100,),
                  popular("image/wash6.png", CustomStrings.wow,"image/wash4.png", CustomStrings.cl,),SizedBox(height: height / 100,),
                  popular("image/wash5.png", CustomStrings.sl,"image/wash6.png", CustomStrings.wow,),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget popular(img,name,img2,name2){
    return Row(
      children: [
        Container(
          color: Colors.transparent,
          height: height / 4,
          child: Card(
            child: Container(
              color: notifire.getprimerycolor,
              height: height / 3,
              width: width / 2.4,
              child: events(img,name),),
          ),
        ),
        const Spacer(),
        Container(
          color: Colors.transparent,
          height: height / 4,
          child: Card(
            child: Container(
              color:notifire.getprimerycolor,
              height: height / 3,
              width: width / 2.4,
              child: events(img2,name2),),
          ),
        ),
      ],
    );
  }

  Widget events(img, name) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: const Details(),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width / 50, vertical: width / 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height / 8,
              width: width / 1,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: height / 100,
            ),
            Text(
              name,
              style: TextStyle(
                  fontFamily: 'Gilroy Bold',
                  color: notifire.getdarkscolor,
                  fontSize: height / 50,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: height / 100,),
            Row(
              children: [
                Image.asset(
                  "image/location.png",
                  height: height / 45,
                  color: Colors.grey,
                ),
                Text(
                  CustomStrings.location,
                  style: TextStyle(
                    fontFamily: 'Gilroy Medium',
                    color: Colors.grey,
                    fontSize: height / 80,
                  ),
                ),
              ],
            ), SizedBox(height: height / 200,),
            Row(
              children: [
                Image.asset(
                  "image/time.png",
                  height: height / 50,
                  color: Colors.grey,
                ),
                Text(
                  CustomStrings.time,
                  style: TextStyle(
                    fontFamily: 'Gilroy Medium',
                    color: Colors.grey,
                    fontSize: height / 80,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
