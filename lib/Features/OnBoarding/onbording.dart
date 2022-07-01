import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:syara_finder/Features/Authentication/presentation/pages/signning/sign.dart';
import 'package:syara_finder/Features/Home/presentation/manager/HomeProvider.dart';
import 'package:syara_finder/Features/Home/presentation/pages/HomePage/explorePage.dart';

import 'widgets/button_widget.dart';

class OnBoardingPage extends StatelessWidget {
  Timer ?timer;
  @override
  Widget build(BuildContext context) => SafeArea(
    child: IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Sayara Finder',
          body: 'Enjoy your holidays with our wheels',
          image: buildImage('assets/images/onbord1.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Your satisfaction is our main aim',
          body: '',
          image: buildImage('assets/images/onbord2.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'We’ll get you back on the road',
          body: '',
          footer: ButtonWidget(
            text: 'Start',
            onClicked: () => goToHome(context),
          ),
          image: buildImage('assets/images/onbord3.png'),
          decoration: getPageDecoration(),
        ),
      ],
      done: const Text('Finished',
          style:
          TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
      onDone: () => goToHome(context),
      showSkipButton: true,
      skip: Text('Skip', style: TextStyle(color: Colors.white)),
      onSkip: () {

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0.r))),
                content: SizedBox(
                  height: 70,
                  child:  Text(
                      style: TextStyle(
                        fontSize: 20.sp,fontWeight: FontWeight.w500,
                      ),
                      "Are You Want to Login ?"),
                ),
                actions: [
                  TextButton(onPressed: (){
                    //isCancel=true;
                    context.read<HomeProvider>().changeIsCancelState(true);
                    timer!.cancel();
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => explorePage(),));
                  }, child: const Text("Cancel",style: TextStyle(
                      color: Color(0xffFF8308)
                  ),)),
                  TextButton(onPressed: (){
                    //  isWantToLog=true;
                    context.read<HomeProvider>().changeIsWantToLogState(true);
                    timer!.cancel();
                    //setState(() {});
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => signning(),));
                  }, child: const Text("Log In",style: TextStyle(
                      color: Color(0xffFF8308)
                  ),))
                ],
              );
            });
        timer =Timer.periodic(const Duration(seconds: 3), (t) {
          t.cancel();
          if(!context.read<HomeProvider>().isWantToLog){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => explorePage()),
            );
          }
        });
        //  goToHome(context);
      },
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
      dotsDecorator: getDotDecoration(),
      globalBackgroundColor: HexColor("#FF8308"),
      skipOrBackFlex: 0,
      nextFlex: 0,
    ),
  );

  void goToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => explorePage()),
    );
  }

  Widget buildImage(String path) => Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
    activeColor: Colors.white,
    color: HexColor("#FFF0DF"),
    size: Size(10, 10),
    activeSize: Size(22, 10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 20),
    imagePadding: EdgeInsets.all(24),
    pageColor: HexColor("#FFF0DF"),
  );

}
