import 'package:anywash/order/order.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/custombutton.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({Key? key}) : super(key: key);

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
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
            Stack(
              children: [
                Image.asset("image/tracking.png"),
                Column(
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
                              border: Border.all(
                                  color: const Color(0xfff1f5f6), width: 2),
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
                          CustomStrings.trackorder,
                          style: TextStyle(
                              color: notifire.getdarkscolor,
                              fontFamily: 'Gilroy Bold',
                              fontSize: height / 43),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 2.6,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: notifire.getprimerycolor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      height: height / 1.95,
                      width: width,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: height / 40,
                              ),
                              Row(
                                children: [
                                  Text(
                                    CustomStrings.statuss,
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
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      status(
                                        CustomStrings.t1,
                                        const Color(0xffbfd8f8),
                                        "image/order1.png",
                                        CustomStrings.accept,
                                      ),
                                      SizedBox(
                                        height: height / 40,
                                      ),
                                      status(
                                        CustomStrings.t2,
                                        const Color(0xfffff3d8),
                                        "image/order2.png",
                                        CustomStrings.being,
                                      ),
                                      SizedBox(
                                        height: height / 40,
                                      ),
                                      status(
                                        CustomStrings.t3,
                                        const Color(0xffe6eafe),
                                        "image/order3.png",
                                        CustomStrings.ways,
                                      ),
                                      SizedBox(
                                        height: height / 40,
                                      ),
                                      status(
                                        CustomStrings.t4,
                                        const Color(0xffffecee),
                                        "image/order4.png",
                                        CustomStrings.willbe,
                                      ),
                                      SizedBox(
                                        height: height / 40,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Image.asset(
                                        "image/greencheak.png",
                                        height: height / 45,
                                      ),
                                      dot(),
                                      Image.asset(
                                        "image/greencheak.png",
                                        height: height / 45,
                                      ),
                                      dot(),
                                      Image.asset(
                                        "image/greycheak.png",
                                        height: height / 45,
                                      ),
                                      dot(),
                                      Image.asset(
                                        "image/greycheak.png",
                                        height: height / 45,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: width / 40),
                                child: GestureDetector(
                                  onTap: (){
                                   Get.to(const Order(),);
                                  },
                                  child: Custombutton.button(
                                      notifire.getprocolor, CustomStrings.vieworder, width),
                                ),
                              ),
                              SizedBox(
                                height: height / 80,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget dot() {
    return DottedLine(
      direction: Axis.vertical,
      lineLength: height / 15,
      lineThickness: 1.0,
      dashLength: 4.0,
      dashColor: Colors.grey,
      dashGapLength: 4.0,
      dashGapColor: Colors.transparent,
    );
  }

  Widget status(name2, clr, img, name) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: clr,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          height: height / 16,
          width: width / 7,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(height / 130),
              child: Image.asset(img),
            ),
          ),
        ),
        SizedBox(
          width: width / 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  color: notifire.getdarkscolor,
                  fontFamily: 'Gilroy Bold',
                  fontSize: height / 50),
            ),
            SizedBox(
              height: height / 200,
            ),
            Text(
              name2,
              style: TextStyle(
                  color: notifire.getdarkscolor,
                  fontFamily: 'Gilroy Medium',
                  fontSize: height / 65),
            ),
          ],
        ),
      ],
    );
  }
}
