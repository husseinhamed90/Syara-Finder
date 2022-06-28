class BrandEntity{
  final int? id;
  final String? brandName;
  final String? brandLogo;
  final int? isDeleted;
  final String? createdAt;
  final String? updatedAt;

  const BrandEntity(
      {this.id,
        this.brandName,
        this.brandLogo,
        this.isDeleted,
        this.createdAt,
        this.updatedAt});
}