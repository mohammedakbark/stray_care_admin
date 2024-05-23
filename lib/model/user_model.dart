class UserModel {
  String? uid;
  // String name;

  UserModel({
    this.uid,
    // required this.name
  });

  Map<String, dynamic> toJson() => {"uid": uid,};
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json["uid"],
      // name: json["name"]
    );
  }
}
