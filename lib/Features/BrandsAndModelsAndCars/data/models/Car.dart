

import '../../domain/entities/CarEntity.dart';
import 'Image.dart';
import 'Model.dart';
import 'Year.dart';

class Car extends CarEntity{

  Car.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelId = json['model_id'];
    yearId = json['year_id'];
    colorId = json['color_id'];
    description = json['description'];
    carMeter = json['car_meter'];
    price = json['price'];
    originUrl = json['origin_url'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    model = json['model'] != null ? Model.fromJson(json['model']) : null;
    year = json['year'] != null ? Year.fromJson(json['year']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['model_id'] = this.modelId;
    data['year_id'] = this.yearId;
    data['color_id'] = this.colorId;
    data['description'] = this.description;
    data['car_meter'] = this.carMeter;
    data['price'] = this.price;
    data['origin_url'] = this.originUrl;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.model != null) {
      data['model'] = model!.toJson();
    }
    if (this.year != null) {
      data['year'] = this.year!.toJson();
    }
    if (this.images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

