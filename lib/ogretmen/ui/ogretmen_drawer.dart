import 'package:akilli_okul/ayarlar.dart';
import 'package:akilli_okul/login/changepass_ogretmen.dart';
import 'package:akilli_okul/ogrenci/ui/ogrenci_drawer.dart';
import 'package:akilli_okul/ogretmen/ogretmen_anasayfa.dart';
import 'package:akilli_okul/ogretmen/ui/ogretmen_ppgor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:akilli_okul/style/theme.dart' as Theme;
import 'package:photo_view/photo_view.dart';

final GlobalKey<InnerDrawerState> _innerDrawerKey =
    GlobalKey<InnerDrawerState>();
String oppurl =
    "https://playtusu.com/wp-content/uploads/2019/10/walter-white-1310x737.jpg";
String ogretmenAdi = "Walter White";
String ogretmenAlan = "Walter White";

Widget bulunduguSayfa = OgretmenAnasayfa();
bool anasayfadami = true, sifredegistirdemi = false;

class OgretmenDrawer extends StatefulWidget {
  void innerKeyAc() {
    print("key açıldı");
    Ayarlar().klavyeKapat();
    _innerDrawerKey.currentState.open();
  }

  @override
  _OgretmenDrawerState createState() => _OgretmenDrawerState();
}

class _OgretmenDrawerState extends State<OgretmenDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> veriGetir() async {
    var firebaseUser = await _auth.currentUser();
    if (firebaseUser != null) {
      print(firebaseUser.uid);
      Firestore.instance
          .collection('uyeler')
          .document(firebaseUser.uid)
          .get()
          .then((DocumentSnapshot ds) {
        print(ds.data["uye_isim"]);
        setState(() {
          ogretmenAdi = ds.data["uye_isim"];
          ogretmenAlan = ds.data["uye_alan"];
          oppurl = ds.data["uye_pp"];
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    veriGetir();
    sifredegistirdemi = false;
    anasayfadami = true;
    bulunduguSayfa = OgretmenAnasayfa();
  }

  @override
  Widget build(BuildContext context) {
    return InnerDrawer(
        key: _innerDrawerKey,
        onTapClose: true, // default false
        swipe: true, // default true
        // colorTransition: Color.red, // default Color.black54

        // DEPRECATED: use offset
        leftOffset: 0.6, // Will be removed in 0.6.0 version
        rightOffset: 0.6, // Will be removed in 0.6.0 version

        //When setting the vertical offset, be sure to use only top or bottom
        offset: IDOffset.only(bottom: 0.0, right: 0.5, left: 0.2),

        // DEPRECATED:  use scale
        leftScale: 0.9, // Will be removed in 0.6.0 version
        rightScale: 0.9, // Will be removed in 0.6.0 version

        scale: IDOffset.horizontal(0.8), // set the offset in both directions

        proportionalChildArea: true, // default true
        borderRadius: 25, // default 0
        leftAnimationType: InnerDrawerAnimation.static, // default static
        rightAnimationType: InnerDrawerAnimation.quadratic,
        backgroundColor: Theme.Colors
            .loginGradientEnd, // default  Theme.of(context).backgroundColor

        innerDrawerCallback: (a) =>
            print(a), // return  true (open) or false (close)
        leftChild: Scaffold(
          backgroundColor: Theme.Colors.loginGradientEnd,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OgretmenPPGor(oppurl, ogretmenAdi)));
                    },
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(100.0),
                      child: Container(
                        // changing from 200 to 150 as to look better
                        height: 150.0,
                        width: 150.0,
                        child: ClipOval(
                            child: Stack(
                          children: <Widget>[
                            CupertinoActivityIndicator(),
                            PhotoView(
                              minScale: PhotoViewComputedScale.covered,
                              maxScale: PhotoViewComputedScale.covered,
                              backgroundDecoration:
                                  BoxDecoration(color: Colors.transparent),
                              heroAttributes:
                                  PhotoViewHeroAttributes(tag: "ppogretmen"),
                              imageProvider: NetworkImage(oppurl),
                              initialScale: PhotoViewComputedScale.covered,
                            ),
                          ],
                        )),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                ExpansionTile(
                  title: Text(
                    ogretmenAdi,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    ogretmenAlan,
                    textAlign: TextAlign.center,
                  ),
                  children: <Widget>[
                    ListTileTheme(
                      selectedColor: Colors.white,
                      child: ListTile(
                        leading: Icon(Icons.security),
                        selected: sifredegistirdemi,
                        title: Text("Şifre Değiştir"),
                        onTap: () {
                          if (bulunduguSayfa != ChangePassOgretmen()) {
                            setState(() {
                              bulunduguSayfa = ChangePassOgretmen();
                              anasayfadami = false;
                              sifredegistirdemi = true;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                ListTileTheme(
                  selectedColor: Colors.white,
                  child: ListTile(
                    selected: anasayfadami,
                    leading: Icon(FontAwesomeIcons.home),
                    title: Text("Anasayfa"),
                    onTap: () {
                      if (bulunduguSayfa != OgretmenAnasayfa()) {
                        setState(() {
                          bulunduguSayfa = OgretmenAnasayfa();
                          sinavdami = false;
                          anasayfadami = true;
                          ogsogodemi = false;
                        });
                      }
                    },
                  ),
                ),
                /*  ListTileTheme(
                  selectedColor: Colors.white,
                  child: ListTile(
                    leading: Icon(FontAwesomeIcons.pencilAlt),
                    selected: sinavdami,
                    title: Text("Sınav Sonuçları"),
                    onTap: () {
                      //Navigator.pushNamed(context, "OgretmenSinavSo");
                      /*if (bulunduguSayfa != OgretmenSinavSo()) {
                        setState(() {
                          bulunduguSayfa = OgretmenSinavSo();
                          sinavdami = true;
                          anasayfadami = false;
                          ogsogodemi = false;
                        });
                      }*/
                    },
                  ),
                ),
                ListTileTheme(
                  selectedColor: Colors.white,
                  child: ListTile(
                    selected: ogsogodemi,
                    leading: Icon(Icons.send),
                    title: Text("Öğretmene Soru Gönder"),
                    onTap: () {
                      /*if (bulunduguSayfa != OgretmenSoruGonder()) {
                        setState(() {
                          bulunduguSayfa = OgretmenSoruGonder();
                          sinavdami = false;
                          anasayfadami = false;
                          ogsogodemi = true;
                        });
                      }*/
                    },
                  ),
                ),*/
                ListTileTheme(
                  selectedColor: Colors.white,
                  child: ListTile(
                    //selected: anasayfadami,
                    leading: Icon(Icons.close),
                    title: Text("Çıkış Yap"),
                    onTap: () async {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacementNamed("loginPage");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        scaffold: bulunduguSayfa);
  }
}
