import '../../data/models/Image.dart';
import '../../data/models/Year.dart';

import '../../../BrandsAndModels/data/models/Model.dart';


class  CarEntity{
  int? id;
  int? modelId;
  int? yearId;
  int? colorId;
  String? description;
  int? carMeter;
  int? price;
  String? originUrl;
  int? isDeleted;
  String? createdAt;
  String? updatedAt;
  Model? model;
  Year? year;
  List<Images>? images;

  CarEntity(
      {this.id,
        this.modelId,
        this.yearId,
        this.colorId,
        this.description,
        this.carMeter,
        this.price,
        this.originUrl,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.model,
        this.year,
        this.images});

}