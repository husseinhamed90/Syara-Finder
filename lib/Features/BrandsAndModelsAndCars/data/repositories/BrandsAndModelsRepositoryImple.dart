import 'package:syara_finder/Features/BrandsAndModelsAndCars/data/remote/data_sources/ApiService.dart';
import 'package:syara_finder/Features/BrandsAndModelsAndCars/domain/entities/BrandEntity.dart';

import '../../domain/repositories/BrandsAndModelsRepository.dart';
import '../models/Car.dart';

class BrandsAndModelsRepositoryImple extends BrandsAndModelsRepository{
  @override
  Future<List<BrandEntity>> fetchBrands() async{
    return await BrandsAndModelsApiService.fetchBrands();
  }

  @override
  Future<List<Car>> fetchCars() async{
    return await BrandsAndModelsApiService.fetchCars();
  }
}