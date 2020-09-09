import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OgretmenBildirim extends StatefulWidget {
  @override
  _OgretmenBildirimState createState() => _OgretmenBildirimState();
}


class _OgretmenBildirimState extends State<OgretmenBildirim> {
  @override
  Widget build(BuildContext context) {
    return BookList();
  }
}

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('uyeler').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Center(
              child: Center(child:CircularProgressIndicator()),
            );
          default:
            return new ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                    print(document.data);
                return new ListTile(
                  title: new Text(document['uye_isim']),
                  subtitle: new Text(document['uye_isim']),
                );
              }).toList(),
            );
        }
      },
    );
  }
}
