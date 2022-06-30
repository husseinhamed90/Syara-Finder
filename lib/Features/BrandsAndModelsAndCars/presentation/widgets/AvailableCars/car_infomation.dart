
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../Home/presentation/manager/HomeProvider.dart';
import '../../../../BrandsAndModelsAndCars/data/models/Car.dart';
import '../../../../../Core/Constants.dart';
import 'attribute.dart';

class CarInfomation extends StatelessWidget {
  Car car;
  CarInfomation({
    key,
    required this.car,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      margin:  EdgeInsets.only(top: 10.h,left: 10.w,right: 10.w),
      //padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: mCardColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 110.h,
             //  width:( MediaQuery.of(context).size.width-20)*0.45,
              child: Image.network(
                fit: BoxFit.fill,
              //  height: 140.h,
                car.images![0].url!,

              ),
            ),
          ),
          SizedBox(width: 10.w,),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 120.h,
             // width:( MediaQuery.of(context).size.width-20)*0.551,
              child:   Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(height: 5.h,),
                  Row(
                    children: [
                      Attribute(
                        value: car.model!.brand!.brandName!,
                        name: '',
                      ),
                      const Spacer(),
                      ClipOval(
                        child: Material(
                          color: Colors.white, // Button color
                          child: InkWell(
                            splashColor: Colors.white, // Splash color
                            onTap: () {
                              if(context.read<HomeProvider>().isCarlInFavourites(car)){
                                context.read<HomeProvider>().removeFromFavourites(car);
                              }
                              else{
                                context.read<HomeProvider>().addToFavourites(car);
                              }
                            },
                            child: SizedBox(width: 40.h, height: 40.h, child: Icon(context.watch<HomeProvider>().isCarlInFavourites(car)?Icons.favorite:Icons.favorite_border_outlined,size: 20.h,color: Color(0xffEE4B42),)),
                          ),
                        ),
                      ),
                       SizedBox(width: 10.w,)
                    ],
                  ),
                  Text(
                    '\$${car.price}',
                    style:  TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   Expanded(
                      child: AutoSizeText(
                        'dumy text for design dmmmmmmdasdd dfdsdsf' ,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          overflow: TextOverflow.clip,
                          fontWeight: FontWeight.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                  ),
                ],
              ),
            ),
          )

          // SizedBox(
          //   height: 16,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Attribute(
          //       value: car.model!.brand!.brandName!,
          //       name: 'Brand',
          //     ),
          //     Attribute(
          //       value: car.model!.id.toString(),
          //       name: 'Model No',
          //     ),
          //     Attribute(
          //       value: "77/km",
          //       name: 'CO2',
          //     ),
          //     Attribute(
          //       value: "5.5 L",
          //       name: 'Fule Cons.',
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}

