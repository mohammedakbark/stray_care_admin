import 'package:flutter/material.dart';
import 'package:stray_care_admin/admin/home_show_incident.dart';
import 'package:stray_care_admin/admin/notification_page.dart';
import 'package:stray_care_admin/admin/doantion_view.dart';
import 'package:stray_care_admin/admin/user_view.dart';
import 'package:stray_care_admin/admin/vetirinery_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> items = [
    "Home",
    "User",
    // "Forest",
    "Veterinary",
    // "Government",
    "Donation",
    "Notification",
  ];

  List<Widget> pages = [
    Text("Home"),
    Text("User"),
    Text("Veterinary"),
    // Text("Government"),
    Text("data"),
    Text("data"),
    Text("data"),
  ];
  List<Widget> page = [
    HomeViewIncident(),
    UserViewPage(),
    // ForestViewPage(), // Text("Government"),
    VetirinaryViewpage(),
    DaonationViewPAge(),
    Notificationpage(),
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 158, 212, 255),
                borderRadius: BorderRadius.circular(20)),
            height: 80,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: TextButton(
                      onPressed: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: Text(items.elementAt(index),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: current == index
                                  ? Color.fromARGB(255, 0, 125, 250)
                                  : const Color.fromARGB(179, 0, 0, 0))),
                    )),
                  );
                }),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(child: page[current])
        ],
      ),
    );
  }
}
