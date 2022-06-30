// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:provider/provider.dart';
import 'package:syara_finder/Core/Componantes.dart';
import 'package:syara_finder/Features/Home/presentation/manager/HomeProvider.dart';

class buildFavouritesList extends StatefulWidget {
  @override
  _buildFavouritesListState createState() => _buildFavouritesListState();
}

class _buildFavouritesListState extends State<buildFavouritesList> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(context,"Favourites"),
      body: Column(
        children: [
          SizedBox(height: 30.h,),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Stack(
                children: [
                  Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26.r)),
                      child: SizedBox(
                          height: 151.h,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: 150.w,
                                  child: CachedNetworkImage(imageUrl: context.watch<HomeProvider>().favourites[index].images![0].url!,height: 151.h,fit: BoxFit.cover,imageBuilder: (context, imageProvider) => Container(
                                    height: 151.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(26.r),bottomLeft: Radius.circular(26.r)),
                                      image: DecorationImage(
                                          image: imageProvider, fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 17.5.w,),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 15.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      buildTextOfCarPrice("\$ ${context.watch<HomeProvider>().favourites[index].price.toString()}",16),
                                       SizedBox(height: 5.h,),
                                       buildTextOfCarName(context.watch<HomeProvider>().favourites[index].model!.modelName!,14),
                                       SizedBox(height: 10.h,),
                                       Container(
                                        margin: EdgeInsets.symmetric(horizontal: 20.5.w),
                                        child: Row(
                                          children: [
                                            buildIconWithText(text: context.watch<HomeProvider>().favourites[index].carMeter.toString(),icon: Icons.speed_sharp),
                                            SizedBox(width: 46.w,),
                                            buildIconWithText(text: context.watch<HomeProvider>().favourites[index].year!.yearName.toString(),icon: Icons.calendar_today)
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      buildButton(textSize: 10,onTap: (){
                                        openLinkOfCurrentCar(context.watch<HomeProvider>().favourites[index].originUrl!);
                                      }, buttonText: 'Go to website',height: 38.h,width:98.w ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ))
                  ),
                  buildPositioned(context.watch<HomeProvider>().favourites[index],context)
                ],
              );
            },itemCount: context.watch<HomeProvider>().favourites.length),
          ),
        ],
      ),
    );
  }


}
