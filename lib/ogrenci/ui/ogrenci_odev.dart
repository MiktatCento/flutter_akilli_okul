import 'package:akilli_okul/models/uyeler.dart';
import 'package:akilli_okul/ogrenci/ui/ogrenci_postcard.dart';
import 'package:flutter/material.dart';

class OgrenciOdev extends StatefulWidget {
  @override
  _OgrenciOdevState createState() => _OgrenciOdevState();
}

class _OgrenciOdevState extends State<OgrenciOdev>
    with AutomaticKeepAliveClientMixin<OgrenciOdev> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
        // key: PageStorageKey("ogrenciOdev"),
        itemCount: 3,
        itemBuilder: (c, i) {
          return PostCard(
            postTuru: "ödev",
              imageUrl: "https://source.unsplash.com/random/$i",
              title: "Örnek ödev başlık $i",
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
