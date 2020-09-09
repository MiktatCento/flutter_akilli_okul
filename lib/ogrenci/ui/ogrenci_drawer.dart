import 'package:akilli_okul/login/changepass_ogrenci.dart';
import 'package:akilli_okul/models/uyeler.dart';
import 'package:akilli_okul/ogrenci/ogrenci_anasayfa.dart';
import 'package:akilli_okul/ogrenci/ui/ogrenci_ppgor.dart';
import 'package:akilli_okul/ogrenci/ui/ogrenci_sinavso.dart';
import 'package:akilli_okul/ogrenci/ui/ogrenci_sorugonder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:akilli_okul/style/theme.dart' as Theme;
import 'package:photo_view/photo_view.dart';

import '../../ayarlar.dart';

final GlobalKey<InnerDrawerState> _innerDrawerKey =
    GlobalKey<InnerDrawerState>();
String oppurl =
    "https://tr.web.img3.acsta.net/r_1280_720/medias/nmedia/18/69/21/47/19057455.jpg";
String ogrenciAdi = "Miktat Cento";
String ogrenciAlan = "10/K - 1975";

Widget bulunduguSayfa = OgrenciAnasayfa();
bool anasayfadami = true,
    sinavdami = false,
    ogsogodemi = false,
    sifredegistirdemi = false;

class OgrenciDrawer extends StatefulWidget {
  void innerKeyAc() {
    print("key açıldı");
    Ayarlar().klavyeKapat();
    _innerDrawerKey.currentState.open();
  }

  @override
  _OgrenciDrawerState createState() => _OgrenciDrawerState();
}

class _OgrenciDrawerState extends State<OgrenciDrawer> {
  void ekranKur() async {
    User _user = await User.uyeOlustur();
            
    setState(() {
      ogrenciAdi = _user.uyeIsim;
      ogrenciAlan = uyeSinif["sinif_adi"] + " - " + _user.uyeOkulNo.toString();
      oppurl = _user.uyePP;
    });
  }

  @override
  void initState() {
    ekranKur();
    sinavdami = false;
    ogsogodemi = false;
    sifredegistirdemi = false;
    anasayfadami = true;
    bulunduguSayfa = OgrenciAnasayfa();
    super.initState();
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
                                  OgrenciPPGor(oppurl, ogrenciAdi)));
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
                                  PhotoViewHeroAttributes(tag: "ppogrenci"),
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
                    ogrenciAdi,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    ogrenciAlan,
                    textAlign: TextAlign.center,
                  ),
                  children: <Widget>[
                    ListTileTheme(
                      selectedColor: Colors.white,
                      child: ListTile(
                        selected: sifredegistirdemi,
                        leading: Icon(Icons.security),
                        title: Text("Şifre Değiştir"),
                        onTap: () {
                          if (bulunduguSayfa != ChangePassOgrenci()) {
                            setState(() {
                              bulunduguSayfa = ChangePassOgrenci();
                              sinavdami = false;
                              sifredegistirdemi = true;
                              anasayfadami = false;
                              ogsogodemi = false;
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
                      if (bulunduguSayfa != OgrenciAnasayfa()) {
                        setState(() {
                          bulunduguSayfa = OgrenciAnasayfa();
                          sinavdami = false;
                          sifredegistirdemi = false;
                          anasayfadami = true;
                          ogsogodemi = false;
                        });
                      }
                    },
                  ),
                ),
                ListTileTheme(
                  selectedColor: Colors.white,
                  child: ListTile(
                    leading: Icon(FontAwesomeIcons.pencilAlt),
                    selected: sinavdami,
                    title: Text("Sınav Sonuçları"),
                    onTap: () {
                      //Navigator.pushNamed(context, "ogrenciSinavSo");
                      if (bulunduguSayfa != OgrenciSinavSo()) {
                        setState(() {
                          bulunduguSayfa = OgrenciSinavSo();
                          sinavdami = true;
                          sifredegistirdemi = false;
                          sifredegistirdemi = false;
                          anasayfadami = false;
                          ogsogodemi = false;
                        });
                      }
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
                      if (bulunduguSayfa != OgrenciSoruGonder()) {
                        setState(() {
                          bulunduguSayfa = OgrenciSoruGonder();
                          sinavdami = false;
                          sifredegistirdemi = false;
                          anasayfadami = false;
                          ogsogodemi = true;
                        });
                      }
                    },
                  ),
                ),
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
