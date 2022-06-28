import 'package:flutter/material.dart';
import 'package:syara_finder/Features/BrandsAndModels/domain/repositories/BrandsAndModelsRepository.dart';
import '../../data/remote/data_sources/ApiService.dart';
import 'package:syara_finder/Features/BrandsAndModels/domain/entities/BrandEntity.dart';
import '../../data/models/Model.dart';
import 'package:syara_finder/Shared/Componantes.dart';

class BrandsAndModelsProvider extends ChangeNotifier{
  BrandsAndModelsRepository brandsAndModelsRepository;
  BrandsAndModelsProvider(this.brandsAndModelsRepository);
  BrandEntity currentBrand = BrandEntity();
  Model? selectedModel;
  int selectedYear = 0;
  TextEditingController locationController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController yearController = TextEditingController();


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
    brandsObjects = await brandsAndModelsRepository.fetchBrands();
    return brandsObjects;
  }
}