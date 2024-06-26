// ignore_for_file: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:syara_finder/Core/Componantes.dart';

import '../../../data/models/Car.dart';

class carItemInFilteredList extends StatefulWidget {
  Car currentCar;
  carItemInFilteredList({
    Key? key,required this.currentCar

  }) : super(key: key);

  @override
  State<carItemInFilteredList> createState() => _carItemInFilteredListState();
}

class _carItemInFilteredListState extends State<carItemInFilteredList> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 393.h,
      child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.currentCar.images![0].url!,
                    imageBuilder: (context,imageProvider){
                      return Container(
                        height: 393.h*0.4,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.only(topRight: Radius.circular(12.r),topLeft: Radius.circular(12.r)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(widget.currentCar.images![0].url.toString())
                            )
                        ),
                      );
                    },

                  ),
                  buildPositioned(widget.currentCar,context),
                ],
              ),
              //  SizedBox(height: 20.h,),
              buildTextOfCarPrice("\$ ${widget.currentCar.price.toString()}",22),
              //   SizedBox(height: 5.h,),
              buildTextOfCarName(widget.currentCar.model!.modelName!,16),
              // SizedBox(height: 10.h,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.5.w),
                child: Row(
                  children: [
                    buildIconWithText(text: widget.currentCar.carMeter.toString(),icon: Icons.speed_sharp),
                    SizedBox(width: 46.w,),
                    buildIconWithText(text: widget.currentCar.year!.yearName.toString(),icon: Icons.calendar_today)
                  ],
                ),
              ),
              buildButton(textSize: 16,onTap: (){
                openLinkOfCurrentCar(widget.currentCar.originUrl!);
              }, buttonText: 'Go to website',height: 60.h,width:double.infinity ),
            ],
          )
      ),
    );
  }
}