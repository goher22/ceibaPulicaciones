class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });
  int id;
  String name;
  String phone;
  String email;

  factory UserModel.clone(UserModel user) => UserModel(
        id: user.id,
        name: user.name,
        phone: user.phone,
        email: user.email,
      );

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
      );
}
