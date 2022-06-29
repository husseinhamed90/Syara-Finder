// ignore_for_file: use_key_in_widget_constructors
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syara_finder/Features/Home/presentation/manager/HomeProvider.dart';

import '../../../../../../Shared/Componantes.dart';
import '../../../../../Authentication/presentation/manager/AuthProvider.dart';
import '../../../../../Authentication/presentation/pages/signning/sign.dart';

class profile extends StatelessWidget {
  AuthProvider? authProviderInstance;
  HomeProvider? homeProviderInstance;
  @override
  Widget build(BuildContext context) {
    authProviderInstance = Provider.of<AuthProvider>(context);
    homeProviderInstance = Provider.of<HomeProvider>(context);
    return Scaffold(
        appBar: buildAppBar(context, "Profile", homeProviderInstance!),
        backgroundColor: HexColor("#F9FBFC"),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                const SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 20),
                    child: const Text(
                      "Your Information",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  width: MediaQuery.of(context).size.width / 1.15,
                  decoration: BoxDecoration(
                    color: HexColor("#F3F3F3"),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children:  <Widget>[
                      const SizedBox(height: 10.0),
                       ListTile(
                        // ignore: prefer_const_constructors
                         title: Text("Full Name"),
                         subtitle: Text((authProviderInstance!.userCredential!=null)?(authProviderInstance!.profile==null)?"":authProviderInstance!.profile!["email"]:authProviderInstance!.profile!["name"]),

                         trailing: Icon(Icons.edit),
                      ),
                       ListTile(
                        title: const Text("Email"),
                        subtitle: Text((authProviderInstance!.userCredential!=null)?(authProviderInstance!.profile==null)?authProviderInstance!.userCredential!.email!:authProviderInstance!.profile!["email"]:authProviderInstance!.profile!["email"]),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 20),
                    child: const Text(
                      "About",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  width: MediaQuery.of(context).size.width / 1.15,
                  decoration: BoxDecoration(
                    color: HexColor("#F3F3F3"),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
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
            authProviderInstance!.logOutFromAccount().then((value) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => signning(),));
            });
          },
          child: const Icon(
            Icons.logout,
          ),
        ));
  }
}