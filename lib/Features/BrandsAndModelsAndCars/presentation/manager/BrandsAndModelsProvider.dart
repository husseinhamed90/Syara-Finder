import 'package:flutter/material.dart';
import 'package:syara_finder/Features/BrandsAndModelsAndCars/domain/repositories/BrandsAndModelsRepository.dart';
import '../../../../Core/Componantes.dart';
import '../../../../injection_container.dart';
import '../../data/models/Car.dart';
import 'package:syara_finder/Features/BrandsAndModelsAndCars/domain/entities/BrandEntity.dart';
import '../../data/models/Model.dart';

class BrandsAndModelsCarsProvider extends ChangeNotifier{
  BrandEntity currentBrand = const BrandEntity();
  Model? selectedModel;
  int selectedYear = 0;
  TextEditingController locationController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController yearController = TextEditingController();



  List<Car>?cars;
  ValueNotifier<List<Car>> filteredCars =ValueNotifier<List<Car>>([]);
  Future<List<Car>> fetchCars() async {
    cars =await dependencyInjection.get<BrandsAndModelsRepository>().fetchCars();
    return cars!;
  }
  List<Car>filterCar(String brandName){
    filteredCars.value =cars!.where((element) => element.model!.brand!.brandName==brandName).toList();
    return filteredCars.value;
  }
  List<int> years = [2000, 2001, 2002, 2005, 2010, 2020, 2022];
  var listOfModels = <PopupMenuItem<Model>>[];
  var listOfYears = <PopupMenuItem<int>>[];
  void updateCurrentYear(int newYear) {
    selectedYear = newYear;
    yearController.text = newYear.toString();
    notifyListeners();
  }
  void createListOfYears() {
    listOfYears = [];
    for (var i = 0; i < years.length; i++) {
      listOfYears.add(buildPopupMenuItemOfYears(years[i]));
    }
  }

  void updateCurrentModel(Model currentModel) {
    selectedModel = currentModel;
    modelController.text = currentModel.modelName!;
    notifyListeners();
  }

  void updateCurrentBrand(BrandEntity newBrand) {
    selectedModel = null;
    selectedYear = 0;
    modelController.text = "";
    yearController.text = "";
    currentBrand = newBrand;
    notifyListeners();
  }

  List<BrandEntity> brandsObjects = [];

  Future<List<BrandEntity>> fetchBrandsFromApi()async{
    brandsObjects = await dependencyInjection.get<BrandsAndModelsRepository>().fetchBrands();
    return brandsObjects;
  }
}