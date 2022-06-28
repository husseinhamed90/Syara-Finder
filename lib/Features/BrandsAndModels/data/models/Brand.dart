

import '../../../BrandsAndModels/domain/entities/BrandEntity.dart';

class Brand extends BrandEntity {
   const Brand( {
     required int? id,
     required String? brandName,
     required String? brandLogo,
     required int? isDeleted,
     required String? createdAt,
     required String? updatedAt}) :
         super(id: id, brandName: brandName, brandLogo: brandLogo,createdAt: createdAt,isDeleted: isDeleted,updatedAt: updatedAt);


   factory Brand.fromJson(Map<String, dynamic> json) {
     return Brand(id: json['id'], brandName: json['brand_name'], brandLogo: json['brand_logo'], isDeleted:  json['is_deleted'], createdAt:  json['created_at'], updatedAt: json['updated_at'],);
   }
   Map<String, dynamic> toJson() {
     return {'id': id, 'title': brandName, 'brand_logo': brandLogo,'is_deleted' :isDeleted,'created_at':createdAt,'updated_at':updatedAt};
   }

  // BrandModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   brandName = json['brand_name'];
  //   brandLogo = json['brand_logo'];
  //   isDeleted = json['is_deleted'];
  //   createdAt = json['created_at'];
  //   updatedAt = json['updated_at'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['brand_name'] = this.brandName;
  //   data['brand_logo'] = this.brandLogo;
  //   data['is_deleted'] = this.isDeleted;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   return data;
  // }
}
