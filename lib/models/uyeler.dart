import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User {
  final String userID;
  String uyeAlan;
  String uyeIsim;
  String uyeMail;
  String uyePP;
  String uyeSinif;
  String uyeYetki; //
  String uyeKiminVelisi;
  int uyeOkulNo;
  Map uyeSinavSonuc;
  Map uyeBildirimleri;
  Map uyeMesajlari;
  Map uyeOdevleri;
  Map uyeKonulari;
  List uyeSiniflari;
  User(
      {@required this.userID,
      @required this.uyeMail,
      @required this.uyeAlan,
      @required this.uyeBildirimleri,
      @required this.uyeIsim,
      @required this.uyeKiminVelisi,
      @required this.uyeKonulari,
      @required this.uyeMesajlari,
      @required this.uyeOdevleri,
      @required this.uyeOkulNo,
      @required this.uyePP,
      @required this.uyeSinavSonuc,
      @required this.uyeSinif,
      @required this.uyeSiniflari,
      @required this.uyeYetki});

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'uyeAlan': uyeAlan,
      'uyeIsim': uyeIsim,
      'uyeMail': uyeMail,
      'uyeOkulNo': uyeOkulNo,
      'uyePP': uyePP,
      'uyeSinif': uyeSinif,
      'uyeYetki': uyeYetki,
      'uyeKiminVelisi': uyeKiminVelisi,
      'uyeSinavSonuc': uyeSinavSonuc,
      'uyeBildirimleri': uyeBildirimleri,
      'uyeMesajlari': uyeMesajlari,
      'uyeOdevleri': uyeOdevleri,
      'uyeKonulari': uyeKonulari,
      'uyeSiniflari': uyeSiniflari,
    };
  }

  User.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        uyeAlan = map['uyeAlan'],
        uyeIsim = map['uyeIsim'],
        uyeMail = map['uyeMail'],
        uyeOkulNo = map['uyeOkulNo'],
        uyePP = map['uyePP'],
        uyeSinif = map['uyeSinif'],
        uyeYetki = map['uyeYetki'],
        uyeKiminVelisi = map['uyeKiminVelisi'],
        uyeSinavSonuc = map['uyeSinavSonuc'],
        uyeBildirimleri = map['uyeBildirimleri'],
        uyeMesajlari = map['uyeMesajlari'],
        uyeOdevleri = map['uyeOdevleri'],
        uyeKonulari = map['uyeKonulari'],
        uyeSiniflari = map['uyeSiniflari'];

  User.idveResim({@required this.userID, @required this.uyePP});
  User.yetkiNe({@required this.userID, @required this.uyeYetki});

  static Future<User> uyeOlustur() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var firebaseUser = await _auth.currentUser();

    var ds = await Firestore.instance
        .collection("uyeler")
        .document(firebaseUser.uid)
        .get(); 
    User _user = User(
        userID: firebaseUser.uid,
        uyeMail: firebaseUser.email,
        uyeAlan: ds.data["uyeAlan"],
        uyeIsim: ds.data["uyeIsim"],
        uyeKiminVelisi: ds.data["uyeKiminVelisi"],
        uyeKonulari: ds.data["uyeKonulari"],
        uyeMesajlari: ds.data["uyeMesajlari"],
        uyeBildirimleri: ds.data["uyeBildirimleri"],
        uyeOdevleri: ds.data["uyeOdevleri"],
        uyeOkulNo: ds.data["uyeOkulNo"],
        uyePP: ds.data["uyePP"],
        uyeSinavSonuc: ds.data["uyeSinavSonuc"],
        uyeSinif: ds.data["uyeSinif"],
        uyeSiniflari: ds.data["uyeSiniflari"],
        uyeYetki: ds.data["uyeYetki"]);
    return _user;
  }
}
