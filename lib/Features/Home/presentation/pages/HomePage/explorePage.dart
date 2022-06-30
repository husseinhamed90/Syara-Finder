// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:provider/provider.dart';
import 'package:syara_finder/Features/Authentication/presentation/manager/AuthProvider.dart';
import 'package:syara_finder/Core/Componantes.dart';
import 'package:syara_finder/injection_container.dart';
import '../../manager/HomeProvider.dart';

class explorePage extends StatelessWidget {
  TextEditingController locationController = TextEditingController();
  HomeProvider? homeProviderInstance;

  @override
  Widget build(BuildContext context) {
    homeProviderInstance = Provider.of<HomeProvider>(context);

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
          currentIndex: homeProviderInstance!.navBarSelectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (value) {
            if(value==2){

              if(dependencyInjection.get<AuthProvider>().userCredential==null){
                if(showDialogWhenProfilePageTapped(context)){
                  homeProviderInstance!.onPageSelected(value,context);
                }
              }
              else{

                homeProviderInstance!.onPageSelected(value,context);
              }
            }
            else{
              homeProviderInstance!.onPageSelected(value,context);
            }
          },
        ),
        body: homeProviderInstance!.pages.elementAt(homeProviderInstance!.navBarSelectedIndex));
  }
}
bool showDialogWhenProfilePageTapped(BuildContext context){
  if (dependencyInjection.get<AuthProvider>().userCredential == null&&dependencyInjection.get<AuthProvider>().additionalUserInfo==null
      &&dependencyInjection.get<AuthProvider>().profile==null) {
    showDialogWithMessage(context: context,message: "You Should Be Logged In First To Show Your Profile");
    return false;
  }
  else{
    return true;
  }
}
