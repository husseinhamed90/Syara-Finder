// ignore_for_file: use_key_in_widget_constructors
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syara_finder/injection_container.dart';

import '../../../../../../Core/Componantes.dart';
import '../../../../../Authentication/presentation/manager/AuthProvider.dart';
import '../../../../../Authentication/presentation/pages/signning/sign.dart';

class profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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

                        title: const Text("Full Name"),
                        subtitle: Text(dependencyInjection.get<AuthProvider>().userEntity!.username!),
                        trailing: const Icon(Icons.edit),
                      ),
                      ListTile(
                        title: const Text("Email"),
                        subtitle: Row(
                          children: [
                            buildCachedNetworkImage(),
                            const SizedBox(width: 5.0),
                            Text(dependencyInjection.get<AuthProvider>().userEntity!.email!),
                          ],
                        ),
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

  CachedNetworkImage buildCachedNetworkImage() {
    if(dependencyInjection.get<AuthProvider>().userEntity!=null){
      if(dependencyInjection.get<AuthProvider>().userEntity!.providerName=="google.com") {
        return CachedNetworkImage(
            imageUrl: "https://img.icons8.com/color/344/gmail-new.png",
            height: 25.h);
      }
      else if(dependencyInjection.get<AuthProvider>().userEntity!.providerName=="facebook.com") {
        return CachedNetworkImage(
            imageUrl: "https://img.icons8.com/color/344/facebook.png",
            height: 25.h);
      }
      else{
        return CachedNetworkImage(
            imageUrl: "https://img.icons8.com/ios-glyphs/344/new-post.png",
            height: 25.h);
      }
    }
    else{
      return CachedNetworkImage(
          imageUrl: "https://img.icons8.com/ios-glyphs/344/new-post.png",
          height: 25.h);
    }

  }
}