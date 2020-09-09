import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class OgrenciPPGor extends StatefulWidget {
  final String ppURL;
  final String ogretmenAdi;
  OgrenciPPGor(this.ppURL, this.ogretmenAdi);
  @override
  _OgrenciPPGorState createState() => _OgrenciPPGorState();
}

class _OgrenciPPGorState extends State<OgrenciPPGor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.ogretmenAdi),
      ),
      body: Container(
        child: PhotoView(
          heroAttributes: PhotoViewHeroAttributes(tag: "ppogrenci"),
          imageProvider: NetworkImage(widget.ppURL),
        ),
      ),
    );
  }
}
