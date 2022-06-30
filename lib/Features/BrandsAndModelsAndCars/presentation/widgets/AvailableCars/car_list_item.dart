import 'package:syara_finder/Core/Componantes.dart';
import 'package:flutter/material.dart';
import '../../../../BrandsAndModelsAndCars/data/models/Car.dart';
import 'car_infomation.dart';

class CarListItem extends StatelessWidget {
  const CarListItem(
    this.currentCar, {
    Key ?key,
  }) : super(key: key);

  final Car currentCar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialogIfNotLoggedIn(context,currentCar);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child:  CarInfomation(car: currentCar),
      ),
    );
  }

}
