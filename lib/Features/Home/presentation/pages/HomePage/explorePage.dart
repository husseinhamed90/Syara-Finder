// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:provider/provider.dart';
import 'package:syara_finder/Features/Authentication/presentation/manager/AuthProvider.dart';
import 'package:syara_finder/Shared/Componantes.dart';
import '../../manager/HomeProvider.dart';

class explorePage extends StatelessWidget {
  TextEditingController locationController = TextEditingController();
  HomeProvider? appProviderInstance;
  AuthProvider? authProvider;

  @override
  Widget build(BuildContext context) {
    appProviderInstance = Provider.of<HomeProvider>(context);
    authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xffF9FBFC),
          elevation: 0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                backgroundColor: Colors.orange,
                icon: Icon(Icons.search_rounded, size: 20.h),
                //label: 'Home',
                label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_outline_outlined,
                  size: 20.h,
                ),
                label: "Favourite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 20.h), label: "Profile"),
          ],
          currentIndex: appProviderInstance!.navBarSelectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (value) {
            if(value==2){
              if(authProvider!.userCredential==null){
                showDialogWhenProfilePageTapped(context);
              }
              else{
                appProviderInstance!.onPageSelected(value,context);
              }
            }
            else{
              appProviderInstance!.onPageSelected(value,context);
            }
          },
        ),
        body: appProviderInstance!.pages.elementAt(appProviderInstance!.navBarSelectedIndex));
  }
}