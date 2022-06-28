import '../models/Car.dart';

abstract class CarsRepository{
  Future<List<Car>> fetchCars();
}