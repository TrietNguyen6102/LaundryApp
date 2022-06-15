import 'package:anywash/utils/media.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';

class Additem extends StatefulWidget {
  const Additem({Key? key}) : super(key: key);

  @override
  _AdditemState createState() => _AdditemState();
}

class _AdditemState extends State<Additem> {
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

    );
  }

  Widget con(name, name2, val, inc) {
    return Column(
      children: [
        Container(
          height: height / 10,
          width: width,
          decoration: BoxDecoration(
            color: notifire.getcolors,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("image/smile.png"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height / 100,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'Gilroy Bold',
                      color: notifire.getprecolor,
                      fontSize: height / 50,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        name2,
                        style: TextStyle(
                          fontFamily: 'Gilroy Normal',
                          color: Colors.grey,
                          fontSize: height / 60,
                        ),
                      ),
                      SizedBox(
                        width: width / 30,
                      ),
                      val,
                    ],
                  ),
                ],
              ),
              const Spacer(),
              inc,
              SizedBox(
                width: width / 30,
              ),
            ],
          ),
        ),
        SizedBox(
          height: height / 80,
        ),
      ],
    );
  }
}
