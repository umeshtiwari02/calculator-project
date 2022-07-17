// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:math_expressions/math_expressions.dart';
import 'package:my_project/widgets/calculatorButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:my_project/theme_constant.dart';
import 'package:my_project/theme_manager.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(CalculatorApp());
}

ThemeManager _themeManager = ThemeManager();

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  late int firstNum;
  late int secondNum;
  late String history = '';
  late String textToDisplay = '';
  late String res;
  late String operation;

  void btnOnClick(String btnVal) {
    print(btnVal);
    if (btnVal == 'C') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnVal == 'AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnVal == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-' + textToDisplay;
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'X' ||
        btnVal == '%' ||
        btnVal == '/') {
      firstNum = int.parse(textToDisplay);
      res = '';
      operation = btnVal;
    } else if (btnVal == '=') {
      secondNum = int.parse(textToDisplay);

      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }

      if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }

      if (operation == 'X') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }

      if (operation == '/') {
        res = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '%') {
        res = (firstNum % secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnVal).toString();
    }

    setState(() {
      textToDisplay = res;
    });
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.blueGrey),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          // toolbarHeight: 70,
          // shadowColor: Colors.white70,
          elevation: 0,
          toolbarOpacity: 0.8,
          centerTitle: true,
          title: Text(
            "Calculator",
            style: TextStyle(fontSize: 25),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),

              // gradient: LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.topRight,
              //   colors: <Color>[Colors.pink, Colors.blue],
              // ),
            ),
          ),
          actions: [
            Switch(
                activeThumbImage: AssetImage('assets/darkd.png'),
                inactiveThumbImage: AssetImage('assets/bright.png'),
                value: _themeManager.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  _themeManager.toggleTheme(value);
                })
          ],
        ),
        // backgroundColor: Colors.deepPurple[100],
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Text(
                    history,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(115, 70, 212, 82),
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    textToDisplay,
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(fontSize: 55, color: Colors.blue)),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Divider(
                  height: 2,
                  color: Color.fromARGB(255, 144, 130, 130),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: 'AC',
                    fillColor: 0xffef5350,
                    textColor: 0xFF000000,
                    textSize: 27,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: 'C',
                    fillColor: 0xffcddc39,
                    textColor: 0xFF000000,
                    textSize: 27,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '+/-',
                    fillColor: 0xff00e676,
                    textColor: 0xFF000000,
                    textSize: 30,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '/',
                    fillColor: 0xff00e676,
                    textColor: 0xFF000000,
                    textSize: 32,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '7',
                    fillColor: 0xff81c4d0,
                    textColor: 0xFF000000,
                    textSize: 28,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '8',
                    fillColor: 0xff81c4d0,
                    textColor: 0xFF000000,
                    textSize: 28,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '9',
                    fillColor: 0xff81c4d0,
                    textColor: 0xFF000000,
                    textSize: 28,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: 'X',
                    fillColor: 0xff00e676,
                    textColor: 0xFF000000,
                    textSize: 25,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '4',
                    fillColor: 0xff81c4d0,
                    textColor: 0xFF000000,
                    textSize: 28,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '5',
                    fillColor: 0xff81c4d0,
                    textColor: 0xFF000000,
                    textSize: 28,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '6',
                    fillColor: 0xff81c4d0,
                    textColor: 0xFF000000,
                    textSize: 28,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '-',
                    fillColor: 0xff00e676,
                    textColor: 0xFF000000,
                    textSize: 44,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '1',
                    fillColor: 0xff81c4d0,
                    textColor: 0xFF000000,
                    textSize: 28,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '2',
                    fillColor: 0xff81c4d0,
                    textColor: 0xFF000000,
                    textSize: 28,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '3',
                    fillColor: 0xff81c4d0,
                    textColor: 0xFF000000,
                    textSize: 28,
                    callback: btnOnClick,
                  ),
                  CalculatorButton(
                    text: '+',
                    fillColor: 0xff00e676,
                    textColor: 0xFF000000,
                    textSize: 40,
                    callback: btnOnClick,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(
                      text: '%',
                      fillColor: 0xff81c4d0,
                      textColor: 0xFF000000,
                      textSize: 28,
                      callback: btnOnClick,
                    ),
                    CalculatorButton(
                      text: '0',
                      fillColor: 0xff81c4d0,
                      textColor: 0xFF000000,
                      textSize: 28,
                      callback: btnOnClick,
                    ),
                    CalculatorButton(
                      text: '.',
                      fillColor: 0xff81c4d0,
                      textColor: 0xFF000000,
                      textSize: 35,
                      callback: btnOnClick,
                    ),
                    CalculatorButton(
                      text: '=',
                      fillColor: 0xff2196f3,
                      textColor: 0xFF000000,
                      textSize: 45,
                      callback: btnOnClick,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        drawer: Drawer(
          // backgroundColor: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(20),
                    // topLeft: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    tileMode: TileMode.clamp,
                    colors: <Color>[
                      Color.fromARGB(255, 65, 126, 206),
                      Color.fromARGB(255, 229, 16, 236)
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        "assets/proff.png",
                        height: 100,
                        width: 120,
                      ),
                      Text(
                        "   Umesh Tiwari",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        "      klau.tiwari1234@gmail.com",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_on_sharp),
                title: Text("Location"),
                onTap: () {
                  // Update the state of the app
                  // ..
                  // Then close the drawer
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (BuildContext context) {
                  //   return const LocationPage();
                  // }));
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.people_alt_outlined),
                title: Text("Social"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.logout_outlined),
                title: Text("Logout"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.email_outlined),
                title: Text("Email"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Current Location')),
    );
  }
}
