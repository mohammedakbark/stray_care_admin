import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stray_care_admin/view%20model/db_service.dart';

class Notificationpage extends StatelessWidget {
  const Notificationpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Adoption Request Notification",
          style: TextStyle(
              color: Color.fromARGB(255, 111, 111, 111),
              fontSize: 25,
              fontWeight: FontWeight.w900),
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer<DBService>(builder: (context, dbService, child) {
          return FutureBuilder(
              future: dbService.getAllNotification(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final data = dbService.listOfNotification;
                return Expanded(
                    child: data.isEmpty
                        ? Center(
                            child: Text("No Request"),
                          )
                        : ListView.separated(
                            itemBuilder: ((context, index) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      const Color.fromARGB(255, 200, 226, 247),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                          "Request Details",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Collection Date: ${data[index].collectiondate.substring(0, 10)}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              "Request Date: ${data[index].adoptionRequestDate.substring(0, 10)}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              "Contact Number: ${data[index].contactNumber}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromARGB(
                                                      255, 104, 104, 104)),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          "Animal Details",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Collected Place: ${data[index].reportIncidentModel.collectedPlace}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              "Collected Date: ${data[index].reportIncidentModel.dateTime}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              "Incident: ${data[index].reportIncidentModel.typeOfAnimal}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          dbService.rejectAdoptionRequest(
                                              data[index].notiId);
                                        },
                                        child: const Text(
                                          "Reject Request",
                                          style: TextStyle(color: Colors.red),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .showMaterialBanner(MaterialBanner(
                                                  content: Text(
                                                      "Make sure adoption process is completed"),
                                                  actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .hideCurrentMaterialBanner();
                                                    },
                                                    child: Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    )),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      dbService
                                                          .completeTheAdoptionProcess(
                                                              data[index]
                                                                  .reportIncidentModel
                                                                  .incidentId);
                                                      dbService
                                                          .rejectAdoptionRequest(
                                                              data[index]
                                                                  .notiId);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .hideCurrentMaterialBanner();
                                                    },
                                                    child: Text(
                                                      "Complated",
                                                      style: TextStyle(
                                                          color: Colors.green),
                                                    ))
                                              ]));
                                        },
                                        child: const Text(
                                          "Accept Request",
                                          style: TextStyle(color: Colors.green),
                                        ))
                                  ],
                                ),
                              );
                            }),
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 20,
                              );
                            },
                            itemCount: data.length));
              });
        })
      ],
    );
  }
}
