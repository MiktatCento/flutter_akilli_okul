import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class OgretmenPPGor extends StatefulWidget {
  final String ppURL;
  final String ogretmenAdi;
  OgretmenPPGor(this.ppURL, this.ogretmenAdi);
  @override
  _OgretmenPPGorState createState() => _OgretmenPPGorState();
}

class _OgretmenPPGorState extends State<OgretmenPPGor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.ogretmenAdi),
      ),
      body: Container(
        child: PhotoView(
          heroAttributes: PhotoViewHeroAttributes(tag: "ppogretmen"),
          imageProvider: NetworkImage(widget.ppURL),
        ),
      ),
    );
  }
}
