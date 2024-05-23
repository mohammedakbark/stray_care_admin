import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stray_care_admin/admin/home_page.dart';

import '../constants/custom_colors.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                  color: CustomColors.buttonColor1,
                  borderRadius: BorderRadius.circular(80)),
              child: Padding(
                padding: const EdgeInsets.all(60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Stray",
                          style: GoogleFonts.abhayaLibre(
                            color: Colors.white,
                            fontSize: 100,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "care",
                          style: GoogleFonts.abhayaLibre(
                            color: Colors.white,
                            fontSize: 100,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 500,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Email",
                          labelStyle:
                              TextStyle(color: CustomColors.buttonColor1)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Password",
                          labelStyle:
                              TextStyle(color: CustomColors.buttonColor1)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: CustomColors.buttonColor1),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
