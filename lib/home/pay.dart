import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Pay extends StatefulWidget {
 final Widget con;
  const Pay(this.con,{Key? key}) : super(key: key);

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {

  late ColorNotifire notifire;
  int _groupValue = -1;

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
                  CustomStrings.payment,
                  style: TextStyle(
                      color: notifire.getdarkscolor,
                      fontFamily: 'Gilroy Bold',
                      fontSize: height / 43),
                ),
                const Spacer(),
                Image.asset(
                  "image/scanner.png",
                  height: height / 30,
                  color: notifire.getprocolor,
                ),
                SizedBox(
                  width: width / 20,
                ),
              ],
            ),
            SizedBox(height: height / 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    CustomStrings.payments,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Gilroy Bold',
                      color: notifire.gettextcolor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    CustomStrings.card,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Gilroy Medium',
                      color: notifire.getprocolor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 40,
            ),
            method(0, CustomStrings.apple, "image/apple.png"),
            SizedBox(
              height: height / 60,
            ),
            method(1, CustomStrings.paypal, "image/paypal.png"),
            SizedBox(
              height: height / 60,
            ),
            method(2, CustomStrings.google, "image/google.png"),
            SizedBox(
              height: height / 60,
            ),
          Column(
            children: [
              widget.con,
            ],
          ),
          ],
        ),
      ),
    );
  }
  Widget method(val, name, img) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          setState(
                () {
              _groupValue = val as int;
            },
          );
        },
        child: Container(
          height: height / 12,
          width: width,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.all(color: Colors.grey, width: 1)),
          child: Row(
            children: [
              SizedBox(
                width: width / 30,
              ),
              Image.asset(
                img,
                height: height / 25,
              ),
              SizedBox(
                width: width / 30,
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Gilroy Medium',
                  color: notifire.getdarkscolor,
                ),
              ),
              const Spacer(),
              Radio(
                activeColor: notifire.getprocolor,
                value: val as int,
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value as int;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
