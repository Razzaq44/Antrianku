import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  String? name;
  String? role;
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
}
