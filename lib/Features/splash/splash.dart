// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:provider/provider.dart';

import '../../Features/OnBoarding/onbording.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

import '../../Features/Home/presentation/pages/HomePage/explorePage.dart';
import '../Authentication/presentation/manager/AuthProvider.dart';
import '../Home/presentation/manager/HomeProvider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  AuthProvider? authProvider;

  double largeContainerWidth =0;
  double largeContainerHeight =0;
  double iconContainerH=70.h;
  double iconContainerW=70.w;
  double searchIconHeight =0;
  double fontSize=0;
  double iconSize=70.w;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    largeContainerWidth = 0;
    largeContainerHeight=0;
    timer =Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if(largeContainerWidth==80.w&&largeContainerHeight==80.h){

        }
        else{
          largeContainerWidth=100.w;
          largeContainerHeight=100.h;
        }
      });
    },);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: HexColor("#FF8308"),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 450.h,
                width: MediaQuery.of(context).size.width,
                color: HexColor("#FF8308"),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedContainer(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.r),
                        color: Colors.white,
                      ),
                      width: largeContainerWidth,
                      height: largeContainerWidth,
                      duration: Duration(milliseconds: 900),
                      onEnd: (){
                        setState(() {
                          if(largeContainerHeight==80.h&&largeContainerWidth==80.w){}
                          else{
                            searchIconHeight =185.h;
                          }
                        });
                      },
                    ),
                    AnimatedPositioned(
                        duration: Duration(milliseconds: 900),
                        onEnd: (){
                          setState(() {
                            fontSize=50.sp;
                            largeContainerHeight=80.h;
                            largeContainerWidth=80.w;
                            iconContainerH=50.h;
                            iconContainerW=50.h;
                            iconSize=40.h;
                            searchIconHeight=200.h;
                          });
                        },
                        top: searchIconHeight,
                      child: AnimatedContainer(
                        height: iconContainerH,
                        width: iconContainerW,
                        duration: Duration(milliseconds: 900),
                        onEnd: () async {
                          if (FirebaseAuth.instance.currentUser != null) {
                          // signed in
                            authProvider!.getLoggedInUser();
                            Navigator.of(context).pushReplacement(PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: explorePage(),
                            ));
                          } else {
                            Navigator.of(context).pushReplacement(PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: OnBoardingPage(),
                            ));
                          }

                        },
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/icons/searchIcon.png"),
                                fit: BoxFit.cover)
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40.h,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 900),
                        height: 100.h,
                        width: MediaQuery.of(context).size.width,
                        child: AnimatedDefaultTextStyle(
                          duration: Duration(milliseconds: 900),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize,
                          ), child: Text("SyaraFinder",),
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
    );
  }
}