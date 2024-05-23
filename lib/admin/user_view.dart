import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stray_care_admin/view%20model/db_service.dart';

class UserViewPage extends StatelessWidget {
  UserViewPage({super.key});
  int i = 1;
  int incrementindex() {
    i = 1;
    return i++;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DBService>(builder: (context, dbService, child) {
      return FutureBuilder(
          future: dbService.getAllUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final data = dbService.userList;
            return data.isEmpty
                ? Center(
                    child: Text("No Users"),
                  )
                : SizedBox(
                    child: DataTable(
                    horizontalMargin: 20,
                    border: TableBorder.all(),
                    columns: [
                      DataColumn(
                          label: Text(
                        "No.",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      )),
                      DataColumn(
                          label: Text(
                        "UID",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      )),
                      // DataColumn(
                      //     label: Text(
                      //   "User Name",
                      //   style: TextStyle(
                      //       color: Colors.grey,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 22),
                      // )),
                    ],

                    rows: data
                        .map((e) => DataRow(cells: [
                              DataCell(Text(
                                incrementindex().toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              )),
                              DataCell(Text(
                                e.uid.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              )),
                              // DataCell(Text(
                              //   e.name,
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.w500, fontSize: 15),
                              // )),
                            ]))
                        .toList(),
                    //  rows: [
                    //   DataRow(cells: [
                    //     DataCell(Text("data")),
                    //     DataCell(Text("data")),
                    //     DataCell(Text("data"))
                    //   ]),

                    // ]
                  ));
            // : ListView.separated(
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         title: Text(data[index].uid.toString()),
            //       );
            //     },
            //     separatorBuilder: (context, index) => Divider(),
            //     itemCount: data.length);
          });
    });
  }
}
