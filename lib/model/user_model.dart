class UserModel {
  String id;
  String email;
  String userName;
  String age;
  String phone;

  UserModel({
    this.id = "",
    required this.email,
    required this.userName,
    required this.age,
    required this.phone,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          email: json["email"],
          userName: json["userName"],
          age: json["age"],
          phone: json["phone"],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "age": age,
      "email": email,
      "phone": phone,
      "userName": userName,
    };
  }
}
