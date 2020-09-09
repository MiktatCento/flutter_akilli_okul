import 'package:akilli_okul/ogretmen/ui/ogretmen_ppgor.dart';
import 'package:akilli_okul/veli/ui/veli_sinavso.dart';
import 'package:akilli_okul/veli/veli_anasayfa.dart';
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
final oppurl = "https://source.unsplash.com/random/";
final ogretmenAdi = "Miktat Cento";

Widget bulunduguSayfa = VeliAnasayfa();
bool anasayfadami = true, sinavdami = false;

class IdareDrawer extends StatefulWidget {
  void innerKeyAc() {
    print("key açıldı");
    Ayarlar().klavyeKapat();
    _innerDrawerKey.currentState.open();
  }

  @override
  _IdareDrawerState createState() => _IdareDrawerState();
}

class _IdareDrawerState extends State<IdareDrawer> {
  @override
  void initState() {
    sinavdami = false;
    anasayfadami = true;
    bulunduguSayfa = VeliAnasayfa();
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
                    "Miktat Cento",
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    "Miktat Cento Velisi",
                    textAlign: TextAlign.center,
                  ),
                  children: <Widget>[
                    ListTileTheme(
                      selectedColor: Colors.white,
                      child: ListTile(
                        leading: Icon(Icons.security),
                        selected: sinavdami,
                        title: Text("Şifre Değiştir"),
                        onTap: () {
                          Navigator.pushNamed(context, "changePass");
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
                      if (bulunduguSayfa != VeliAnasayfa()) {
                        setState(() {
                          bulunduguSayfa = VeliAnasayfa();
                          sinavdami = false;
                          anasayfadami = true;
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
                      if (bulunduguSayfa != VeliSinavSo()) {
                        setState(() {
                          bulunduguSayfa = VeliSinavSo();
                          sinavdami = true;
                          anasayfadami = false;
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
