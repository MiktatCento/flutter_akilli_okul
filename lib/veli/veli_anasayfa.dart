import 'package:akilli_okul/ayarlar.dart';
import 'package:akilli_okul/ogretmen/ui/ogretmen_bildirimler.dart';
import 'package:akilli_okul/veli/ui/veli_drawer.dart';
import 'package:akilli_okul/veli/ui/veli_mesajlar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VeliAnasayfa extends StatefulWidget {
  @override
  _VeliAnasayfaState createState() => _VeliAnasayfaState();
}

class _VeliAnasayfaState extends State<VeliAnasayfa> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
              bottom: TabBar(
                tabs: [
                  Tab(child: Text("MESAJLAR")),
                  Tab(child: Text("BİLDİRİMLER")),
                ],
              ),
              title: Text(Ayarlar().uygulamaIsmi + " - Veli"),
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: (){
                  VeliDrawer().innerKeyAc();
                },
              ),
              automaticallyImplyLeading: false),
          body: TabBarView(
            children: [
              VeliMesajlar(),
              OgretmenBildirim()
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
