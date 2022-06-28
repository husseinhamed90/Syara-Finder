import 'dart:convert';
import '../../../../../Shared/Constants.dart';
import '../../models/Car.dart';
import 'package:http/http.dart' as http;

class CarsApiService{
  static Future<List<Car>> fetchCars() async {
    final response = await http.get(Uri.parse('$BASE_URL/get-cars'));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      List list = result;
      return list.map((futureCars) => Car.fromJson(futureCars)).toList();
    } else {
      throw Exception('Failed to load Cars');
    }
  }
}