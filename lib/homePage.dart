// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                          Text(
                            "Halo, Melvin!",
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                color: HexColor("#FFFFFF")),
                          ),
                          Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/PP.png"))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        width: 350.w,
                        height: 52.h,
                        decoration: BoxDecoration(
                          color: HexColor("#FFFFFF"),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: HexColor("#D9D9D9"),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 16.w, right: 5.w),
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
                                          image:
                                              AssetImage("assets/Filter.png")),
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
          SizedBox(
            height: 30.h,
          ),
          // ----------- Antrianmu (Scrollable) -------------
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: Text(
                          "Antrianmu",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                              color: HexColor("#000000")),
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
                              padding: EdgeInsets.only(left: 15.w, right: 8.w),
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
                                              decoration: TextDecoration.none),
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
                                              decoration: TextDecoration.none),
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
                                              decoration: TextDecoration.none),
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
                                              decoration: TextDecoration.none),
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
                    height: 36.h,
                  ),
                  // ----------- KATEGORI -----------
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: Text(
                          "Kategori",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                              color: HexColor("#000000")),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 22.w, right: 22.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 100.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: HexColor("#E7E7E7"),
                                      width: 2.r,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: const DecorationImage(
                                      image: AssetImage("assets/Bank.png"),
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 11.h,
                                ),
                                Text(
                                  "Bank",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                      color: HexColor("#000000")),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 100.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: HexColor("#E7E7E7"),
                                      width: 2.r,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: const DecorationImage(
                                      image: AssetImage("assets/Kesehatan.png"),
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 11.h,
                                ),
                                Text(
                                  "Kesehatan",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                      color: HexColor("#000000")),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 100.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: HexColor("#E7E7E7"),
                                      width: 2.r,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: const DecorationImage(
                                      image: AssetImage("assets/Restoran.png"),
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 11.h,
                                ),
                                Text(
                                  "Restoran",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                      color: HexColor("#000000")),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 21.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 100.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: HexColor("#E7E7E7"),
                                        width: 2.r,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: const DecorationImage(
                                        image: AssetImage("assets/Hiburan.png"),
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 11.h,
                                ),
                                Text(
                                  "Hiburan",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                      color: HexColor("#000000")),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 100.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: HexColor("#E7E7E7"),
                                      width: 2.r,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: const DecorationImage(
                                      image: AssetImage("assets/Service.png"),
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 11.h,
                                ),
                                Text(
                                  "Service",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                      color: HexColor("#000000")),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 100.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: HexColor("#E7E7E7"),
                                      width: 2.r,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: const DecorationImage(
                                      image: AssetImage("assets/Lainnya.png"),
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 11.h,
                                ),
                                Text(
                                  "Lainnya",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                      color: HexColor("#000000")),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 34.h,
          ),
          Container(
            height: 65.h,
            width: 390.w,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: HexColor("#E7E7E7"),
                  width: 3.r,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 52.w, right: 52.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Home.png"),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Ticket.png"),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Profile.png"),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}