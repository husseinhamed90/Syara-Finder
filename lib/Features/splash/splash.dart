// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../Features/Home/presentation/pages/HomePage/explorePage.dart';
import '../../Features/OnBoarding/onbording.dart';
import '../Authentication/presentation/manager/AuthProvider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double largeContainerWidth =0;
  double largeContainerHeight =0;
  double iconContainerH=80;
  double iconContainerW=80;
  double searchIconHeight =0;
  double fontSize=0;
  double iconSize=70.h;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    largeContainerWidth = 0;
    largeContainerHeight=0;
    timer =Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if(largeContainerWidth==100&&largeContainerHeight==100){

        }
        else{
          if(largeContainerHeight==0&&largeContainerWidth==0){
            largeContainerWidth=120.h;
            largeContainerHeight=120.h;
          }

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
                color: HexColor("#ff8308"),
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
                          if(largeContainerHeight==80&&largeContainerWidth==80){

                          }
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
                            fontSize=45.sp;
                            largeContainerHeight=90.h;
                            largeContainerWidth=90.h;
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
                            context.read<AuthProvider>().getLoggedInUser();
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
                                image: AssetImage("assets/icons/logo.png"),
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
