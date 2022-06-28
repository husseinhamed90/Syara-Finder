import 'package:syara_finder/Features/BrandsAndModels/data/remote/data_sources/ApiService.dart';
import 'package:syara_finder/Features/BrandsAndModels/domain/entities/BrandEntity.dart';

import '../../domain/repositories/BrandsAndModelsRepository.dart';

class BrandsAndModelsRepositoryImple extends BrandsAndModelsRepository{
  @override
  Future<List<BrandEntity>> fetchBrands() async{
    return await BrandsAndModelsApiService.fetchBrands();
  }
}