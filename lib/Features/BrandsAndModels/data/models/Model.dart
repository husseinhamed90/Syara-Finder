import 'package:syara_finder/Features/BrandsAndModels/data/models/Brand.dart';
import 'package:syara_finder/Features/BrandsAndModels/domain/entities/ModelEntity.dart';

class Model extends ModelEntity {
   Model( {
    required int? id,
    required int? brandId,
    required String? modelName,
    required int? isDeleted,
    required String? createdAt,
    required String? updatedAt,
    required Brand brand}) :
        super(id: id,brandId: brandId,modelName: modelName,updatedAt: updatedAt,isDeleted: isDeleted,createdAt: createdAt,brand: brand);
   
  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(id: json['id'], brandId: json['brand_id'], modelName: json['model_name'], isDeleted:  json['is_deleted'], createdAt:  json['created_at'], updatedAt: json['updated_at'], brand: Brand.fromJson(json['brand']),);
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'brand_id': brandId, 'model_name': modelName,'is_deleted' :isDeleted,'created_at':createdAt,'updated_at':updatedAt,"brand":brand!.toJson()};
  }

  // Model.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   brandId = json['brand_id'];
  //   modelName = json['model_name'];
  //   isDeleted = json['is_deleted'];
  //   createdAt = json['created_at'];
  //   updatedAt = json['updated_at'];
  //   brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['brand_id'] = this.brandId;
  //   data['model_name'] = this.modelName;
  //   data['is_deleted'] = this.isDeleted;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   if (this.brand != null) {
  //     data['brand'] = this.brand!.toJson();
  //   }
  //   return data;
  // }
}