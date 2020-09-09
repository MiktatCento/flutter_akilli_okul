import 'package:akilli_okul/ayarlar.dart';
import 'package:akilli_okul/idare/ui/idare_drawer.dart';
import 'package:akilli_okul/idare/ui/idare_mesajlar.dart';
import 'package:akilli_okul/ogretmen/ui/ogretmen_bildirimler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IdareAnasayfa extends StatefulWidget {
  @override
  _IdareAnasayfaState createState() => _IdareAnasayfaState();
}

class _IdareAnasayfaState extends State<IdareAnasayfa> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(

            centerTitle: true,
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(child: Text("MESAJLAR")),
                  Tab(child: Text("BİLDİRİMLER")),
                ],
              ),
              title: Text(Ayarlar().uygulamaIsmi + " - İdare"),
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: (){
                  IdareDrawer().innerKeyAc();
                },
              ),
              automaticallyImplyLeading: false),
          body: TabBarView(
            children: [
              IdareMesajlar(),
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
