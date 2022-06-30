// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:provider/provider.dart';
import 'package:syara_finder/Features/BrandsAndModelsAndCars/presentation/manager/BrandsAndModelsProvider.dart';

import '../../../data/models/Car.dart';
import 'carItemInFilteredList.dart';

class listOfCars extends StatefulWidget {
  List<Car>filteredars;
    listOfCars({
    Key? key,required this.filteredars
  }) : super(key: key);


  @override
  State<listOfCars> createState() => _listOfCarsState();
}

class _listOfCarsState extends State<listOfCars> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(height: 20.h,);
        },
        itemBuilder: (context, index) {
          return carItemInFilteredList(currentCar: context.watch<BrandsAndModelsCarsProvider>().filteredCars.value[index]);
        },
        itemCount: context.watch<BrandsAndModelsCarsProvider>().filteredCars.value.length,
      ),
      // child: FutureBuilder<List<Car>>(
      //   future: carsProvider!.fetchCars(),
      //   builder: (context, AsyncSnapshot<List<Car>>snapshot) {
      //     if(snapshot.hasData){
      //       return ListView.separated(
      //         separatorBuilder: (context, index) {
      //           return SizedBox(height: 20.h,);
      //         },
      //         itemBuilder: (context, index) {
      //           return carItemInFilteredList(currentCar: snapshot.data![index]);
      //         },
      //         itemCount: snapshot.data!.length,
      //       );
      //     }
      //     else{
      //       return const Center(
      //         child: CircularProgressIndicator()
      //       );
      //     }
      //
      //   },
      // ),
    );
  }
}