import 'package:akilli_okul/ayarlar.dart';
import 'package:akilli_okul/ogrenci/ui/ogrenci_bildirim.dart';
import 'package:akilli_okul/ogrenci/ui/ogrenci_konu.dart';
import 'package:akilli_okul/ogrenci/ui/ogrenci_odev.dart';
import 'package:akilli_okul/ogrenci/ui/ogrenci_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OgrenciAnasayfa extends StatefulWidget {
  @override
  _OgrenciAnasayfaState createState() => _OgrenciAnasayfaState();
}

class _OgrenciAnasayfaState extends State<OgrenciAnasayfa> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(child: Text("ÖDEVLER")),
                  Tab(child: Text("KONU ANLATIMI")),
                  Tab(child: Text("BİLDİRİMLER")),
                ],
              ),
              title: Text(Ayarlar().uygulamaIsmi + " - Öğrenci"),
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: (){
                  OgrenciDrawer().innerKeyAc();
                },
              ),
              automaticallyImplyLeading: false),
          body: TabBarView(
            children: [
              OgrenciOdev(),
              OgrenciKonu(),
              OgrenciBildirim()
            ],
          ),
        )
    );
  }
}

/*

DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
 */
