class UserEntity {
  int? id;
  String? username;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String ?providerName;

  UserEntity(
      {this.id,
        this.username,
        this.email,
        this.password,
        this.firstName,
        this.lastName,this.providerName});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['providerName'] = this.providerName;
    return data;
  }
}