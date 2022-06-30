import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syara_finder/Features/Authentication/presentation/pages/login/loginpage.dart';
import 'package:syara_finder/Features/Authentication/presentation/pages/signup/signup.dart';

class signning extends StatefulWidget {
  @override
  _signningState createState() => _signningState();
}

class _signningState extends State {
  final GlobalKey _navKey = GlobalKey();

  var pagesAll = [SignUpScreen(), LoginPage()];
  var myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        animationDuration: const Duration(milliseconds: 1500),
        backgroundColor: Colors.transparent,
        key: _navKey,
        items: [
          Icon(
            (myIndex == 0) ? Icons.edit : Icons.edit_note,
            color: Colors.white,
          ),
          Icon(
            (myIndex == 1) ? Icons.login : Icons.login_outlined,
            color: Colors.white,
          ),
        ],
        buttonBackgroundColor: HexColor("#FF8308"),
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        animationCurve: Curves.fastLinearToSlowEaseIn,
        color: HexColor("#FF8308"),
      ),
      body: pagesAll[myIndex],
    );
  }
}
