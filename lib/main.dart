import 'package:antrianku/DBController/controller.dart';
import 'package:antrianku/mitra/homePageMitra.dart';
import 'package:antrianku/pengantri/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'WelcomePage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  final Database database = Get.put(Database());

  Widget? homePage;

  database.getUsn();
  if (user != null) {
    if (database.role != 'mitra') {
      homePage = const HomePageMitra();
    } else {
      homePage = const HomePage();
    }
  } else {
    homePage = const WelcomePage();
  }
  runApp(MyApp(homePage: homePage));
}

class MyApp extends StatelessWidget {
  final Widget homePage;

  const MyApp({super.key, required this.homePage});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) {
          return GetMaterialApp(
            home: homePage,
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            getPages: [
              GetPage(name: '/', page: () => const WelcomePage()),
            ],
            theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
          );
        });
  }
}
