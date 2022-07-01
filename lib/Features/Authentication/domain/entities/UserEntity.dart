class UserEntity {
  int? id;
  String? username;
  String? email;
  String? password;
  String? firstName;
  String? lastName;

  UserEntity(
      {this.id,
        this.username,
        this.email,
        this.password,
        this.firstName,
        this.lastName});
}