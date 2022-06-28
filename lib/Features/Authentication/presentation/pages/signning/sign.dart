import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syara_finder/Features/Authentication/presentation/pages/login/loginpage.dart';
import 'package:syara_finder/Features/Authentication/presentation/pages/signup/signup.dart';
import 'package:syara_finder/Features/Home/presentation/pages/HomePage/explorePage.dart';

class signning extends StatefulWidget {
  @override
  _signningState createState() => _signningState();
}

class _signningState extends State {
  GlobalKey _NavKey = GlobalKey();

  var PagesAll = [SignUpScreen(), LoginPage()];
  var myindex = 0;

  //appProvider? appProviderInstance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //appProviderInstance = Provider.of<appProvider>(context);
   // appProviderInstance!.updateSelectedIndex();
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        animationDuration: Duration(milliseconds: 1500),
        backgroundColor: Colors.transparent,
        key: _NavKey,
        items: [
          Icon(
            (myindex == 0) ? Icons.edit : Icons.edit_note,
            color: Colors.white,
          ),
          Icon(
            (myindex == 1) ? Icons.login : Icons.login_outlined,
            color: Colors.white,
          ),
          // Icon(
          //   (myindex == 2) ? Icons.skip_next : Icons.skip_next_outlined,
          //   color: Colors.white,
          // ),

        ],
        buttonBackgroundColor: HexColor("#FF8308"),
        onTap: (index) {
          setState(() {
            myindex = index;
          });
        },
        animationCurve: Curves.fastLinearToSlowEaseIn,
        color: HexColor("#FF8308"),
      ),
      body: PagesAll[myindex],
    );
  }
}
