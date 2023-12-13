import 'package:antrianku/DBController/controller.dart';
import 'package:antrianku/pengantri/dapatNomor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'homePage.dart';

class IsiData extends StatefulWidget {
  const IsiData({super.key});

  @override
  State<IsiData> createState() => _IsiDataState();
}

class _IsiDataState extends State<IsiData> {
  String namaMitra = Get.arguments['namaMitra'] ?? "";
  String kategori = Get.arguments['kategori'] ?? "";
  String namaLayanan = Get.arguments['namaLayanan'] ?? "";
  Database db = Database();
  final _formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController catatanController = TextEditingController();
  final Database database = Get.put(Database());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Builder(builder: (context) {
          return StreamBuilder(
              stream: db.getLihatLayanan(kategori, namaMitra, namaLayanan),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return FutureBuilder(
                      future: db.getInfoMitra(kategori, namaMitra),
                      builder: (context,
                          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return Form(
                            key: _formkey,
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
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(
                                          width: 20.w,
                                          height: 20.h,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image:
                                                  AssetImage("assets/Back.png"),
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Text(
                                        "Isi Data",
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
                                  height: 30.h,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 390.w,
                                          height: 140.h,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: HexColor("#633DCF")
                                                    .withOpacity(0.18),
                                                width: 1.r,
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              right: 20.w,
                                              left: 20.w,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  namaLayanan,
                                                  style: TextStyle(
                                                    fontSize: 30.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: HexColor("#633DCF"),
                                                  ),
                                                ),
                                                Text(
                                                  db.infoMitra[0]['nama'],
                                                  style:
                                                      GoogleFonts.sourceSans3(
                                                    textStyle: TextStyle(
                                                      fontSize: 24.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      decoration:
                                                          TextDecoration.none,
                                                      color:
                                                          HexColor("#000000"),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 50.h,
                                                  child: Text(
                                                    db.infoMitra[0]['alamat'],
                                                    style:
                                                        GoogleFonts.sourceSans3(
                                                      textStyle: TextStyle(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration.none,
                                                        color:
                                                            HexColor("#000000"),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: 20.w,
                                            left: 20.w,
                                          ),
                                          child: SizedBox(
                                            width: 390.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Nama Lengkap",
                                                  style:
                                                      GoogleFonts.sourceSans3(
                                                    textStyle: TextStyle(
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      decoration:
                                                          TextDecoration.none,
                                                      color:
                                                          HexColor("#000000"),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 70.h,
                                                  width: 332.w,
                                                  child: TextFormField(
                                                    controller: nameController,
                                                    decoration:
                                                        const InputDecoration(
                                                      helperText:
                                                          'Isi Nama Lengkap Sesuai KTP',
                                                    ),
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Username cannot be empty";
                                                      }
                                                      if (!RegExp(
                                                              "^[a-zA-Z0-9+_.-]")
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
                                                  height: 30.h,
                                                ),
                                                Text(
                                                  "Catatan",
                                                  style:
                                                      GoogleFonts.sourceSans3(
                                                    textStyle: TextStyle(
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      decoration:
                                                          TextDecoration.none,
                                                      color:
                                                          HexColor("#000000"),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                SizedBox(
                                                  width: 332.w,
                                                  child: TextFormField(
                                                    controller:
                                                        catatanController,
                                                    minLines: 4,
                                                    maxLines: null,
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      hintText:
                                                          'Silahkan isi catatan jika diperlukan',
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 50.h,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    if (_formkey.currentState!
                                                        .validate()) {
                                                      database.ambilAntrian(
                                                          kategori,
                                                          namaMitra,
                                                          namaLayanan,
                                                          nameController.text,
                                                          catatanController
                                                              .text);
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 50.h,
                                                    width: 340.w,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          HexColor("#633DCF"),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              98),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Dapatkan Nomor Antrian",
                                                        style: TextStyle(
                                                          fontSize: 17.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: HexColor(
                                                              "#FFFFFF"),
                                                        ),
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
                                ),
                                // Footer
                                Container(
                                  height: 65.h,
                                  width: 390.w,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: HexColor("#633DCF")
                                            .withOpacity(0.18),
                                        width: 3.r,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 52.w, right: 52.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                                image: AssetImage(
                                                    "assets/Home.png"),
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (db.infoAntri[0]
                                                    ['nomorAntrian'] ==
                                                "") {
                                              Get.snackbar(
                                                "Warning",
                                                "Silahkan Ambil Antrian Terlebih Dahulu",
                                                icon: const Icon(
                                                    Icons.dangerous_outlined),
                                                snackPosition:
                                                    SnackPosition.TOP,
                                                backgroundColor: Colors.red,
                                                borderRadius: 20,
                                                margin:
                                                    const EdgeInsets.all(15),
                                                colorText: Colors.white,
                                                duration:
                                                    const Duration(seconds: 2),
                                                isDismissible: true,
                                                forwardAnimationCurve:
                                                    Curves.easeOutBack,
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
                                                image: AssetImage(
                                                    "assets/Ticket.png"),
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
                                                image: AssetImage(
                                                    "assets/Profile.png"),
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
                          );
                        }
                      });
                }
              });
        }),
      ),
    );
  }
}
