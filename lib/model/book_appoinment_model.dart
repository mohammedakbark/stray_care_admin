class BookAppoinmentModel {
  String uid;
  String appoinmentDate;
  String name;
  String place;
  String? bookingid;

  BookAppoinmentModel(
      {required this.appoinmentDate,
      required this.name,
      required this.uid,
      required this.place,
       this.bookingid});
  Map<String, dynamic> toJson(id) => {
        "uid": uid,
        "appoinmentDate": appoinmentDate,
        "name": name,
        "bookingid": id,
        "place":place,
      };
  factory BookAppoinmentModel.fromjson(Map<String, dynamic> json) {
    return BookAppoinmentModel(
      place:json["place"],
        appoinmentDate: json["appoinmentDate"],
        name: json["name"],
        uid: json["uid"],
        bookingid: json["bookingid"]);
  }
}
