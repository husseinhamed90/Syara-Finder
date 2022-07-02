import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:syara_finder/Features/Authentication/presentation/pages/signning/sign.dart';
import 'package:syara_finder/Features/Home/presentation/manager/HomeProvider.dart';
import 'package:syara_finder/Features/Home/presentation/pages/HomePage/explorePage.dart';

import 'widgets/button_widget.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  Timer ?_timer;
  int seconds = 0;
  late StreamController<int> _events;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  void _startTimer(BuildContext context) {
    _events = StreamController<int>();
    _events.add(4);
    seconds = 4;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(seconds > 0){
        seconds--;
      }
      else{
        _timer!.cancel();
        _events.close();
        goToHome(context);
      }
      if(!_events.isClosed){
        _events.add(seconds);
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
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
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        onDone: () => goToHome(context),
        showSkipButton: true,
        skip: const Text('Skip', style: TextStyle(color: Colors.white)),
        onSkip: () {

          showDialog(
              context: context,
              builder: (BuildContext cxt) {
                _startTimer(context);
                return AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0.r))),
                  title:  StreamBuilder<int>(
                    stream: _events.stream,
                    builder: (context, snapshot) {
                      return AutoSizeText("This Alert Message Will Be Closed After ${snapshot.data} Seconds",style: const TextStyle(
                          color: Color(0xffFF8308),fontWeight: FontWeight.bold
                      ),maxLines: 2);
                    },
                  ),
                  content: SizedBox(
                    height: 80.h,
                    child:  const Center(
                      child: AutoSizeText(
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          "Are You Want to Log in ?"),
                    ),
                  ),
                  actions: [
                    TextButton(onPressed: (){
                      //isCancel=true;
                      context.read<HomeProvider>().changeIsCancelState(true);
                      _timer!.cancel();
                      _events.close();
                      Navigator.pop(context);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => explorePage(),));
                    }, child: const Text("Cancel",style: TextStyle(
                        color: Color(0xffFF8308)
                    ),)),
                    TextButton(onPressed: (){
                      context.read<HomeProvider>().changeIsWantToLogState(true);
                      _timer!.cancel();
                      _events.close();
                      Navigator.pop(context);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => signning(),));
                    }, child: const Text("Log In",style: TextStyle(
                        color: Color(0xffFF8308)
                    ),))
                  ],
                );});
          //goToHome(context);
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
  }
  void goToHome(BuildContext cxt) {
    Navigator.pop(cxt);
    Navigator.push(cxt, PageTransition(type: PageTransitionType.leftToRight, child: explorePage(),duration: const Duration(seconds: 1)));

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
