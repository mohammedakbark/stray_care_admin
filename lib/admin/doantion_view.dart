import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stray_care_admin/view%20model/db_service.dart';

class DaonationViewPAge extends StatelessWidget {
  const DaonationViewPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Doanations",
          style: TextStyle(
              color: const Color.fromARGB(255, 111, 111, 111),
              fontSize: 25,
              fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: 20,
        ),
        Consumer<DBService>(builder: (context, dbS, chuld) {
          return FutureBuilder(
              future: dbS.getAllDoantions(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final data = dbS.paymentLsit;
                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * .3,
                          child: Column(
                            children: [
                              Text(
                                "User ID :${data[index].uid}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              Text(
                                "Donation Amount :₹${data[index].amount}",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.green),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 20,
                          ),
                      itemCount: data.length),
                );
              });
        })
      ],
    );
  }
}
