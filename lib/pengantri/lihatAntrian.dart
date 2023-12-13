import 'package:antrianku/DBController/controller.dart';
import 'package:antrianku/pengantri/dapatNomor.dart';
import 'package:antrianku/pengantri/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class LihatAntrian extends StatefulWidget {
  const LihatAntrian({super.key});

  @override
  State<LihatAntrian> createState() => _LihatAntrianState();
}

class _LihatAntrianState extends State<LihatAntrian> {
  Database db = Database();
  final Database database = Get.put(Database());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                            onTap: () {},
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
                            "Lihat Antrian",
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
                      height: 40.h,
                    ),
                    Container(
                      width: 390.w,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: HexColor("#633DCF").withOpacity(0.18),
                            width: 1.r,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 20.w,
                          left: 20.w,
                          bottom: 10.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              height: 40.h,
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
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              db.infoAntri[0]['namaLayanan'],
                              style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                                color: HexColor("#633DCF"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 20.w,
                          left: 20.w,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 150.w,
                                    child: Center(
                                      child: Text(
                                        "Memanggil",
                                        style: GoogleFonts.sourceSans3(
                                          textStyle: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700,
                                            decoration: TextDecoration.none,
                                            color: HexColor("#2DBDB5"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 150.w,
                                    child: Center(
                                      child: Text(
                                        "Batal",
                                        style: GoogleFonts.sourceSans3(
                                          textStyle: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700,
                                            decoration: TextDecoration.none,
                                            color: HexColor("#262626"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 150.w,
                                    child: Center(
                                      child: Text(
                                        db.infoAntri[0]['proses'],
                                        style: GoogleFonts.sourceSans3(
                                          textStyle: TextStyle(
                                            fontSize: 32.sp,
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.none,
                                            color: HexColor("#262626"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 150.w,
                                    child: Center(
                                      child: Text(
                                        "1",
                                        style: GoogleFonts.sourceSans3(
                                          textStyle: TextStyle(
                                            fontSize: 32.sp,
                                            fontWeight: FontWeight.w700,
                                            decoration: TextDecoration.none,
                                            color: HexColor("#262626"),
                                          ),
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
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                          Text(
                                            db.infoAntri[0]['nomorAntrian'],
                                            style: TextStyle(
                                                fontSize: 40.sp,
                                                fontWeight: FontWeight.w800,
                                                color: HexColor("#262626"),
                                                decoration:
                                                    TextDecoration.none),
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
                                                    db.infoAntri[0]
                                                        ['namaMitra'],
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            HexColor("#F5DD00"),
                                                        decoration:
                                                            TextDecoration
                                                                .none),
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
                                                          color: HexColor(
                                                              "#FFFFFF"),
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
                                                          color: HexColor(
                                                              "#FFFFFF"),
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
                                                          color: HexColor(
                                                              "#FFFFFF"),
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
                                                                  FontWeight
                                                                      .w700,
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
                                                                  FontWeight
                                                                      .bold,
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
                                height: 20.h,
                              ),
                              SizedBox(
                                width: 350.w,
                                child: TextFormField(
                                  minLines: 4,
                                  maxLines: null,
                                  readOnly: true,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: db.infoAntri[0]['catatan'],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              InkWell(
                                onTap: () {
                                  database.done();
                                },
                                child: Container(
                                  width: 350.w,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(90),
                                    color: HexColor("#633DCF"),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Saya sudah berada di tempat",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#FFFFFF"),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                            ],
                          ),
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
