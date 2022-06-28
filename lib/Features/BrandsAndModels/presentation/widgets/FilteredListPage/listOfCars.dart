// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import '../../../../Cars/data/models/Car.dart';
import 'carItemInFilteredList.dart';

class listOfCars extends StatefulWidget {
  const listOfCars({
    Key? key,
    required this.filteredCars,
  }) : super(key: key);

  final List<Car> filteredCars;

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
          return carItemInFilteredList(currentCar: widget.filteredCars[index]);
        },
        itemCount: widget.filteredCars.length,
      ),
    );
  }
}