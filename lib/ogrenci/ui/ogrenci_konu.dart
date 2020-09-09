import 'package:akilli_okul/ogrenci/ui/ogrenci_postcard.dart';
import 'package:flutter/material.dart';

class OgrenciKonu extends StatefulWidget {
  @override
  _OgrenciKonuState createState() => _OgrenciKonuState();
}

class _OgrenciKonuState extends State<OgrenciKonu>
    with AutomaticKeepAliveClientMixin<OgrenciKonu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
        //key: PageStorageKey("ogrenciKonu"),
        itemCount: 1000,
        itemBuilder: (c, i) {
          return PostCard(
              postTuru: "konu",
              imageUrl: "https://source.unsplash.com/random/$i",
              title: "Örnek konu anlatımı başlık $i",
              category: "Ders $i",
              views: i * 25,
              categoryID: i,
              date: "20 Ocak 2020",
              id: i);
        });
  }

  @override
  bool get wantKeepAlive => true;
}
