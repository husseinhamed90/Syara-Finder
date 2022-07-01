// ignore_for_file: file_names, sort_child_properties_last, unused_import, depend_on_referenced_packages, implementation_imports, prefer_const_constructors, non_constant_identifier_names
import 'dart:convert';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syara_finder/Features/Authentication/data/remote/data_sources/FirebaseService.dart';
import '../../../../../../Core/Componantes.dart';
import '../../../../../../injection_container.dart';
import '../../../../../BrandsAndModelsAndCars/data/models/Car.dart';
import '../../../../../BrandsAndModelsAndCars/data/remote/data_sources/ApiService.dart';
import '../../../../../BrandsAndModelsAndCars/domain/entities/BrandEntity.dart';
import '../../../../../BrandsAndModelsAndCars/presentation/manager/BrandsAndModelsProvider.dart';
import '../../../../../BrandsAndModelsAndCars/presentation/pages/AvailableCars/available_car_screen.dart';
import '../../../../../BrandsAndModelsAndCars/presentation/pages/FilteredListPage/FilteredList.dart';
import '../../../manager/HomeProvider.dart';
import '../../../widgets/BuildExplorePageWidgets/LeftOrRightSectionWidget.dart';
import '../../../widgets/BuildExplorePageWidgets/shimmerWidget.dart';

class buildExplorePage extends StatefulWidget {
  const buildExplorePage({
    Key? key,
  }) : super(key: key);

  @override
  State<buildExplorePage> createState() => _buildExplorePageState();
}

class _buildExplorePageState extends State<buildExplorePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Stack(children: [
                      Container(
                        height: 420.h,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              //bottomLeft: Radius.circular(30),
                            //  bottomRight: Radius.circular(30),
                            ),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/explorehome.jpg"))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 50),
                        child: Text(
                          "Find Your Favorite",
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 100),
                        child: Text(
                          "Used Cars",
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                    Container(
                      height: 146.h,
                    )
                  ],
                ),
                Positioned(
                  left: 30.h,
                  right: 30.h,
                  top: 320.h,
                  child: SizedBox(
                    height: 246.h,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Container(
                        padding: EdgeInsets.all(17.h),
                        child: Column(
                          children: [
                            Container(
                              child: buildTextField(hintText: "Location",controller: dependencyInjection.get<BrandsAndModelsCarsProvider>().locationController),
                            ),
                            LeftOrRightSection(isClickable: true,),
                            buildButton(
                                textSize: 16,
                                onTap: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FilteredList()));
                                },
                                buttonText: 'Search',
                                height: 60.h,
                                width: double.infinity)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(children: [
                Text(
                  "Most Viewed Cars",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AvailableCarScreen()),
                    );
                  },
                  child: Text(
                    "View All >>",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: HexColor("#FF8308"),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              height: 250,
              child: FutureBuilder<List<Car>>(
                future: context.read<BrandsAndModelsCarsProvider>().fetchCars(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Car>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Hero(
                                  tag: snapshot.data![index].images![0].url!,
                                  child: Container(
                                    width: 180,
                                    child: CachedNetworkImage(imageUrl: snapshot.data![index].images![0].url!,imageBuilder: (context, imageProvider) => Container(
                                      decoration: BoxDecoration(
                                        color: HexColor("#FF8308"),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                        image: DecorationImage(
                                            image: imageProvider, fit: BoxFit.fill),
                                      ),
                                    ),

                                    ),
                                  ),
                                  transitionOnUserGestures: true,
                                ),
                                flex: 30,
                              ),
                              Expanded(
                                flex: 30,
                                child: Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  width: 180,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 8),
                                      Text(
                                        snapshot.data![index].model!.modelName!,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        snapshot.data![index].description!,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "${snapshot.data![index].price} AED",
                                        style: TextStyle(
                                          color: HexColor("#FF8308"),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30))),
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          showDialogIfNotLoggedIn(context,snapshot.data![index]);
                        },
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ShimmerWidget();
                  }
                  return Center(
                    child: Text("loading..."),
                  );
                },
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              alignment: Alignment.centerLeft,
              height: 25.h,
              child: Text(
                "Featured Brands",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 150,
                      child: FutureBuilder<List<BrandEntity>>(
                        future: context.read<BrandsAndModelsCarsProvider>().fetchBrandsFromApi(),
                        builder: (context, AsyncSnapshot<List<BrandEntity>> snapshot) {
                          if (snapshot.hasData){
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                 //     color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20)),
                                  width: 280,
                                  margin: EdgeInsets.all(10),
                                  child: Stack(
                                    children: <Widget>[
                                      Center(
                                        child: CachedNetworkImage(
                                          imageUrl:snapshot.data![index].brandLogo!,height: 80,
                                          errorWidget: (context,object,stackTrace){
                                            return CachedNetworkImage(imageUrl: "https://img.icons8.com/ios-filled/344/no-image.png",height: 80,);
                                          },
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Container(
                                          margin: EdgeInsets.all(20),
                                          child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              snapshot.data![index].brandName!,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return ShimmerWidget();
                          }
                          return Center(
                            child: Text("loading..."),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}