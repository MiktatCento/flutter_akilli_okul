import 'package:akilli_okul/ayarlar.dart';
import 'package:akilli_okul/ogretmen/ui/ogretmen_bildirimler.dart';
import 'package:akilli_okul/ogretmen/ui/ogretmen_drawer.dart';
import 'package:akilli_okul/ogretmen/ui/ogretmen_fab.dart';
import 'package:akilli_okul/ogretmen/ui/ogretmen_mesajlar.dart';
import 'package:akilli_okul/ogretmen/ui/ogretmen_siniflar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OgretmenAnasayfa extends StatefulWidget {
  @override
  _OgretmenAnasayfaState createState() => _OgretmenAnasayfaState();
}

class _OgretmenAnasayfaState extends State<OgretmenAnasayfa> {
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
                  Tab(child: Text("MESAJLAR")),
                  Tab(child: Text("SINIFLARIM")),
                  Tab(child: Text("BİLDİRİMLER")),
                ],
              ),
              title: Text(Ayarlar().uygulamaIsmi + " - Öğretmen"),
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: (){
                  OgretmenDrawer().innerKeyAc();
                },
              ),
              automaticallyImplyLeading: false),
          body: TabBarView(
            children: [
              OgretmenMesajlar(),
              OgretmenSiniflar(),
              OgretmenBildirim()
            ],
          ),
          floatingActionButton: OgretmenFab(),
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
