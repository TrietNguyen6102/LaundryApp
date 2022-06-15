import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
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
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: notifire.getprocolor,
                  ),
                ),
                SizedBox(
                  width: width / 4,
                ),
                Text(
                  CustomStrings.orders,
                  style: TextStyle(
                      fontFamily: 'Gilroy Bold',
                      color: notifire.getprocolor,
                      fontSize: height / 40,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: height / 40),
            Padding(
              padding: EdgeInsets.only(left: width / 10),
              child: Column(
                children: [
                  order(const Color(0xffc1cefa),const Icon(
                    Icons.wysiwyg,
                    color: Color(0xff0f4aac),
                  ),CustomStrings.no,CustomStrings.order,CustomStrings.sep,),
                  SizedBox(height: height / 20,),
                  order(const Color(0xffffb8b8),const Icon(
                    Icons.check_box_outline_blank_sharp,
                    color: Color(0xffe44040),
                  ),CustomStrings.pickedup,CustomStrings.laundrypickup,CustomStrings.tim,),
                  SizedBox(height: height / 20,),
                  order(const Color(0xfffdead7),const Icon(
                    Icons.access_alarms_sharp,
                    color: Color(0xfff39738),
                  ),CustomStrings.process,CustomStrings.currently,CustomStrings.processe,),
                  SizedBox(height: height / 20,),
                  order(const Color(0xffe1f4ff),const Icon(
                    Icons.add_box_outlined,
                    color: Color(0xff0f4aac),
                  ),CustomStrings.dtime,CustomStrings.septs,"",),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
  Widget order(clr,icon,name,name2,name3){
    return  Row(
      children: [
        Container(
          height: height / 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: clr,
          ),
          child:  Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),
          ),
        ),
        SizedBox(width: width / 30,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
              style: TextStyle(
                  fontFamily: 'Gilroy Bold',
                  color: notifire.getdarkscolor,
                  fontSize: height / 50,
                  fontWeight: FontWeight.w600),),
            Text(name2,
              style: TextStyle(
                fontFamily: 'Gilroy Normal',
                color: notifire.getdarkscolor,
                fontSize: height / 55,),),
            Text(name3,
              style: TextStyle(
                fontFamily: 'Gilroy Normal',
                color: notifire.getdarkscolor,
                fontSize: height / 55,),),
          ],
        ),
      ],
    );
  }
}
