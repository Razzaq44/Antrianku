import 'package:antrianku/loginPage.dart';
import 'package:antrianku/mitra/homePageMitra.dart';
import 'package:antrianku/pengantri/homePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 53.h,
                                        width: 294.w,
                                        child: TextFormField(
                                          controller: userNameController,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            labelText: 'Full Name',
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Username cannot be empty";
                                            }
                                            if (!RegExp("^[a-zA-Z0-9+_.-]")
                                                .hasMatch(value)) {
                                              return ("Please enter a valid username");
                                            } else {
                                              return null;
                                            }
                                          },
                                          onChanged: (value) {},
                                        ),
                                      ),
                                      SizedBox(
                                        height: 34.h,
                                      ),
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
                                          onChanged: (value) {},
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
                                          obscureText: _isObscure3,
                                          controller: passwordController,
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
                                          onChanged: (value) {},
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                      SizedBox(
                                        height: 53.h,
                                        width: 135.w,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            signUp(
                                                emailController.text,
                                                passwordController.text,
                                                userNameController.text);
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
          ),
        ));
  }

  void signUp(String email, String password, String username) async {
    if (_formkey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) =>
                {postDetailsToFirestore(email, "pengantri", username)});
        signIn(email, password);
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
  }

  postDetailsToFirestore(String email, String role, String userName) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = db.collection('akun');
    ref.doc(user!.uid).set({
      'email': email,
      'role': role,
      'username': userName,
      'loket': "",
      'namaMitra': "",
      'namaPengantri': "",
      'sisaAntrian': 0,
      'catatan': "",
      'nomorAntrian': "",
      'namaLayanan': "",
      'alamatMitra': "",
      'kategori': "",
      'proses': "",
    });
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
          Get.to(const HomePageMitra());
        } else {
          Get.offAll(const HomePage());
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
