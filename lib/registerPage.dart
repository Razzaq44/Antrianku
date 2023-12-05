import 'package:antrianku/homePage.dart';
import 'package:antrianku/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isObscure3 = true;
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                    height: 71.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 330.w,
                    height: 713.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/RegisterPage.png")),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Container(
                          width: 342.w,
                          height: 422.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor("#FFFFFF"),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25.h,
                              ),
                              Text(
                                "Daftar",
                                style: TextStyle(
                                    color: HexColor("#000000"),
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 53.h,
                                      width: 294.w,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          labelText: 'Full Name',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 34.h,
                                    ),
                                    SizedBox(
                                      height: 53.h,
                                      width: 294.w,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          labelText: 'Email',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 34.h,
                                    ),
                                    SizedBox(
                                      height: 53.h,
                                      width: 294.w,
                                      child: TextFormField(
                                        obscureText: _isObscure3,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          suffixIcon: IconButton(
                                              icon: Icon(_isObscure3
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                              onPressed: () {
                                                setState(() {
                                                  _isObscure3 = !_isObscure3;
                                                });
                                              }),
                                          enabled: true,
                                          labelText: 'Password',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    SizedBox(
                                      height: 53.h,
                                      width: 135.w,
                                      child: ElevatedButton(
                                        onPressed: () =>
                                            Get.to(const HomePage()),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                HexColor("#633DCF"),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            side: BorderSide(
                                                color: HexColor("#FFFFFF"))),
                                        child: Text(
                                          "Buat Akun",
                                          style: TextStyle(
                                              color: HexColor("#FFFFFF"),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sudah punya akun?",
                              style: TextStyle(
                                fontSize: 19.sp,
                                color: HexColor("#262626"),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Get.to(const LoginPage()),
                              child: Text(
                                "Masuk",
                                style: TextStyle(
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor("#262626"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
