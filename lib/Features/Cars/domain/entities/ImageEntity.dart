class ImageEntity{
  int? id;
  int? carId;
  String? url;
  int? isDeleted;
  String? createdAt;
  String? updatedAt;

  ImageEntity(
      {this.id,
        this.carId,
        this.url,
        this.isDeleted,
        this.createdAt,
        this.updatedAt});
}