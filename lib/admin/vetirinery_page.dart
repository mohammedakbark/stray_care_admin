import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stray_care_admin/view%20model/db_service.dart';

class VetirinaryViewpage extends StatelessWidget {
  const VetirinaryViewpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Medicines",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),

              // Container(/)
              Text(
                "Bookings",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Consumer<DBService>(builder: (context, dbService, child) {
            return Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: FutureBuilder(
                        future: dbService.getAllMedicines(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final data = dbService.medicinesList;
                          return ListView.separated(
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Text("${index + 1})"),
                                  title: Text(data[index].medicineName),
                                  subtitle: Text(data[index].usage),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                    endIndent: 30,
                                    indent: 30,
                                  ),
                              itemCount: data.length);
                        }),
                  ),
                  const VerticalDivider(),
                  const VerticalDivider(),
                  Expanded(
                    flex: 1,
                    child: FutureBuilder(
                        future: dbService.fetchAllBookings(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final data = dbService.listOfAllBookings;
                          return ListView.separated(
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Text("${index + 1})"),
                                  title: Text(data[index].name),
                                  subtitle: Text(data[index].place),
                                  trailing: Text(data[index].appoinmentDate),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                    endIndent: 30,
                                    indent: 30,
                                  ),
                              itemCount: data.length);
                        }),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
