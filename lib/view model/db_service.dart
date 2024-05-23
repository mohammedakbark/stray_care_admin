import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:stray_care_admin/model/add_medicines.dart';
import 'package:stray_care_admin/model/adoption_notification_model.dart';
import 'package:stray_care_admin/model/book_appoinment_model.dart';
import 'package:stray_care_admin/model/payment_model.dart';
import 'package:stray_care_admin/model/user_model.dart';
import 'package:stray_care_admin/model/user_reportincedent_model.dart';

class DBService with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  List<ReportIncidentModel> listofIncident = [];

  getAllInciden() async {
    final snapshot = await db.collection("New Incident").get();

    log(snapshot.docs.length.toString());
    listofIncident = snapshot.docs
        .map((e) => ReportIncidentModel.fromJson(e.data()))
        .toList();
  }

  List<ReportIncidentModel> adoptableList = [];

  getAdoptableAnimals() async {
    final snapshot = await db
        .collection("New Incident")
        .where("adoptionOption", isEqualTo: true)
        .get();

    log(snapshot.docs.length.toString());
    adoptableList = snapshot.docs
        .map((e) => ReportIncidentModel.fromJson(e.data()))
        .toList();
  }

  List<UserModel> userList = [];
  getAllUser() async {
    final snapshot = await db.collection("user").get();
    userList = snapshot.docs.map((e) => UserModel.fromJson(e.data())).toList();
  }

  changeAnimalToAdoptableCategory(id) {
    db.collection("New Incident").doc(id).update({"adoptionOption": true});
    notifyListeners();
  }

  List<AddMedicines> medicinesList = [];
  Future getAllMedicines() async {
    final snapshot = await db.collection("Medicines").get();
    medicinesList =
        snapshot.docs.map((e) => AddMedicines.fromJson(e.data())).toList();
  }

  List<BookAppoinmentModel> listOfAllBookings = [];
  fetchAllBookings() async {
    final snapshot = await db.collection("Appoinment to vetirinery").get();
    listOfAllBookings = snapshot.docs
        .map((e) => BookAppoinmentModel.fromjson(e.data()))
        .toList();
  }

  List<AdoptionNotificationModel> listOfNotification = [];
  getAllNotification() async {
    final snapshot = await db.collection("Adoption request notification").get();
    listOfNotification = snapshot.docs
        .map((e) => AdoptionNotificationModel.fromjson(e.data()))
        .toList();
  }

  rejectAdoptionRequest(id) async {
    await db.collection("Adoption request notification").doc(id).delete();
    notifyListeners();
  }

  completeTheAdoptionProcess(id) async {
    await db.collection("New Incident").doc(id).delete();

    notifyListeners();
  }

  List<PaymentModel> paymentLsit = [];
  getAllDoantions() async {
    final snapsht = await db.collection("Donations").get();
    paymentLsit =
        snapsht.docs.map((e) => PaymentModel.fromJson(e.data())).toList();
  }
}
