import 'package:antrianku/DBController/controller.dart';
import 'package:antrianku/pengantri/homePage.dart';
import 'package:antrianku/pengantri/lihatAntrian.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class DapatNomor extends StatefulWidget {
  const DapatNomor({super.key});

  @override
  State<DapatNomor> createState() => _DapatNomorState();
}

class _DapatNomorState extends State<DapatNomor> {
  Database db = Database();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                return Column(
                  children: [
                    Container(
                      width: 390.w,
                      height: 60.h,
                      color: HexColor("#633DCF"),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20.w,
                          ),
                          InkWell(
                            onTap: () => Get.to(const HomePage()),
                            child: Container(
                              width: 20.w,
                              height: 20.h,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/Back.png"),
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            "Nomor Antrian",
                            style: GoogleFonts.sourceSans3(
                              textStyle: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none,
                                color: HexColor("#FFFFFF"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: 390.w,
                              height: 140.h,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color:
                                        HexColor("#633DCF").withOpacity(0.18),
                                    width: 1.r,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 20.w,
                                  left: 20.w,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      db.infoAntri[0]['namaLayanan'],
                                      style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#633DCF"),
                                      ),
                                    ),
                                    Text(
                                      db.infoAntri[0]['namaMitra'],
                                      style: GoogleFonts.sourceSans3(
                                        textStyle: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w700,
                                          decoration: TextDecoration.none,
                                          color: HexColor("#000000"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                      child: Text(
                                        db.infoAntri[0]['alamatMitra'],
                                        style: GoogleFonts.sourceSans3(
                                          textStyle: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                            color: HexColor("#000000"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 20.w,
                                left: 20.w,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Nama Lengkap",
                                    style: GoogleFonts.sourceSans3(
                                      textStyle: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none,
                                        color: HexColor("#000000"),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    db.infoAntri[0]['namaPengantri'],
                                    style: GoogleFonts.sourceSans3(
                                      textStyle: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none,
                                        color: HexColor("#000000"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Container(
                              height: 240.h,
                              width: 230.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: HexColor("#633DCF"),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Nomor Antrian Kamu",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("#FFFFFF"),
                                    ),
                                  ),
                                  Text(
                                    db.infoAntri[0]['nomorAntrian'],
                                    style: TextStyle(
                                      fontSize: 54.sp,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("#FFFFFF"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 90.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20.w, left: 20.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => const LihatAntrian());
                                    },
                                    child: Container(
                                      height: 45.h,
                                      width: 155.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(98.0),
                                        color: HexColor("#633DCF"),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "Lihat Antrian",
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor("#FFFFFF"),
                                        ),
                                      )),
                                    ),
                                  ),
                                  Container(
                                    height: 45.h,
                                    width: 155.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(98.0),
                                      color: HexColor("#474544"),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "Batalkan Tiket",
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#FFFFFF"),
                                      ),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                db.signOut();
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
                );
              }
            }),
      ),
    );
  }
}
