import 'package:antrianku/DBController/controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePageMitra extends StatefulWidget {
  const HomePageMitra({super.key});

  @override
  State<HomePageMitra> createState() => _HomePageMitraState();
}

class _HomePageMitraState extends State<HomePageMitra> {
  @override
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Database db = Database();
  final Database database = Get.put(Database());
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
                  Text(
                    "Pemanggilan",
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
            Container(
                height: 220.h,
                padding: EdgeInsets.only(
                    top: 50.h, right: 15.w, left: 15.w, bottom: 50.h),
                color: HexColor("#F1F1F1"),
                child: FutureBuilder(
                    future: db.getUsnMitra(),
                    builder: (context, snapshot) {
                      return StreamBuilder(
                          stream: db.getListAntrianMitra(db.namaMitra),
                          builder: (context, snapshot) {
                            if (db.listAntrianMitra.isNotEmpty) {
                              return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 20.w,
                                  );
                                },
                                itemCount: db.listAntrianMitra.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 150.w,
                                    decoration: BoxDecoration(
                                        color: HexColor("#FFFFFF"),
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                db.listAntrianMitra[index]
                                                    ['namaPengantri'],
                                                style: TextStyle(
                                                    fontSize: 11.sp,
                                                    color: HexColor("#000000"),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Expanded(child: Container()),
                                              Text(
                                                db.listAntrianMitra[index]
                                                    ['loket'],
                                                style: TextStyle(
                                                    fontSize: 11.sp,
                                                    color: HexColor("#000000"),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Expanded(child: Container()),
                                          InkWell(
                                            onTap: () {
                                              database.accept(
                                                  db.listAntrianMitra[index]
                                                      ['namaMitra'],
                                                  db.listAntrianMitra[index]
                                                      ['nomorAntrian']);
                                            },
                                            child: Container(
                                              height: 25.h,
                                              width: 150.w,
                                              decoration: BoxDecoration(
                                                  color: HexColor("#82F15B"),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          98.0)),
                                              child: Center(
                                                  child: Text("Accept",
                                                      style: TextStyle(
                                                          fontSize: 10.sp,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              database.decline(
                                                  db.listAntrianMitra[index]
                                                      ['namaMitra'],
                                                  db.listAntrianMitra[index]
                                                      ['nomorAntrian']);
                                            },
                                            child: Container(
                                              height: 25.h,
                                              width: 150.w,
                                              decoration: BoxDecoration(
                                                  color: HexColor("#E95E32"),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          98.0)),
                                              child: Center(
                                                  child: Text(
                                                "Decline",
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Center(
                                child: Text(
                                  "There is no queue",
                                  style: TextStyle(fontSize: 15.sp),
                                ),
                              );
                            }
                          });
                    })),
            Expanded(
                child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Antrian Berlangsung",
                          style: GoogleFonts.sourceSans3(
                            textStyle: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                              color: HexColor("#000000"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: FutureBuilder(
                            future: db.getUsnMitra(),
                            builder: (context, index) {
                              return StreamBuilder(
                                  stream: db.getListAntrianMitraAccepted(
                                      db.namaMitra),
                                  builder: (context, index) {
                                    return ListView.separated(
                                        itemBuilder: (context, index) {
                                          if (db.listAntrianMitraAccepted
                                              .isNotEmpty) {
                                            return Container(
                                              height: 115.h,
                                              width: 350.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: HexColor("#633DCF"),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 142.w,
                                                    height: 114.h,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Nomor Antrian Saya",
                                                          style: TextStyle(
                                                              fontSize: 9.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w200,
                                                              color: HexColor(
                                                                  "#633DCF"),
                                                              decoration:
                                                                  TextDecoration
                                                                      .none),
                                                        ),
                                                        Text(
                                                          db.listAntrianMitraAccepted[
                                                                  index]
                                                              ['nomorAntrian'],
                                                          style: TextStyle(
                                                              fontSize: 40.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              color: HexColor(
                                                                  "#262626"),
                                                              decoration:
                                                                  TextDecoration
                                                                      .none),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                        color:
                                                            HexColor("#633DCF"),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15.w,
                                                                right: 8.w),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  db.listAntrianMitraAccepted[
                                                                          index]
                                                                      [
                                                                      'namaMitra'],
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: HexColor(
                                                                          "#F5DD00"),
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
                                                                        fontSize: 8
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        color: HexColor(
                                                                            "#FFFFFF"),
                                                                        decoration:
                                                                            TextDecoration.none),
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
                                                                    db.listAntrianMitraAccepted[
                                                                            index]
                                                                        [
                                                                        'namaPengantri'],
                                                                    style: TextStyle(
                                                                        fontSize: 11
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: HexColor(
                                                                            "#FFFFFF"),
                                                                        decoration:
                                                                            TextDecoration.none),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              100.w,
                                                                          height:
                                                                              15.h,
                                                                          child:
                                                                              Text(
                                                                            "Loket",
                                                                            style: TextStyle(
                                                                                fontSize: 8.sp,
                                                                                fontWeight: FontWeight.w700,
                                                                                color: HexColor("#FFFFFF"),
                                                                                decoration: TextDecoration.none),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              100.w,
                                                                          height:
                                                                              15.h,
                                                                          child:
                                                                              Text(
                                                                            db.listAntrianMitraAccepted[index]['loket'],
                                                                            style: TextStyle(
                                                                                fontSize: 11.sp,
                                                                                fontWeight: FontWeight.bold,
                                                                                color: HexColor("#FFFFFF"),
                                                                                decoration: TextDecoration.none),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    database.queueDone(
                                                                        db.listAntrianMitraAccepted[index]
                                                                            [
                                                                            'namaMitra'],
                                                                        db.listAntrianMitraAccepted[index]
                                                                            [
                                                                            'nomorAntrian']);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        24.h,
                                                                    width: 80.w,
                                                                    decoration: BoxDecoration(
                                                                        color: HexColor(
                                                                            "#FFFFFF"),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0)),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        "Selesai",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13.sp,
                                                                            fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ),
                                                                  ),
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
                                            );
                                          } else {
                                            const Center(
                                              child: Text("There's no queue"),
                                            );
                                          }
                                        },
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            height: 20.h,
                                          );
                                        },
                                        itemCount:
                                            db.listAntrianMitraAccepted.length);
                                  });
                            }),
                      ),
                    )
                  ],
                ),
              ),
            )),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.offAll(() => const HomePageMitra());
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
      ),
    );
  }
}
