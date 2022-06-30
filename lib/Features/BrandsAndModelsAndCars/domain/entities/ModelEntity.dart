import '../../data/models/Brand.dart';

class ModelEntity {

  int? id;
  int? brandId;
  String? modelName;
  int? isDeleted;
  String? createdAt;
  String? updatedAt;
  Brand? brand;

  ModelEntity({this.id,
    this.brandId,
    this.modelName,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.brand});


}