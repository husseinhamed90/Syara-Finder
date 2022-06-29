import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:syara_finder/Features/Home/presentation/manager/HomeProvider.dart';
import 'package:syara_finder/Shared/Componantes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

import '../../../../Home/presentation/pages/HomePage/explorePage.dart';
import '../../manager/AuthProvider.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullname = TextEditingController();
  TextEditingController email =  TextEditingController();
  TextEditingController password =  TextEditingController();

  AuthProvider? authProviderInstance;
  HomeProvider? homeProvider;
  @override
  Widget build(BuildContext context) {
    authProviderInstance = Provider.of<AuthProvider>(context);
    homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      backgroundColor: HexColor("#FFF0DF"),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 40,),
          buildSkipButton(context,homeProvider!),
          const SizedBox(height: 20,),

          const Center(
            child: Text(
              "Create Account",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Material(
              elevation: 2.0,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: TextField(
                cursorColor: HexColor("#FF8308"),
                controller: fullname,
                onChanged: (String value) {},
                decoration: const InputDecoration(
                    hintText: "Full Name",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.person_sharp,
                        color: Colors.grey,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 20)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Material(
              elevation: 2.0,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: TextField(
                onChanged: (String value) {},
                cursorColor: HexColor("#FF8308"),
                enableSuggestions: false,
                autocorrect: false,
                controller: email,
                decoration: const InputDecoration(
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
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Material(
              elevation: 2.0,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: TextField(
                onChanged: (String value) {},
                cursorColor: HexColor("#FF8308"),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: password,
                decoration: const InputDecoration(
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
          const SizedBox(
            height: 80,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => explorePage()),
                        // );
                      // authProviderInstance!.createNormalAccount(email: email.text, password: password.text).then((value) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => explorePage()),
                      //   );
                      // });
                    },
                    // ignore: sort_child_properties_last
                    child: const Text(
                      "Create Account",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: HexColor("#FF8308"),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ))),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
