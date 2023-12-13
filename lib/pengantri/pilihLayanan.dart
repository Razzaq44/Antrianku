import 'package:antrianku/DBController/controller.dart';
import 'package:antrianku/pengantri/dapatNomor.dart';
import 'package:antrianku/pengantri/homePage.dart';
import 'package:antrianku/pengantri/lihatLayanan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class PilihLayanan extends StatefulWidget {
  const PilihLayanan({super.key});

  @override
  State<PilihLayanan> createState() => _PilihLayananState();
}

class _PilihLayananState extends State<PilihLayanan> {
  String namaMitra = Get.arguments['namaMitra'] ?? "";
  String kategori = Get.arguments['kategori'] ?? "";
  Database db = Database();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: db.getInfoMitra(kategori, namaMitra),
          builder:
              (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
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
                          "Daftar Layanan",
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
                    height: 15.w,
                  ),
                  Center(
                    child: Container(
                      width: 300.w,
                      height: 115.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(db.infoMitra[0]['assets']),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 15.h,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: HexColor("#717171"),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 390.w,
                    height: 160.h,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50.h,
                            child: Text(
                              db.infoMitra[0]['nama'],
                              style: GoogleFonts.sourceSans3(
                                textStyle: TextStyle(
                                  fontSize: 27.sp,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none,
                                  color: HexColor("#000000"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                            child: Text(
                              db.infoMitra[0]['alamat'],
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
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 16.w,
                                height: 16.h,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/Telp.png"),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.h,
                              ),
                              Text(
                                db.infoMitra[0]['telp'],
                                style: GoogleFonts.sourceSans3(
                                  textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                    color: HexColor("#000000"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.h,
                              ),
                              Container(
                                width: 16.w,
                                height: 16.h,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/Jam.png"),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.h,
                              ),
                              Text(
                                db.infoMitra[0]['jam'],
                                style: GoogleFonts.sourceSans3(
                                  textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                    color: HexColor("#000000"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 390.w,
                    height: 56.h,
                    color: HexColor("#F7F7F7"),
                    child: Row(
                      children: [
                        Container(
                          width: 55.w,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: HexColor("#AFAFAF"),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 22.w,
                                height: 22.h,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/Star.png"),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                              Text(
                                "4.9",
                                style: GoogleFonts.sourceSans3(
                                  textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.none,
                                    color: HexColor("#000000"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 110.w,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: HexColor("#AFAFAF"),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 22.w,
                                    height: 22.h,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage("assets/Location.png"),
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    db.infoMitra[0]['jarak'],
                                    style: GoogleFonts.sourceSans3(
                                      textStyle: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                        color: HexColor("#000000"),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "Jarak",
                                style: GoogleFonts.sourceSans3(
                                  textStyle: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                    color: HexColor("#000000"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 103.w,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: HexColor("#AFAFAF"),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 22.w,
                                    height: 22.h,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/Person.png"),
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "23rb",
                                    style: GoogleFonts.sourceSans3(
                                      textStyle: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none,
                                        color: HexColor("#000000"),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "Pengunjung",
                                style: GoogleFonts.sourceSans3(
                                  textStyle: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                    color: HexColor("#000000"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: HexColor("#AFAFAF"),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 22.w,
                                      height: 22.h,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image:
                                              AssetImage("assets/Quality.png"),
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "+390",
                                      style: GoogleFonts.sourceSans3(
                                        textStyle: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none,
                                          color: HexColor("#000000"),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  "Pengantri Puas",
                                  style: GoogleFonts.sourceSans3(
                                    textStyle: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none,
                                      color: HexColor("#000000"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.w, left: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pilih Pelayanan",
                                style: GoogleFonts.sourceSans3(
                                  textStyle: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.none,
                                    color: HexColor("#000000"),
                                  ),
                                ),
                              ),
                              Container(
                                width: 20.w,
                                height: 20.h,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/Refresh.png"))),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        // List Layanan
                        Expanded(
                          child: StreamBuilder(
                              stream: db.getListLayanan(kategori, namaMitra),
                              builder: (context, snapshot) {
                                return ListView.builder(
                                    itemCount: db.listLayanan.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.to(() => const LihatLayanan(),
                                                  arguments: {
                                                    'kategori': kategori,
                                                    'namaMitra': namaMitra,
                                                    'namaLayanan':
                                                        db.listLayanan[index]
                                                            ['nama'],
                                                  });
                                            },
                                            child: Container(
                                              height: 114.h,
                                              width: 350.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: HexColor("#633DCF"),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 142.w,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          db.listLayanan[index]
                                                              ['nama'],
                                                          style: TextStyle(
                                                            fontSize: 30.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: HexColor(
                                                                "#633DCF"),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 15.h,
                                                        ),
                                                        Container(
                                                          height: 30.h,
                                                          width: 90.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: HexColor(
                                                                "#633DCF"),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              db.listLayanan[
                                                                      index][
                                                                  'jamLayanan'],
                                                              style: GoogleFonts
                                                                  .sourceSans3(
                                                                textStyle:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  color: HexColor(
                                                                      "#FFFFFF"),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      color:
                                                          HexColor("#633DCF"),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15.w),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height: 10.h,
                                                            ),
                                                            Text(
                                                              db.infoMitra[0]
                                                                  ['nama'],
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      "#F5DD00"),
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              height: 10.h,
                                                            ),
                                                            Text(
                                                              "Sisa Antrian",
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      "#FFFFFF"),
                                                                  fontSize:
                                                                      8.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                            Text(
                                                              db.listLayanan[
                                                                      index][
                                                                      'sisaAntrian']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      "#FFFFFF"),
                                                                  fontSize:
                                                                      10.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              height: 8.h,
                                                            ),
                                                            Text(
                                                              "Loket",
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      "#FFFFFF"),
                                                                  fontSize:
                                                                      8.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                            Text(
                                                              db.listLayanan[
                                                                      index]
                                                                  ['loket'],
                                                              style: TextStyle(
                                                                  color: HexColor(
                                                                      "#FFFFFF"),
                                                                  fontSize:
                                                                      10.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30.h,
                                          ),
                                        ],
                                      );
                                    });
                              }),
                        ),
                      ],
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
          },
        ),
      ),
    );
  }
}
