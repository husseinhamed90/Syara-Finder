// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:provider/provider.dart';
import 'package:syara_finder/Features/Home/presentation/manager/HomeProvider.dart';

import '../../../data/models/Car.dart';

class FavouriteIconWidget extends StatelessWidget {

  Car currentCar;
  FavouriteIconWidget({
    Key? key,required this.currentCar
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      key: key,
      top: 15.h,
      right: 15.w,
      child: ClipOval(
        child: Material(
          color: Colors.white,
          child: InkWell(
            splashColor: Colors.white,
            onTap: () {
              if(context.read<HomeProvider>().isCarlInFavourites(currentCar)){
                context.read<HomeProvider>().removeFromFavourites(currentCar);
              }
              else{
                context.read<HomeProvider>().addToFavourites(currentCar);
              }
            },
            child: SizedBox(width: 40.h, height: 40.h, child: Icon(context.watch<HomeProvider>().isCarlInFavourites(currentCar)?Icons.favorite:Icons.favorite_border_outlined,size: 20.h,color: const Color(0xffEE4B42),)),
          ),
        ),
      ),
    );
  }
}
