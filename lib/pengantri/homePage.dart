// ignore_for_file: file_names

import 'package:antrianku/DBController/controller.dart';
import 'package:antrianku/pengantri/dapatNomor.dart';
import 'package:antrianku/pengantri/kategoriPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Database db = Database();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Database database = Get.put(Database());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: HexColor("#FFFFFF"),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 180.h,
                  width: 390.w,
                  color: HexColor("#633DCF"),
                ),
                SizedBox(
                  height: 203.h,
                  width: 390.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 24.w, right: 24.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 42.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 62.w,
                              height: 12.h,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/3Dot.png"))),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FutureBuilder(
                                future: db.getUsn(),
                                builder: (context, snapshot) {
                                  return Text(
                                    "Halo, ${db.name?.capitalizeFirst!}!",
                                    style: GoogleFonts.sourceSans3(
                                      textStyle: TextStyle(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                        color: HexColor("#FFFFFF"),
                                      ),
                                    ),
                                  );
                                }),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 50.w,
                                height: 50.h,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/PP.png"))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        // Search Bar
                        Container(
                          width: 350.w,
                          height: 52.h,
                          decoration: BoxDecoration(
                            color: HexColor("#FFFFFF"),
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: HexColor("#D9D9D9"),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: HexColor("#000000").withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 16.w, right: 5.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 4.h),
                                          height: 24.h,
                                          width: 24.w,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/Search.png")),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          "Mau Antri Dimana?",
                                          style: TextStyle(
                                            fontSize: 16,
                                            decoration: TextDecoration.none,
                                            color: HexColor("#7C7C7C"),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 38.h,
                                      width: 38.w,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/Filter.png")),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // ----------- Antrianmu (Scrollable) -------------
            Expanded(
              child: StreamBuilder(
                  stream: db.infoAntrian(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('Tidak ada data layanan.');
                    } else {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 24.w, top: 30.h),
                                  child: Text(
                                    "Antrianmu",
                                    style: GoogleFonts.sourceSans3(
                                      textStyle: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.none,
                                        color: HexColor("#000000"),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Container(
                              height: 114.h,
                              width: 350.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: HexColor("#633DCF"),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 142.w,
                                    height: 114.h,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Nomor Antrian Saya",
                                          style: TextStyle(
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.w200,
                                              color: HexColor("#633DCF"),
                                              decoration: TextDecoration.none),
                                        ),
                                        Text(
                                          db.infoAntri[0]['nomorAntrian'],
                                          style: TextStyle(
                                              fontSize: 40.sp,
                                              fontWeight: FontWeight.w800,
                                              color: HexColor("#262626"),
                                              decoration: TextDecoration.none),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                        ),
                                        color: HexColor("#633DCF"),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 15.w, right: 8.w),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  db.infoAntri[0]['namaMitra'],
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          HexColor("#F5DD00"),
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 100.w,
                                                  height: 15.h,
                                                  child: Text(
                                                    "Nama Pengantri",
                                                    style: TextStyle(
                                                        fontSize: 8.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            HexColor("#FFFFFF"),
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 4.w,
                                                ),
                                                SizedBox(
                                                  width: 70.w,
                                                  height: 15.h,
                                                  child: Text(
                                                    "Sisa Antrian",
                                                    style: TextStyle(
                                                        fontSize: 8.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            HexColor("#FFFFFF"),
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 100.w,
                                                  height: 20.h,
                                                  child: Text(
                                                    db.infoAntri[0]
                                                        ['namaPengantri'],
                                                    style: TextStyle(
                                                        fontSize: 11.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            HexColor("#FFFFFF"),
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 4.w,
                                                ),
                                                SizedBox(
                                                  width: 70.w,
                                                  height: 20.h,
                                                  child: Text(
                                                    db.infoAntri[0]
                                                            ['sisaAntrian']
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 11.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            HexColor("#FFFFFF"),
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 100.w,
                                                      height: 15.h,
                                                      child: Text(
                                                        "Loket",
                                                        style: TextStyle(
                                                            fontSize: 8.sp,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: HexColor(
                                                                "#FFFFFF"),
                                                            decoration:
                                                                TextDecoration
                                                                    .none),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 100.w,
                                                      height: 15.h,
                                                      child: Text(
                                                        db.infoAntri[0]
                                                            ['loket'],
                                                        style: TextStyle(
                                                            fontSize: 11.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: HexColor(
                                                                "#FFFFFF"),
                                                            decoration:
                                                                TextDecoration
                                                                    .none),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 36.h,
                            ),
                            // ----------- KATEGORI -----------
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 24.w),
                                  child: Text(
                                    "Kategori",
                                    style: GoogleFonts.sourceSans3(
                                      textStyle: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.none,
                                        color: HexColor("#000000"),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 22.w, right: 22.w, bottom: 34.h),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => const KategoriPage(),
                                              arguments: "Bank");
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 100.h,
                                              width: 100.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: HexColor("#E7E7E7"),
                                                  width: 2.r,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      "assets/Bank.png"),
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 11.h,
                                            ),
                                            Text(
                                              "Bank",
                                              style: GoogleFonts.sourceSans3(
                                                textStyle: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: HexColor("#000000"),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => const KategoriPage(),
                                              arguments: "Kesehatan");
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 100.h,
                                              width: 100.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: HexColor("#E7E7E7"),
                                                  width: 2.r,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      "assets/Kesehatan.png"),
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 11.h,
                                            ),
                                            Text(
                                              "Kesehatan",
                                              style: GoogleFonts.sourceSans3(
                                                textStyle: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: HexColor("#000000"),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => const KategoriPage(),
                                              arguments: "Restoran");
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 100.h,
                                              width: 100.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: HexColor("#E7E7E7"),
                                                  width: 2.r,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      "assets/Restoran.png"),
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 11.h,
                                            ),
                                            Text(
                                              "Restoran",
                                              style: GoogleFonts.sourceSans3(
                                                textStyle: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: HexColor("#000000"),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 21.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => const KategoriPage(),
                                              arguments: "Hiburan");
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 100.h,
                                              width: 100.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: HexColor("#E7E7E7"),
                                                  width: 2.r,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      "assets/Hiburan.png"),
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 11.h,
                                            ),
                                            Text(
                                              "Hiburan",
                                              style: GoogleFonts.sourceSans3(
                                                textStyle: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: HexColor("#000000"),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => const KategoriPage(),
                                              arguments: "Service");
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 100.h,
                                              width: 100.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: HexColor("#E7E7E7"),
                                                  width: 2.r,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      "assets/Service.png"),
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 11.h,
                                            ),
                                            Text(
                                              "Service",
                                              style: GoogleFonts.sourceSans3(
                                                textStyle: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: HexColor("#000000"),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => const KategoriPage(),
                                              arguments: "Lainnya");
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 100.h,
                                              width: 100.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: HexColor("#E7E7E7"),
                                                  width: 2.r,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      "assets/Lainnya.png"),
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 11.h,
                                            ),
                                            Text(
                                              "Lainnya",
                                              style: GoogleFonts.sourceSans3(
                                                textStyle: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.normal,
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: HexColor("#000000"),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
            ),
            // Footer
            Container(
              height: 65.h,
              width: 390.w,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: HexColor("#633DCF").withOpacity(0.18),
                    width: 3.r,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 52.w, right: 52.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.offAll(() => const HomePage());
                      },
                      child: Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/Home.png"),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (db.infoAntri[0]['nomorAntrian'] == "") {
                          Get.snackbar(
                            "Warning",
                            "Silahkan Ambil Antrian Terlebih Dahulu",
                            icon: const Icon(Icons.dangerous_outlined),
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.red,
                            borderRadius: 20,
                            margin: const EdgeInsets.all(15),
                            colorText: Colors.white,
                            duration: const Duration(seconds: 2),
                            isDismissible: true,
                            forwardAnimationCurve: Curves.easeOutBack,
                          );
                        } else {
                          Get.to(() => const DapatNomor());
                        }
                      },
                      child: Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/Ticket.png"),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        database.signOut();
                      },
                      child: Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/Profile.png"),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
