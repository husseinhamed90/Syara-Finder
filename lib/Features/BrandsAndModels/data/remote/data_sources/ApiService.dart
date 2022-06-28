import 'dart:convert';
import 'package:syara_finder/Features/BrandsAndModels/data/models/Brand.dart';
import 'package:syara_finder/Features/BrandsAndModels/domain/entities/BrandEntity.dart';
import 'package:http/http.dart' as http;
import 'package:syara_finder/Shared/Constants.dart';

class BrandsAndModelsApiService{

  static Future<List<BrandEntity>> fetchBrands()async{
    final response = await http.get(Uri.parse('$BASE_URL/get-brands'));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      List list = result;
      return list.map((futureCars) => Brand.fromJson(futureCars)).toList();
    } else {
      throw Exception('Failed to load Cars');
    }
  }
}