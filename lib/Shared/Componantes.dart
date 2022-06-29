// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syara_finder/Features/Authentication/presentation/manager/AuthProvider.dart';
import 'package:syara_finder/Features/Authentication/presentation/pages/signning/sign.dart';
import 'package:syara_finder/Features/BrandsAndModels/presentation/manager/BrandsAndModelsProvider.dart';
import 'package:syara_finder/Features/BrandsAndModels/presentation/pages/BrandsPage/brandsPage.dart';
import '../Features/BrandsAndModels/data/models/Model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../Features/BrandsAndModels/presentation/pages/ModelsPage/modelsPage.dart';
import '../Features/Cars/presentation/pages/CarDetails/cardetails.dart';
import '../Features/Cars/data/models/Car.dart';
import '../Features/Home/presentation/manager/HomeProvider.dart';
import '../Features/Home/presentation/pages/HomePage/explorePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:url_launcher/url_launcher.dart';


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

Container buildSkipButton(BuildContext context,HomeProvider homeProvider) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.only(left: 20),
    child: TextButton(
      onPressed: () {
        homeProvider.returnNavBarToHome();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => explorePage(),));
      },
      child: Text(
          'Skip', style: TextStyle(fontWeight: FontWeight.bold,color:HexColor("#FF8308") ,fontSize: 25.sp)
      ),
    ),
  );
}

Shimmer buildShimmer() {
  return Shimmer.fromColors(
    baseColor: const Color.fromARGB(255, 255, 184, 92),
    highlightColor: const Color.fromARGB(255, 255, 116, 23),
    direction: ShimmerDirection.ltr,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, __) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(20))),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 30,
                    child: Container(
                      child: Container(
                        width: 180,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft:
                                Radius.circular(20),
                                topRight:
                                Radius.circular(20))),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10),
                      width: 180,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft:
                              Radius.circular(30),
                              bottomRight:
                              Radius.circular(30))),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 8),
                          Container(
                            color: Colors.white,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            color: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          Container(
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      itemCount: 10,
    ),
  );
}

AppBar buildCustomAppBar() {
  return AppBar(
    backgroundColor: HexColor("#FF8308"),
    elevation: 0,
    title: const Text('Available Car'),
  );
}
Future openLinkOfCurrentCar(String url) async {
  if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
}
IconButton buildIconButton({required String iconLink,required Function onPressed}) {
  return IconButton(onPressed: (){
    onPressed();
  }, icon: Image.network(iconLink));
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

List buildUpperPart({required BrandsAndModelsProvider appProviderInstance, required BuildContext context,bool isClickable=true}){
  return [
    Container(
      child: buildTextField(hintText: "Location",controller: appProviderInstance.locationController,appProviderInstance: appProviderInstance),
    ),
    LeftOrRightSection(isClickable: true,)
  ];
}

class LeftOrRightSection extends StatefulWidget {
  bool isClickable=true;
  LeftOrRightSection({
    Key? key,
    required this.isClickable
  }) : super(key: key);

  @override
  State<LeftOrRightSection> createState() => _LeftOrRightSectionState();
}

class _LeftOrRightSectionState extends State<LeftOrRightSection> {
  late BrandsAndModelsProvider appProviderInstance;

  @override
  Widget build(BuildContext context) {
    appProviderInstance = Provider.of<BrandsAndModelsProvider>(context);
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.5.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildSection(title: "Brand",subTitle: (appProviderInstance.currentBrand.brandName!=null)?appProviderInstance.currentBrand.brandName:"No Brand Selected",context: context,nextPage: brandsPage(),isClickable: widget.isClickable),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.5.w),
                    height: 52.h,
                    width: 2,
                    color: const Color(0xff959595),
                  ),
                  buildSection(title: "Model",subTitle:(appProviderInstance.selectedModel!=null)?appProviderInstance.selectedModel!.modelName:"No Model Selected"  ,context: context,nextPage: modelsPage(),isClickable: widget.isClickable),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
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

Positioned buildPositioned(HomeProvider appProviderInstance,Car currentCar) {
  return Positioned(
    top: 15.h,
    right: 15.w,
    child: ClipOval(
      child: Material(
        color: Colors.white, // Button color
        child: InkWell(
          splashColor: Colors.white, // Splash color
          onTap: () {
            if(appProviderInstance.isCarlInFavourites(currentCar)){
              appProviderInstance.removeFromFavourites(currentCar);
            }
            else{
              appProviderInstance.addToFavourites(currentCar);
            }
          },
          child: SizedBox(width: 40.h, height: 40.h, child: Icon(appProviderInstance.isCarlInFavourites(currentCar)?Icons.favorite:Icons.favorite_border_outlined,size: 20.h,color: Color(0xffEE4B42),)),
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

TextField buildTextField({TextEditingController?controller,String ?hintText,bool isSearchButton=true,BrandsAndModelsProvider ?appProviderInstance,bool ?isModelField =true}) {

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
                return isModelField!? appProviderInstance!.listOfModels:appProviderInstance!.listOfYears;
              },
              onSelected: (dynamic value) {
                if(isModelField!){
                  appProviderInstance!.updateCurrentModel(value);
                }
                else{
                  appProviderInstance!.updateCurrentYear(value);
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

Text buildText(String text,Color color) {
  return Text(text,style: TextStyle(
      color: color,
      fontSize: 14.sp
  ),);
}

Row buildIconWithText({required HomeProvider appProviderInstance,required String text,required IconData icon}) {
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

bool showDialogWhenProfilePageTapped(BuildContext context,AuthProvider authProvider){
  if (authProvider.userCredential == null&&authProvider.additionalUserInfo==null&&authProvider.profile==null) {
    showDialogWithMessage(context: context,message: "You Should Be Logged In First To Show Your Profile");
    return false;
  }
  else{
    return true;
  }
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

Future<dynamic> showDialogWithMessage({required BuildContext context, required String message}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
            }, child: const Text("Cancel")),
            TextButton(onPressed: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => signning(),));
            }, child: const Text("Log In"))
          ],
        );
      });
}

AppBar buildAppBar(BuildContext context,String title,HomeProvider appProviderInstance) {
  return AppBar(
    backgroundColor: const Color(0xffF9FBFC),
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.black,size: 17.h,),
      onPressed: () {
         if(appProviderInstance.navBarSelectedIndex==0){
           Navigator.of(context).pop();
         }
         else{
           appProviderInstance.returnNavBarToHome();
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