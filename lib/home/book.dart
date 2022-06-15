import 'package:anywash/home/pay.dart';
import 'package:anywash/home/trackorder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/custombutton.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Book extends StatefulWidget {
  const Book({Key? key}) : super(key: key);

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {

  String dropValue = 'TRietNguyen,VKU';
  String _dropValue = 'TinPhuoc,VKU';

  late ColorNotifire notifire;

  int _selectedIndex = 0;
  int selectedIndex = 1;
  int selectedIndex1 = 0;
  int selectedIndex2 = 1;

  List dates = ["07", "08", "09", "10", "11", "12", "13", "14", "15"];
  List times = ["01:00 PM", "02:00 PM", "03:00 PM", "04:00 PM", "05:00 PM", "06:00 PM", "07:00 PM", "08:00 PM", "09:00 PM"];
  List days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun", "Mon"];
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
                  CustomStrings.schedule,
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
              child: Row(
                children: [
                  Text(
                    CustomStrings.pickuplocation,
                    style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontFamily: 'Gilroy Bold',
                        fontSize: height / 45),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 90,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Container(
                height: height / 16,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropValue,
                    icon: Padding(
                        padding: EdgeInsets.only(right: width / 30),
                        child: Image.asset(
                          "image/arrowdown.png",
                          height: height / 40,
                        )),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropValue = newValue!;
                      });
                    },
                    items: <String>['Triet,Tin', 'Office', 'Others']
                        .map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              SizedBox(
                                width: width / 20,
                              ),
                              Text(
                                value,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: height / 50),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                children: [
                  Text(
                    CustomStrings.pickupdate,
                    style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontFamily: 'Gilroy Bold',
                        fontSize: height / 45),
                  ),
                  const Spacer(),
                  Image.asset(
                    "image/edit.png",
                    height: height / 30,
                  )
                ],
              ),
            ),
            SizedBox(
              height: height / 60,
            ),
            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height / 10,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Row(
                        children: [
                          SizedBox(width: width / 20,),
                          Container(
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width / 8,
                            decoration: BoxDecoration(
                              color: _selectedIndex == index
                                  ? notifire.getprocolor.withOpacity(0.2)
                                  : notifire.getbcolor,
                             borderRadius: const BorderRadius.all(Radius.circular(7),),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: height / 50,),
                                Text(
                                  dates[index].toString(),
                                  style: TextStyle(
                                      color: _selectedIndex == index ? notifire.getprocolor : Colors.grey.shade400,
                                      fontFamily: 'Gilroy Bold',
                                      fontSize: height / 50),
                                ),
                                SizedBox(height: height / 100,),
                                Text(
                                  days[index].toString(),
                                  style: TextStyle(
                                      color: _selectedIndex == index ? notifire.getprocolor : Colors.grey.shade400,
                                      fontFamily: 'Gilroy Bold',
                                      fontSize: height / 50),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                        ],
                      ),
                    );
                  },),
            ),
            SizedBox(
              height: height / 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                children: [
                  Text(
                    CustomStrings.timeslot,
                    style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontFamily: 'Gilroy Bold',
                        fontSize: height / 45),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 60,
            ),
            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height / 20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 9,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Row(
                      children: [
                        SizedBox(width: width / 20,),
                        Container(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 5,
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? notifire.getprocolor.withOpacity(0.2)
                                : notifire.getbcolor,
                            borderRadius: const BorderRadius.all(Radius.circular(7),),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                times[index].toString(),
                                style: TextStyle(
                                    color: selectedIndex == index ? notifire.getprocolor : Colors.grey.shade400,
                                    fontFamily: 'Gilroy Bold',
                                    fontSize: height / 55),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 40,
                        ),
                      ],
                    ),
                  );
                },),
            ),
            SizedBox(
              height: height / 40,
            ),   Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                children: [
                  Text(
                    CustomStrings.deliverylocation,
                    style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontFamily: 'Gilroy Bold',
                        fontSize: height / 45),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Container(
                height: height / 16,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _dropValue,
                    icon: Padding(
                        padding: EdgeInsets.only(right: width / 30),
                        child: Image.asset(
                          "image/arrowdown.png",
                          height: height / 40,
                        )),
                    onChanged: (String? newValue) {
                      setState(() {
                        _dropValue = newValue!;
                      });
                    },
                    items: <String>['Triet,Tin', 'Office', 'Others']
                        .map<DropdownMenuItem<String>>(
                          (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              SizedBox(
                                width: width / 20,
                              ),
                              Text(
                                value,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: height / 50),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 90,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                children: [
                  Text(
                    CustomStrings.deliverydate,
                    style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontFamily: 'Gilroy Bold',
                        fontSize: height / 45),
                  ),
                  const Spacer(),
                  Image.asset(
                    "image/edit.png",
                    height: height / 30,
                  )
                ],
              ),
            ),
            SizedBox(
              height: height / 60,
            ),
            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height / 10,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 9,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex1 = index;
                      });
                    },
                    child: Row(
                      children: [
                        SizedBox(width: width / 20,),
                        Container(
                          height: MediaQuery.of(context).size.height / 10,
                          width: MediaQuery.of(context).size.width / 8,
                          decoration: BoxDecoration(
                            color: selectedIndex1 == index
                                ? notifire.getprocolor.withOpacity(0.2)
                                : notifire.getbcolor,
                            borderRadius: const BorderRadius.all(Radius.circular(7),),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: height / 50,),
                              Text(
                                dates[index].toString(),
                                style: TextStyle(
                                    color: selectedIndex1 == index ? notifire.getprocolor : Colors.grey.shade400,
                                    fontFamily: 'Gilroy Bold',
                                    fontSize: height / 50),
                              ),
                              SizedBox(height: height / 100,),
                              Text(
                                days[index].toString(),
                                style: TextStyle(
                                    color: selectedIndex1 == index ? notifire.getprocolor : Colors.grey.shade400,
                                    fontFamily: 'Gilroy Bold',
                                    fontSize: height / 50),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 40,
                        ),
                      ],
                    ),
                  );
                },),
            ),
            SizedBox(
              height: height / 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                children: [
                  Text(
                    CustomStrings.timeslot,
                    style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontFamily: 'Gilroy Bold',
                        fontSize: height / 45),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 60,
            ),
            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height / 20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 9,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex2 = index;
                      });
                    },
                    child: Row(
                      children: [
                        SizedBox(width: width / 20,),
                        Container(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 5,
                          decoration: BoxDecoration(
                            color: selectedIndex2 == index
                                ? notifire.getprocolor.withOpacity(0.2)
                                : notifire.getbcolor,
                            borderRadius: const BorderRadius.all(Radius.circular(7),),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                times[index].toString(),
                                style: TextStyle(
                                    color: selectedIndex2 == index ? notifire.getprocolor : Colors.grey.shade400,
                                    fontFamily: 'Gilroy Bold',
                                    fontSize: height / 55),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 40,
                        ),
                      ],
                    ),
                  );
                },),
            ),
            SizedBox(
              height: height / 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 15),
              child: GestureDetector(
                onTap: (){
                  Get.to (Pay(  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Radio(
                              activeColor: notifire.getprocolor,
                              value: 3,
                              groupValue: _groupValue,
                              onChanged: (value) {
                                setState(() {
                                  _groupValue = value as int;
                                });
                              },
                            ),
                            Text(
                              CustomStrings.pay,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Gilroy Normal',
                                color: notifire.getprocolor,
                              ),
                            ),
                          ],
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: height / 14,
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
                                  "image/pay.png",
                                  height: height / 35,
                                ),
                                SizedBox(
                                  width: width / 30,
                                ),
                                const Text(
                                  CustomStrings.credit,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Gilroy Normal',
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height / 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                CustomStrings.voucher,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Gilroy Normal',
                                  color: notifire.getprocolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height / 60,
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                height: height / 14,
                                width: width,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: [
                                          Container(
                                            color: Colors.transparent,
                                            height: height / 20,
                                            width: width / 1.8,
                                            child: TextField(
                                              style: TextStyle(
                                                  color: notifire.getdarkscolor,
                                                  fontSize: 15),
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                hintText:  CustomStrings.code,
                                                hintStyle: TextStyle(
                                                    color: Colors.grey, fontSize: 15),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                                  child: GestureDetector(
                                    onTap: (){
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: notifire.getprocolor,
                                      ),
                                      // width: width / 3.94,
                                      height: height / 14,
                                      width: width / 3,
                                      child: const Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 25),
                                        child: Center(
                                          child: Text(
                                            "APPLY",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Gilroy Normal',
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height / 5,
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 15),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: const TrackOrder(),
                                ),
                              );
                            },
                            child: Custombutton.button(
                                notifire.getprocolor, CustomStrings.pays, width),
                          ),
                        ),
                        SizedBox(
                          height: height / 60,
                        ),
                    ],
                  ),
                  ),);
                },
                child: Custombutton.button(
                    notifire.getprocolor, CustomStrings.ptp, width),
              ),
            ),
            SizedBox(
              height: height / 80,
            ),
          ],
        ),
      ),
    );
  }
}
