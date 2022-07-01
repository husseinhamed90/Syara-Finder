// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:syara_finder/Features/Authentication/presentation/manager/AuthProvider.dart';
import '../../../../../injection_container.dart';
import '../../../../Home/presentation/pages/HomePage/explorePage.dart';
import '../../widgets/LoginPageWidgets/LoginIconButton.dart';

class LoginPage extends StatelessWidget {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  late AuthProvider authProvider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#FFF0DF"),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 40,),
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
          LoginButton(email: email, password: password),
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

class LoginButton extends StatelessWidget {

  const LoginButton({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        child: !context.watch<AuthProvider>().isLoading?ElevatedButton(
          onPressed: () async{
            context.read<AuthProvider>().isLoadingState(true);
          final snackBar = SnackBar(
            content: const Text("Invalid User"),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );


          await dependencyInjection.get<AuthProvider>().signInWithNormalAccount(email: email.text, password: password.text).then((value) {
            context.read<AuthProvider>().isLoadingState(false);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => explorePage()),
            );
          }).onError((error, stackTrace) {
            context.read<AuthProvider>().isLoadingState(false);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
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
        ):Center(child: CircularProgressIndicator(color: Color(0xffFF8308)),)
    );
  }
}
