import '../../domain/entities/ImageEntity.dart';

class Images extends ImageEntity{


  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carId = json['car_id'];
    url = json['url'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['car_id'] = this.carId;
    data['url'] = this.url;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}