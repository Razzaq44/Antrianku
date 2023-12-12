import 'package:antrianku/pengantri/homePage.dart';
import 'package:antrianku/pengantri/pilihLayanan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class BankPage extends StatefulWidget {
  const BankPage({super.key});

  @override
  State<BankPage> createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
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
                    "Bank",
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
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => Get.to(const PilihLayanan()),
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
                                  width: 120.w,
                                  child: Text(
                                    "Bank Mandiri Dayeuhkolot",
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
                                          image:
                                              AssetImage("assets/Location.png"),
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "2 km dari",
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
                                          image: AssetImage("assets/Jam.png"),
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "08.00 - 15.00",
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
                                image: const DecorationImage(
                                  image: AssetImage("assets/Mandiri.png"),
                                  fit: BoxFit.scaleDown,
                                ),
                                border: Border.all(
                                  color: HexColor("#E7E7E7"),
                                  width: 2.r,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
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
