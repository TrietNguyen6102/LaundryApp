import 'package:anywash/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/media.dart';

class Dry extends StatefulWidget {
  const Dry({Key? key}) : super(key: key);

  @override
  State<Dry> createState() => _DryState();
}

class _DryState extends State<Dry> {
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
  int selected = 0;
  int selected1 = 0;
  int selected2 = 0;


  List name=[CustomStrings.outwear,CustomStrings.casualwear,CustomStrings.outwear,];

  @override
  Widget build(BuildContext context) {

    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return build(context);
  }

  Widget incre(clr, img,txt1,txt2,se) {
    return Row(
      children: [
        SizedBox(
          width: width / 20,
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.all(width / 40),
            child: Image.asset(
              img,
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: clr,
          ),
          height: height / 15,
          width: width / 8,
        ),
        SizedBox(
          width: width / 25,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              txt1,
              style: TextStyle(
                fontFamily: 'Gilroy Bold',
                color: notifire.getdarkscolor,
                fontSize: height / 45,
              ),
            ),
            SizedBox(
              height: height / 300,
            ),
            Text(
              txt2,
              style: TextStyle(
                fontFamily: 'Gilroy Medium',
                color: Colors.grey,
                fontSize: height / 55,
              ),
            ),
          ],
        ),
        const Spacer(),
       se,
        SizedBox(
          width: width / 20,
        ),
      ],
    );
  }
}
