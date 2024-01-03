import 'package:antrianku/pengantri/dapatNomor.dart';
import 'package:antrianku/pengantri/homePage.dart';
import 'package:antrianku/welcomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Database extends GetxController {
  String? name;
  String? namaMitra;
  String? role;
  var menu = [];
  var infoMitra = [];
  var listLayanan = [];
  var detailLayanan = [];
  var infoAntri = [];
  var listAntrianMitra = [];
  var listAntrianMitraAccepted = [];
  final _auth = FirebaseAuth.instance;

  Future<void> getUsn() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('akun')
        .doc(user?.uid)
        .get();
    name = userDoc.get('username');
    role = userDoc.get('role');
  }

  Future<void> getUsnMitra() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('akun')
        .doc(user?.uid)
        .get();
    namaMitra = userDoc.get('namaMitra');
  }

  Future<void> getListMitra(String category) async {
    List<Map<String, dynamic>> newDataList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('kategori')
        .doc(category)
        .collection('Mitra')
        .get();
    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      newDataList.add({
        'nama': data['nama'],
        'jam': data['jam'],
        'assets': data['assets'],
        'jarak': data['jarak'],
        'alamat': data['alamat'],
        'telp': data['telp'],
      });
    });
    menu = newDataList;
  }

  Future<List<Map<String, dynamic>>> getInfoMitra(
      String kategori, String namaBank) async {
    List<Map<String, dynamic>> newDataList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('kategori')
        .doc(kategori)
        .collection('Mitra')
        .where('nama', isEqualTo: namaBank)
        .get();
    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      newDataList.add({
        'nama': data['nama'],
        'jam': data['jam'],
        'assets': data['assets'],
        'jarak': data['jarak'],
        'alamat': data['alamat'],
        'telp': data['telp'],
      });
    });
    return infoMitra = newDataList;
  }

  Stream<void> getListLayanan(String kategori, String namaBank) {
    return FirebaseFirestore.instance
        .collection('kategori')
        .doc(kategori)
        .collection('Mitra')
        .doc(namaBank)
        .collection('layanan')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Map<String, dynamic>> newDataList = [];
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        newDataList.add({
          'nama': data['nama'],
          'jamLayanan': data['jamLayanan'],
          'sisaAntrian': data['sisaAntrian'],
          'loket': data['loket'],
          'proses': data['proses'],
          'jumlahDaftar': data['jumlahDaftar'],
        });
      });
      listLayanan = newDataList;
    });
  }

  Stream<void> getLihatLayanan(
      String kategori, String namaBank, String namaLayanan) {
    return FirebaseFirestore.instance
        .collection('kategori')
        .doc(kategori)
        .collection('Mitra')
        .doc(namaBank)
        .collection('layanan')
        .where('nama', isEqualTo: namaLayanan)
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Map<String, dynamic>> newDataList = [];
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        newDataList.add({
          'nama': data['nama'],
          'jamLayanan': data['jamLayanan'],
          'sisaAntrian': data['sisaAntrian'],
          'loket': data['loket'],
          'proses': data['proses'],
          'jumlahDaftar': data['jumlahDaftar'],
        });
      }
      detailLayanan = newDataList;
    });
  }

  Future<void> ambilAntrian(String kategori, String namaBank,
      String namaLayanan, String namaPengantri, String catatan) async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot dataUser = await FirebaseFirestore.instance
        .collection('akun')
        .doc(user?.uid)
        .get();
    int antrian = dataUser.get('sisaAntrian');
    String pengantri = dataUser.get('namaPengantri');
    String loketUser = dataUser.get('loket');
    String mitra = dataUser.get('namaMitra');
    if (pengantri.isNotEmpty && antrian > 0) {
      Get.snackbar(
        "Warning",
        "You already have an queue at $mitra loket $loketUser",
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
    } else {
      await FirebaseFirestore.instance
          .collection('kategori')
          .doc(kategori)
          .collection('Mitra')
          .doc(namaBank)
          .collection('layanan')
          .doc(namaLayanan)
          .update({
        'sisaAntrian': FieldValue.increment(1),
        'jumlahDaftar': FieldValue.increment(1),
      });
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('kategori')
          .doc(kategori)
          .collection('Mitra')
          .doc(namaBank)
          .collection('layanan')
          .doc(namaLayanan)
          .get();
      String loket = documentSnapshot.get('loket');
      int sisaAntrian = documentSnapshot.get('sisaAntrian');
      int jumlahDaftar = documentSnapshot.get('jumlahDaftar');
      String proses = documentSnapshot.get('proses');

      DocumentSnapshot infoMitra = await FirebaseFirestore.instance
          .collection('kategori')
          .doc(kategori)
          .collection('Mitra')
          .doc(namaBank)
          .get();
      String alamat = infoMitra.get('alamat');

      await FirebaseFirestore.instance
          .collection('akun')
          .doc(user?.uid)
          .update({
        'loket': loket,
        'namaMitra': namaBank,
        'namaPengantri': namaPengantri,
        'sisaAntrian': sisaAntrian,
        'catatan': catatan,
        'nomorAntrian': "$loket$jumlahDaftar",
        'namaLayanan': namaLayanan,
        'alamatMitra': alamat,
        'kategori': kategori,
        'proses': proses,
      });
      await FirebaseFirestore.instance
          .collection('antrian')
          .doc('$namaBank-$loket$jumlahDaftar')
          .set({
        'loket': loket,
        'namaMitra': namaBank,
        'namaPengantri': namaPengantri,
        'sisaAntrian': sisaAntrian,
        'catatan': catatan,
        'nomorAntrian': "$loket$jumlahDaftar",
        'namaLayanan': namaLayanan,
        'alamatMitra': alamat,
        'kategori': kategori,
        'proses': proses,
        'uID': user?.uid,
        'status': "",
      });
      return Get.to(() => const DapatNomor());
    }
  }

  Stream<List<Map<String, dynamic>>> infoAntrian() {
    User? user = FirebaseAuth.instance.currentUser;
    return FirebaseFirestore.instance
        .collection('akun')
        .doc(user?.uid)
        .snapshots()
        .map((DocumentSnapshot<Map<String, dynamic>> snapshot) {
      List<Map<String, dynamic>> newDataList = [];
      Map<String, dynamic> data = snapshot.data()!;
      newDataList.add({
        'catatan': data['catatan'],
        'loket': data['loket'],
        'namaMitra': data['namaMitra'],
        'namaPengantri': data['namaPengantri'],
        'nomorAntrian': data['nomorAntrian'],
        'sisaAntrian': data['sisaAntrian'],
        'namaLayanan': data['namaLayanan'],
        'alamatMitra': data['alamatMitra'],
        'kategori': data['kategori'],
        'proses': data['proses'],
      });
      return infoAntri = newDataList;
    });
  }

  Future<void> done() async {
    User? user = FirebaseAuth.instance.currentUser;
    bool confirm = await Get.defaultDialog(
      title: 'Confirmation',
      middleText: 'Apakah anda yakin telah selesai?',
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back(result: true);
          },
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back(result: false);
          },
          child: const Text('No'),
        ),
      ],
    );
    if (confirm) {
      Get.snackbar(
        "Successful",
        "Terimakasih Telah Menggunakan Antrianku",
        icon: const Icon(Icons.dangerous_outlined),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('akun')
          .doc(user?.uid)
          .get();
      String namaBank = documentSnapshot.get('namaMitra');
      String nomorAntrian = documentSnapshot.get('nomorAntrian');
      await FirebaseFirestore.instance
          .collection('antrian')
          .doc('$namaBank-$nomorAntrian')
          .delete();
      await FirebaseFirestore.instance
          .collection('akun')
          .doc(user?.uid)
          .update({
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
      return Get.offAll(() => const HomePage());
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.offAll(() => const WelcomePage());
      Get.snackbar(
        "Successful",
        "Berhasil SignOut",
        icon: const Icon(Icons.check_circle),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
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

  Stream<List<Map<String, dynamic>>> getListAntrianMitra(namaMitra) {
    return FirebaseFirestore.instance
        .collection('antrian')
        .where('namaMitra', isEqualTo: namaMitra)
        .where('status', isNotEqualTo: 'accept')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Map<String, dynamic>> newDataList = [];
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        newDataList.add({
          'namaPengantri': data['namaPengantri'],
          'namaMitra': data['namaMitra'],
          'nomorAntrian': data['nomorAntrian'],
          'loket': data['loket'],
        });
      }
      return listAntrianMitra = newDataList;
    });
  }

  Stream<List<Map<String, dynamic>>> getListAntrianMitraAccepted(namaMitra) {
    return FirebaseFirestore.instance
        .collection('antrian')
        .where('namaMitra', isEqualTo: namaMitra)
        .where('status', isEqualTo: "accept")
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Map<String, dynamic>> newDataList = [];
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        newDataList.add({
          'namaPengantri': data['namaPengantri'],
          'nomorAntrian': data['nomorAntrian'],
          'namaMitra': data['namaMitra'],
          'loket': data['loket'],
        });
      }
      return listAntrianMitraAccepted = newDataList;
    });
  }

  accept(String namaMitra, String nomorAntrian) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference ref = db.collection('antrian');
    ref.doc("$namaMitra-$nomorAntrian").update({'status': "accept"});
  }

  queueDone(String namaMitra, String nomorAntrian) async {
    DocumentSnapshot uid = await FirebaseFirestore.instance
        .collection('antrian')
        .doc('$namaMitra-$nomorAntrian')
        .get();
    String id = uid.get('uID');
    bool confirm = await Get.defaultDialog(
      title: 'Confirmation',
      middleText: 'Apakah anda yakin telah selesai?',
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back(result: true);
          },
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back(result: false);
          },
          child: const Text('No'),
        ),
      ],
    );
    if (confirm) {
      Get.snackbar(
        "Successful",
        "Terimakasih Telah Menggunakan Antrianku",
        icon: const Icon(Icons.dangerous_outlined),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      await FirebaseFirestore.instance.collection('akun').doc(id).update({
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
      await FirebaseFirestore.instance
          .collection('antrian')
          .doc('$namaMitra-$nomorAntrian')
          .delete();
    }
  }

  decline(String namaMitra, String nomorAntrian) async {
    bool confirm = await Get.defaultDialog(
      title: 'Confirmation',
      middleText: 'Apakah anda yakin membatalkan antrian ini?',
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back(result: true);
          },
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back(result: false);
          },
          child: const Text('No'),
        ),
      ],
    );
    DocumentSnapshot uid = await FirebaseFirestore.instance
        .collection('antrian')
        .doc('$namaMitra-$nomorAntrian')
        .get();
    String id = uid.get('uID');
    if (confirm) {
      Get.snackbar(
        "Successful",
        "Anda telah berhasil mebatalkan antrian ini",
        icon: const Icon(Icons.dangerous_outlined),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.yellow,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      await FirebaseFirestore.instance.collection('akun').doc(id).update({
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
      await FirebaseFirestore.instance
          .collection('antrian')
          .doc('$namaMitra-$nomorAntrian')
          .delete();
    }
  }
}
