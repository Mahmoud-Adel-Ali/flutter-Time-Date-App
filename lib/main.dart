// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, unused_local_variable, curly_braces_in_flow_control_structures, unrelated_type_equality_checks

//to start any Application ,you should write the code
// import 'dart:async';

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TimeDate(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TimeDate extends StatefulWidget {
  const TimeDate({super.key});
  @override
  State<TimeDate> createState() => _TimeDateState();
}

class _TimeDateState extends State<TimeDate> {
  String year = "";
  String month = "";
  String day = "";
  String hour = "";
  String minute = "";
  String second = "";
  String weekday = "";
  String halfDay = "";
  String printHellow = "";

  changeTimeAllSecond() {
    setState(() {
      year = DateTime.now().year.toString();
      month = DateTime.now().month.toString();
      day = DateTime.now().day.toString();
      weekday = DateTime.now().weekday.toString();
      hour = DateTime.now().hour.toString().padLeft(2, '0');
      minute = DateTime.now().minute.toString().padLeft(2, '0');
      second = DateTime.now().second.toString().padLeft(2, '0');
      (DateTime.now().hour <= 12) ? halfDay = "AM" : halfDay = "PM";
      if (DateTime.now().hour > 12) {
        int temp = DateTime.now().hour - 12;
        hour = temp.toString().padLeft(2, '0');
      }
    });
  }

  calledOnlyOneTimeAfterSeconds() {
    Timer(Duration(seconds: 5), () {
      setState(() {
        printHellow = "Hello";
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer timer = Timer.periodic(Duration(seconds: 1), (timer) {
      changeTimeAllSecond();
      calledOnlyOneTimeAfterSeconds();
    });
    // changeTimeA
    // llSecond();
  }

  getNameOfMonth(String name) {
    if (name == "1")
      return "January";
    else if (name == "2")
      return "February";
    else if (name == "3")
      return "March";
    else if (name == "4")
      return "April";
    else if (name == "5")
      return "May";
    else if (name == "6")
      return "June";
    else if (name == "7")
      return "July";
    else if (name == "8")
      return "August";
    else if (name == "9")
      return "September";
    else if (name == "10")
      return "October";
    else if (name == "11")
      return "November";
    else
      return "December";
  }

  getNameOfDay(String name) {
    // 1 2 3 4 5 6 7
    if (name == "1")
      return "Monday";
    else if (name == "2")
      return "Tuesday";
    else if (name == "3")
      return "Wednesday";
    else if (name == "4")
      return "Thursday";
    else if (name == "5")
      return "Friday";
    else if (name == "6")
      return "Saturday";
    else // 7
      return "Sunday";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 214, 64),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 139, 105, 0),
        centerTitle: true,
        title: Text(
          "Time & Date App",
          style: TextStyle(fontSize: 29),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today's Date is :${getNameOfDay(weekday)} ",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              "${getNameOfMonth(month)}-${day}-${year}",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              "${hour} : ${minute} : ${second} $halfDay",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              "$printHellow",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
