import 'package:antrianku/DBController/controller.dart';
import 'package:antrianku/pengantri/dapatNomor.dart';
import 'package:antrianku/pengantri/homePage.dart';
import 'package:antrianku/pengantri/pilihLayanan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class KategoriPage extends StatefulWidget {
  const KategoriPage({super.key});

  @override
  State<KategoriPage> createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  String kategori = Get.arguments ?? "";
  Database db = Database();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                    onTap: () {
                      Get.back();
                    },
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
                    kategori,
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
            Expanded(
              child: FutureBuilder(
                future: db.getListMitra(kategori),
                builder: (context, snapshot) {
                  return ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: db.menu.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => const PilihLayanan(), arguments: {
                            'namaMitra': db.menu[index]["nama"],
                            'kategori': kategori,
                          });
                        },
                        child: SizedBox(
                          height: 150.h,
                          child: Padding(
                            padding: EdgeInsets.only(right: 35.w, left: 35.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    SizedBox(
                                      height: 60.h,
                                      width: 150.w,
                                      child: Text(
                                        "${db.menu[index]["nama"]}",
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
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10.w,
                                          height: 10.h,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/Location.png"),
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "${db.menu[index]["jarak"]} dari",
                                          style: GoogleFonts.sourceSans3(
                                            textStyle: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.normal,
                                              decoration: TextDecoration.none,
                                              color: HexColor("#000000"),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Lokasi Anda Saat Ini",
                                          style: GoogleFonts.sourceSans3(
                                            textStyle: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.none,
                                              color: HexColor("#000000"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10.w,
                                          height: 10.h,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image:
                                                  AssetImage("assets/Jam.png"),
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "${db.menu[index]["jam"]}",
                                          style: GoogleFonts.sourceSans3(
                                            textStyle: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.normal,
                                              decoration: TextDecoration.none,
                                              color: HexColor("#000000"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  width: 100.w,
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: HexColor("#E7E7E7"),
                                      width: 2.r,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 80.w,
                                      height: 80.h,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              db.menu[index]["assets"]),
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  );
                },
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
        ),
      ),
    );
  }
}
