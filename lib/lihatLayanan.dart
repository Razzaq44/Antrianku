import 'package:antrianku/homePage.dart';
import 'package:antrianku/isiData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class LihatLayanan extends StatefulWidget {
  const LihatLayanan({super.key});

  @override
  State<LihatLayanan> createState() => _LihatLayananState();
}

class _LihatLayananState extends State<LihatLayanan> {
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
                    "Lihat Layanan",
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
              height: 210.h,
              width: 390.w,
              color: HexColor("#F1F1F1"),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    width: 350.w,
                    height: 135.h,
                    decoration: BoxDecoration(
                      color: HexColor("#633DCF"),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: 25.w, left: 25.w, top: 25.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 220.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 43.h,
                                  child: Text(
                                    "Teller",
                                    style: TextStyle(
                                      fontSize: 27.sp,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.none,
                                      color: HexColor("#FFFFFF"),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  "Bank Mandiri Dayeuhkolot",
                                  style: GoogleFonts.sourceSans3(
                                    textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                      color: HexColor("#FFFFFF"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                width: 43.w,
                                height: 43.h,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/Star.png"),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              Text(
                                "4.9",
                                style: GoogleFonts.sourceSans3(
                                  textStyle: TextStyle(
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                    color: HexColor("#FFFFFF"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 200.h,
                          width: 195.w,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: HexColor("#E4E3E3"),
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: 40.w,
                              left: 40.w,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sedang Menunggu",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.sourceSans3(
                                    textStyle: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.none,
                                      color: HexColor("#000000"),
                                    ),
                                  ),
                                ),
                                Text(
                                  "20",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.sourceSans3(
                                    textStyle: TextStyle(
                                      fontSize: 54.sp,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none,
                                      color: HexColor("#633DCF"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 200.h,
                          width: 195.w,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: HexColor("#E4E3E3"),
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: 40.w,
                              left: 40.w,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sedang Dilayani",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.sourceSans3(
                                    textStyle: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.none,
                                      color: HexColor("#000000"),
                                    ),
                                  ),
                                ),
                                Text(
                                  "A15",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.sourceSans3(
                                    textStyle: TextStyle(
                                      fontSize: 54.sp,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none,
                                      color: HexColor("#633DCF"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: HexColor("#E4E3E3"),
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25.w, left: 25.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Jumlah yang daftar",
                                  style: GoogleFonts.sourceSans3(
                                    textStyle: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.none,
                                      color: HexColor("#000000"),
                                    ),
                                  ),
                                ),
                                Text(
                                  "20",
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                    color: HexColor("#000000"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25.w, left: 25.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Loket Tersedia",
                                  style: GoogleFonts.sourceSans3(
                                    textStyle: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.none,
                                      color: HexColor("#000000"),
                                    ),
                                  ),
                                ),
                                Text(
                                  "3",
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                    color: HexColor("#000000"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25.w, left: 25.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Batal",
                                  style: GoogleFonts.sourceSans3(
                                    textStyle: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.none,
                                      color: HexColor("#000000"),
                                    ),
                                  ),
                                ),
                                Text(
                                  "0",
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                    color: HexColor("#000000"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          InkWell(
                            onTap: () => Get.to(const IsiData()),
                            child: Container(
                              height: 50.h,
                              width: 180.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(98),
                                color: HexColor("#633DCF"),
                              ),
                              child: Center(
                                child: Text(
                                  "Daftar",
                                  style: TextStyle(
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                    color: HexColor("#FFFFFF"),
                                  ),
                                ),
                              ),
                            ),
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
                      onTap: () => Get.to(const HomePage()),
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
                      onTap: () {},
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
                      onTap: () {},
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
