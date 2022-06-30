// ignore_for_file: use_key_in_widget_constructors
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syara_finder/Features/Home/presentation/manager/HomeProvider.dart';
import 'package:syara_finder/injection_container.dart';

import '../../../../../../Core/Componantes.dart';
import '../../../../../Authentication/presentation/manager/AuthProvider.dart';
import '../../../../../Authentication/presentation/pages/signning/sign.dart';

class profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //print(authProviderInstance!.additionalUserInfo!);
    return Scaffold(
        appBar: buildAppBar(context, "Profile"),
        backgroundColor: HexColor("#F9FBFC"),
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                const SizedBox(height: 20.0),
                Container(
                  alignment: Alignment.centerLeft,

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "Your Information",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: HexColor("#F3F3F3"),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children:  <Widget>[
                      const SizedBox(height: 10.0),
                      ListTile(
                        // ignore: prefer_const_constructors
                        title: Text("Full Name"),
                        subtitle: Text((dependencyInjection.get<AuthProvider>().userCredential!=null)?(dependencyInjection.get<AuthProvider>().profile==null)?"":dependencyInjection.get<AuthProvider>().profile!["email"]:dependencyInjection.get<AuthProvider>().profile!["name"]),

                        trailing: Icon(Icons.edit),
                      ),
                      ListTile(
                        title: const Text("Email"),
                        subtitle: Text((dependencyInjection.get<AuthProvider>().userCredential!=null)?(dependencyInjection.get<AuthProvider>().profile==null)?dependencyInjection.get<AuthProvider>().userCredential!.email!:dependencyInjection.get<AuthProvider>().profile!["email"]:dependencyInjection.get<AuthProvider>().profile!["email"]),
                        trailing: const Icon(Icons.edit),
                      ),
                      // const ListTile(
                      //   title: Text("Password"),
                      //   subtitle: Text('.....'),
                      //   trailing: Icon(Icons.edit),
                      // ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "About",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: HexColor("#F3F3F3"),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: const <Widget>[
                      SizedBox(height: 10.0),
                      ListTile(
                        title: Text("About Us"),
                      ),
                      ListTile(
                        title: Text("Privacy policy"),
                      ),
                      ListTile(
                        title: Text("Help Center"),
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: HexColor("#FF8308"),
          onPressed: () {
            dependencyInjection.get<AuthProvider>().logOutFromAccount().then((value) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => signning(),));
            });
          },
          child: const Icon(
            Icons.logout,
          ),
        ));
  }
}