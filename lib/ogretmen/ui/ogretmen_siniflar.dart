import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OgretmenSiniflar extends StatefulWidget {
  @override
  _OgretmenSiniflarState createState() => _OgretmenSiniflarState();
}

class _OgretmenSiniflarState extends State<OgretmenSiniflar>
    with AutomaticKeepAliveClientMixin<OgretmenSiniflar> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('siniflar').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Center(
              child: Center(child: CircularProgressIndicator()),
            );
          default:
            return new ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                print(document.data);
                return Card(
                  elevation: 4.5,
                  child: ListTile(
                    onTap: () {},
                    leading: CircleAvatar(
                      child: Text(document["sinif_adi"]),
                    ),
                    title: Text("Sınıf: ${document["sinif_adi"]}"),
                    subtitle: Text("Sınıf Mevudu: ${document.data["sinif_ogrencileri"].toString()}"),
                  ),
                );
              }).toList(),
            );
        }
      },
    );
  }

  /*
  Card(
          elevation: 4.5,
          child: ListTile(
            onTap: (){},
            leading: CircleAvatar(
              child: Text(index.toString()),
            ),
            title: Text("Sınıf: ${index+8}-K"),
            subtitle: Text("Sınıf Mevudu: ${index*10}"),
          ),
        );
  */

  @override
  bool get wantKeepAlive => true;
}
