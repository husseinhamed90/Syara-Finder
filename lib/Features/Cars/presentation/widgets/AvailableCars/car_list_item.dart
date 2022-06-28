
import 'package:syara_finder/Features/Cars/presentation/widgets/AvailableCars/car_infomation.dart';
import 'package:syara_finder/Shared/Componantes.dart';
import 'package:flutter/material.dart';
import '../../../data/models/Car.dart';

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
