// ignore_for_file: file_names

import 'package:antrianku/loginPage.dart';
import 'package:antrianku/registerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [HexColor("#8E6CEF"), HexColor("#FFFFFF")],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.w),
          child: Column(
            children: [
              SizedBox(
                height: 92.h,
              ),
              Container(
                alignment: Alignment.center,
                width: 322.w,
                height: 426.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/WelcomePage.png"))),
              ),
              SizedBox(
                height: 30.w,
              ),
              Container(
                width: 342.w,
                height: 242.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: HexColor("#000000").withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(29.w, 0, 29.w, 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Antre Mudah, Layanan Cepat",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("#262626")),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: "dengan ",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor("#262626")),
                                      children: [
                                        TextSpan(
                                          text: "Antrianku",
                                          style: TextStyle(
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.bold,
                                            color: HexColor("#633DCF"),
                                          ),
                                        )
                                      ]),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 125.w,
                                  height: 53.h,
                                  child: ElevatedButton(
                                    onPressed: () => Get.to(const LoginPage()),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: HexColor("#633DCF"),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0))),
                                    child: Text(
                                      "Masuk",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 14.w,
                                ),
                                SizedBox(
                                  width: 125.w,
                                  height: 53.h,
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        Get.to(const RegisterPage()),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: HexColor("#FFFFFF"),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        side: BorderSide(
                                            color: HexColor("#633DCF"))),
                                    child: Text(
                                      "Daftar",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: HexColor("#633DCF"),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
