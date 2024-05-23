import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stray_care_admin/view%20model/db_service.dart';

class HomeViewIncident extends StatelessWidget {
  const HomeViewIncident({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DBService>(builder: (context, dbservice, child) {
      return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
                unselectedLabelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                tabs: [
                  Tab(
                    text: "All Incidents",
                  ),
                  Tab(
                    text: "For Adoption",
                  )
                ]),
            Expanded(
              child: TabBarView(children: [
                FutureBuilder(
                  future: dbservice.getAllInciden(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final data = dbservice.listofIncident;
                    return GridView.builder(
                        itemCount: data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (data[index].adoptionOption == false) {
                                ScaffoldMessenger.of(context)
                                    .showMaterialBanner(MaterialBanner(
                                        backgroundColor: Colors.green,
                                        content: const Text(
                                            "Are you sure aboout moving this animal to adoption category"),
                                        actions: [
                                      TextButton(
                                          onPressed: () {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentMaterialBanner();
                                          },
                                          child: const Text(
                                            "Cancel",
                                            style: TextStyle(color: Colors.red),
                                          )),
                                      ElevatedButton(
                                          onPressed: () {
                                            dbservice
                                                .changeAnimalToAdoptableCategory(
                                                    data[index].incidentId);
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentMaterialBanner();
                                          },
                                          child: const Text(
                                            "Move to Adoption",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ))
                                    ]));
                              }
                            },
                            child: Column(children: [
                              Container(
                                height: 225,
                                width: 225,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            data[index].imageUrl))),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index].typeOfAnimal,
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Found from: ${data[index].collectedPlace}",
                                    style: const TextStyle(
                                      // color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "${data[index].description}",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      // fontSize: 22,
                                    ),
                                  ),
                                ],
                              )
                            ]),
                          );
                        });
                  },
                ),
                // }),
                FutureBuilder(
                    future: dbservice.getAdoptableAnimals(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final data = dbservice.adoptableList;
                      return GridView.builder(
                        itemCount: data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        itemBuilder: (context, index) {
                          return Column(children: [
                            Container(
                              height: 225,
                              width: 225,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(data[index].imageUrl))),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].typeOfAnimal,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Found from: ${data[index].collectedPlace}",
                                  style: const TextStyle(
                                    // color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "${data[index].description}",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    // fontSize: 22,
                                  ),
                                ),
                              ],
                            )
                          ]);
                        },
                      );
                    }),
              ]),
            ),
            // FutureBuilder(
            //     future: dbservice.getAllInciden(),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }
            //       final data = dbservice.listofIncident;
            //       return Expanded(
            //         flex: 1,
            //         child: GridView.builder(
            //           itemCount: data.length,
            //           gridDelegate:
            //               const SliverGridDelegateWithFixedCrossAxisCount(
            //                   crossAxisCount: 2),
            //           itemBuilder: (context, index) {
            //             return InkWell(
            //               onTap: () {
            //                 if (data[index].adoptionOption == false) {
            //                   dbservice.changeAnimalToAdoptableCategory(
            //                       data[index].incidentId);
            //                 }
            //               },
            //               child: Column(children: [
            //                 Container(
            //                   height: 225,
            //                   width: 225,
            //                   decoration: BoxDecoration(
            //                       image: DecorationImage(
            //                           image:
            //                               NetworkImage(data[index].imageUrl))),
            //                 ),
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       data[index].typeOfAnimal,
            //                       style: TextStyle(
            //                           color: Colors.grey,
            //                           fontSize: 22,
            //                           fontWeight: FontWeight.w600),
            //                     ),
            //                     Text(
            //                       "Found from: ${data[index].collectedPlace}",
            //                       style: TextStyle(
            //                         // color: Colors.grey,
            //                         fontSize: 16,
            //                       ),
            //                     ),
            //                     Text(
            //                       "${data[index].description}",
            //                       style: TextStyle(
            //                         color: Colors.grey,
            //                         // fontSize: 22,
            //                       ),
            //                     ),
            //                   ],
            //                 )
            //               ]),
            //             );
            //           },
            //         ),
            //       );
            //     }),
          ],
        ),
      );
    });
  }
}
