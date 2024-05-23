import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stray_care_admin/admin/admin_login.dart';
import 'package:stray_care_admin/admin/home_page.dart';
import 'package:stray_care_admin/firebase_options.dart';
import 'package:stray_care_admin/view%20model/db_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DBService>(create: (_)=>DBService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stray Care admin',
        home: AdminLogin(),
      ),
    );
  }
}
