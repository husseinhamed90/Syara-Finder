import 'package:flutter/cupertino.dart';
import 'package:syara_finder/Features/Cars/data/repositories/CarsRepository.dart';

import '../../data/models/Car.dart';

class CarsProvider extends ChangeNotifier{
  CarsRepository carsRepository;
  CarsProvider(this.carsRepository);
  Future<List<Car>> fetchCars() async {
    return carsRepository.fetchCars();
  }
}