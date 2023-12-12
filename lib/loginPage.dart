import 'package:antrianku/mitra/homePageMitra.dart';
import 'package:antrianku/pengantri/homePage.dart';
import 'package:antrianku/registerPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
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
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.h,
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
                            height: 385.h,
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
                                  "Login",
                                  style: TextStyle(
                                      color: HexColor("#000000"),
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 53.h,
                                        width: 294.w,
                                        child: TextFormField(
                                          controller: emailController,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            labelText: 'Email',
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Email cannot be empty";
                                            }
                                            if (!RegExp(
                                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                                .hasMatch(value)) {
                                              return ("Please enter a valid email");
                                            } else {
                                              return null;
                                            }
                                          },
                                          onSaved: (value) {
                                            emailController.text = value!;
                                          },
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 34.h,
                                      ),
                                      SizedBox(
                                        height: 53.h,
                                        width: 294.w,
                                        child: TextFormField(
                                          controller: passwordController,
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
                                          validator: (value) {
                                            RegExp regex = RegExp(r'^.{6,}$');
                                            if (value!.isEmpty) {
                                              return "Password cannot be empty";
                                            }
                                            if (!regex.hasMatch(value)) {
                                              return ("please enter valid password min. 6 character");
                                            } else {
                                              return null;
                                            }
                                          },
                                          onSaved: (value) {
                                            passwordController.text = value!;
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 54.h,
                                      ),
                                      SizedBox(
                                        height: 53.h,
                                        width: 135.w,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            signIn(emailController.text,
                                                passwordController.text);
                                          },
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
                                            "Masuk",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Belum punya akun?",
                                style: TextStyle(
                                  fontSize: 19.sp,
                                  color: HexColor("#262626"),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => const RegisterPage());
                                },
                                child: Text(
                                  "Daftar",
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
          ),
        ));
  }

  signIn(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      route();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        e.code,
        icon: const Icon(Icons.dangerous_outlined),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('akun')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "mitra") {
          Get.to(() => const HomePageMitra());
        } else {
          Get.offAll(() => const HomePage());
        }
      } else {
        Get.snackbar(
          "Error",
          "Doument does not exist",
          icon: const Icon(Icons.dangerous_outlined),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          borderRadius: 20,
          margin: const EdgeInsets.all(15),
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }
    });
  }
}
