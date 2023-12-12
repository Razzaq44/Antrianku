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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      "Bank Mandiri Dayeuhkolot",
                      style: GoogleFonts.sourceSans3(
                        textStyle: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none,
                          color: HexColor("#000000"),
                        ),
                      ),
                    ),
                    Text(
                      "Jl. Raya Bojongsoang, Kabupaten Bandung, Jawa Barat",
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
                      height: 10.h,
                    ),
                    Text(
                      "Teller",
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 150.w,
                          child: Center(
                            child: Text(
                              "A27",
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 142.w,
                            height: 114.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                  "A208",
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
                                padding:
                                    EdgeInsets.only(left: 15.w, right: 8.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Bank Mandiri",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                              color: HexColor("#F5DD00"),
                                              decoration: TextDecoration.none),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 100.w,
                                          height: 15.h,
                                          child: Text(
                                            "Nama Pengantri",
                                            style: TextStyle(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w700,
                                                color: HexColor("#FFFFFF"),
                                                decoration:
                                                    TextDecoration.none),
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
                                                fontWeight: FontWeight.w700,
                                                color: HexColor("#FFFFFF"),
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 100.w,
                                          height: 20.h,
                                          child: Text(
                                            "Maria Agustina",
                                            style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.bold,
                                                color: HexColor("#FFFFFF"),
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        SizedBox(
                                          width: 70.w,
                                          height: 20.h,
                                          child: Text(
                                            "10",
                                            style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.bold,
                                                color: HexColor("#FFFFFF"),
                                                decoration:
                                                    TextDecoration.none),
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
                                                    fontWeight: FontWeight.w700,
                                                    color: HexColor("#FFFFFF"),
                                                    decoration:
                                                        TextDecoration.none),
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
                                                "A1",
                                                style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: HexColor("#FFFFFF"),
                                                    decoration:
                                                        TextDecoration.none),
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
                          hintText: 'Catatan',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    InkWell(
                      onTap: () => Get.to(const HomePage()),
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
