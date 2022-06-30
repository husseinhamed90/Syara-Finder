class Year {
  int? id;
  String? yearName;
  int? isDeleted;
  String? createdAt;
  String? updatedAt;



  Year.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    yearName = json['year_name'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['year_name'] = this.yearName;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}