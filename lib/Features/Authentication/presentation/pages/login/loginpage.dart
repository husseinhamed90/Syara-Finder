// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:syara_finder/Features/Authentication/presentation/manager/AuthProvider.dart';
import 'package:syara_finder/Features/Home/presentation/manager/HomeProvider.dart';

import '../../../../../injection_container.dart';
import '../../../../Home/presentation/pages/HomePage/explorePage.dart';
import '../../widgets/LoginPageWidgets/LoginIconButton.dart';
import '../SharedComponantes.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#FFF0DF"),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 40,),
          buildSkipButton(context),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Center(
              child: Text(
                "Sign In",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                onChanged: (String value) {},
                cursorColor: HexColor("#FF8308"),
                enableSuggestions: false,
                autocorrect: false,
                controller: email,
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.mail,
                        color: Colors.grey,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 20)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                onChanged: (String value) {},
                cursorColor: HexColor("#FF8308"),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: password,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 20)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Forgot password?",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              )),
          SizedBox(
            height: 80,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: ElevatedButton(
                onPressed: () async{
                  dependencyInjection.get<HomeProvider>().returnNavBarToHome();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => explorePage()),
                  );
                  // await authProviderInstance!.signInWithNormalAccount(email: email.text, password: password.text).then((value) {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => explorePage()),
                  //   );
                  // });
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  primary: HexColor("#FF8308"),
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginIconButton(iconLink: "https://img.icons8.com/color/344/gmail-new.png",onPressed: () async {
                await context.read<AuthProvider>().signInWithGoogleAccount((){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => explorePage(),));
                });
              }),
              SizedBox(
                width: 20,
              ),
              LoginIconButton(iconLink: "https://img.icons8.com/color/344/facebook.png",onPressed: ()async{
                await context.read<AuthProvider>().signInWithFacebookAccount((){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => explorePage(),));
                });
              }),
              SizedBox(
                width: 20,
              ),
              LoginIconButton(iconLink: "https://cdn-icons-png.flaticon.com/512/0/747.png",onPressed: ()async {
              }),
            ],
          ),
        ],
      ),
    );
  }
}
