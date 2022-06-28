import 'package:syara_finder/Features/Cars/data/models/Car.dart';
import 'package:syara_finder/Features/Cars/data/remote/data_sources/CarsApiService.dart';

import '../../data/repositories/CarsRepository.dart';

class CarsRepositoryImpl extends CarsRepository{
  @override
  Future<List<Car>> fetchCars() async{
    return await CarsApiService.fetchCars();
  }

}