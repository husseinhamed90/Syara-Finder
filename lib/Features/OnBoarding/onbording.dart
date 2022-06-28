import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:syara_finder/Features/Authentication/presentation/pages/signning/sign.dart';
import 'widgets/button_widget.dart';

class OnBoardingPage extends StatelessWidget {
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
          done: Text('Finished',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text('Skip', style: TextStyle(color: Colors.white)),
          onSkip: () => goToHome(context),
          next: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
          dotsDecorator: getDotDecoration(),
          globalBackgroundColor: HexColor("#FF8308"),
          skipOrBackFlex: 0,
          nextFlex: 0,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => signning()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

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
