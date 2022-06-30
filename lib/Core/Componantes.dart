// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:syara_finder/Features/Authentication/presentation/pages/signning/sign.dart';
import 'package:syara_finder/Features/BrandsAndModelsAndCars/presentation/manager/BrandsAndModelsProvider.dart';
import '../Features/BrandsAndModelsAndCars/data/models/Model.dart';
import '../Features/BrandsAndModelsAndCars/presentation/pages/CarDetails/cardetails.dart';
import '../Features/BrandsAndModelsAndCars/data/models/Car.dart';
import '../Features/Home/presentation/manager/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:url_launcher/url_launcher.dart';

import '../injection_container.dart';

PopupMenuItem<Model> buildPopupMenuItem(Model text) {
  return PopupMenuItem(
      value: text,
      child: Text(
        text.modelName!,
        style:  TextStyle(
          color: Colors.black,
          fontSize: 15.0.sp,
        ),
      ));
}

PopupMenuItem<int> buildPopupMenuItemOfYears(int ?text) {
  return PopupMenuItem(
    value: text,
    child: Text(
      text.toString(),
      style:  TextStyle(
        color: Colors.black,
        fontSize: 15.0.sp,
      ),
    ),
  );
}

TextField buildTextField({TextEditingController?controller,String ?hintText,bool isSearchButton=true,bool ?isModelField =true}) {

  return TextField(
    style: TextStyle(
      fontSize: 14.sp,
    ),
    readOnly: !isSearchButton,
    decoration: InputDecoration(

        prefixIcon: SizedBox(
            height: 17.w,
            width: 17.w,
            child: isSearchButton==true?const Icon(Icons.search,color: Color(0xffB8B8B8),):Container()
        ) ,
        suffixIcon: SizedBox(
            height: 17.w,
            width: 17.w,
            child: isSearchButton==false?PopupMenuButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              itemBuilder: (BuildContext context) {
                return isModelField!? dependencyInjection.get<BrandsAndModelsCarsProvider>().listOfModels:dependencyInjection.get<BrandsAndModelsCarsProvider>().listOfYears;
              },
              onSelected: (dynamic value) {
                if(isModelField!){
                  dependencyInjection.get<BrandsAndModelsCarsProvider>().updateCurrentModel(value);
                }
                else{
                  dependencyInjection.get<BrandsAndModelsCarsProvider>().updateCurrentYear(value);
                }
              },
              child: const Icon(Icons.arrow_downward,
                  color: Color(0xff36a9e0), size: 20.0),
            ):Container()
        ),
        fillColor: const Color(0xffF3F3F3),
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36.r),
            borderSide: const BorderSide(color: Colors.black, width: 0.5)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36.r),
            borderSide: const BorderSide(color: Colors.black, width: 0.5)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36.r),
            borderSide: const BorderSide(color: Colors.black, width: 0.1)
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 14.sp,
            color: const Color(0xffB8B8B8)
        )
    ),
    textInputAction: TextInputAction.done,
    keyboardType: TextInputType.multiline,
    controller: controller,
  );
}

void showDialogIfNotLoggedIn(BuildContext context,Car currentCar) {
  if (FirebaseAuth.instance.currentUser == null) {
    showDialogWithMessage(context: context,message: "You Should Be Logged In First To Be Able To Pass To Car Details Page");
  }
  else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return CarDetails(currentCar);
        },
      ),
    );
  }
}

Expanded buildSection({String ?title,String ?subTitle="",dynamic nextPage,BuildContext? context,bool isClickable=true}) {
  return Expanded(
    child: GestureDetector(
      onTap: (){
        if(isClickable){
          Navigator.push(context!, MaterialPageRoute(builder: (context) =>nextPage));
        }
      },
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!,style: TextStyle(
                color: const Color(0xff959595),
                fontSize: 12.sp,fontWeight: FontWeight.normal
            ),),
            SizedBox(height: 3.h,),
            Text(subTitle!,style: TextStyle(
                color: const Color(0xff2B2B2B),
                fontSize: 14.sp
            ),),
          ],
        ),
      ),
    ),
  );
}

Future openLinkOfCurrentCar(String url) async {
  if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
}

Positioned buildPositioned(Car currentCar) {
  return Positioned(
    top: 15.h,
    right: 15.w,
    child: ClipOval(
      child: Material(
        color: Colors.white, // Button color
        child: InkWell(
          splashColor: Colors.white, // Splash color
          onTap: () {
            if(dependencyInjection.get<HomeProvider>().isCarlInFavourites(currentCar)){
              dependencyInjection.get<HomeProvider>().removeFromFavourites(currentCar);
            }
            else{
              dependencyInjection.get<HomeProvider>().addToFavourites(currentCar);
            }
          },
          child: SizedBox(width: 40.h, height: 40.h, child: Icon(dependencyInjection.get<HomeProvider>().isCarlInFavourites(currentCar)?Icons.favorite:Icons.favorite_border_outlined,size: 20.h,color: Color(0xffEE4B42),)),
        ),
      ),
    ),
  );
}

Container buildTextOfCarPrice(String text,int textSize) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20.5.w),
    alignment: Alignment.centerLeft,
    child: Text(text,style: TextStyle(
        fontSize: textSize.sp,color: const Color(0xffFF8308),fontWeight: FontWeight.bold
    ),),
  );
}

Row buildIconWithText({required String text,required IconData icon}) {
  return Row(
    children: [
      Icon(icon,color: const Color(0xff959595),size: 17.h,),
      SizedBox(width: 5.w,),
      Text(text,style: TextStyle(
          fontSize: 12.sp,
          color: const Color(0xff959595)
      ),)
    ],
  );
}

Container buildButton({required int textSize,required String buttonText, required Function onTap,required double height,required double width}) {
  return Container(
    height: height,
    margin: EdgeInsets.symmetric(horizontal: 20.w),
    width: width,
    // width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom( primary: const Color(0xffFF8308),shape: const StadiumBorder(),),
      child: Text(buttonText,style: TextStyle(
          fontSize: textSize.sp
      ),),
    ),
  );
}

Future<dynamic> showDialogWithMessage({required BuildContext context, required String message}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0.r))),
          content: SizedBox(
            height: 70,
            child:  Text(
                style: TextStyle(
                  fontSize: 20.sp,fontWeight: FontWeight.w500,
                ),
                message),
          ),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text("Cancel",style: TextStyle(
              color: Color(0xffFF8308)
            ),)),
            TextButton(onPressed: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => signning(),));
            }, child: const Text("Log In",style: TextStyle(
              color: Color(0xffFF8308)
            ),))
          ],
        );
      });
}

Container buildTextOfCarName(String text,int textSize) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20.5.w),
    alignment: Alignment.centerLeft,
    child: Text(text,style: TextStyle(
        fontSize: textSize.sp,color: Colors.black,fontWeight: FontWeight.w500
    ),),
  );
}

AppBar buildAppBar(BuildContext context,String title,) {
  return AppBar(
    backgroundColor: const Color(0xffF9FBFC),
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.black,size: 17.h,),
      onPressed: () {
         if(dependencyInjection.get<HomeProvider>().navBarSelectedIndex==0){
           Navigator.of(context).pop();
         }
         else{
           dependencyInjection.get<HomeProvider>().returnNavBarToHome();
         }
        },
    ),
    title: Text(title,style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xff0A0A0A)
    ),),
    centerTitle: true,
  );
}