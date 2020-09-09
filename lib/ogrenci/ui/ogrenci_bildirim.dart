import 'package:akilli_okul/models/uyeler.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OgrenciBildirim extends StatefulWidget {
  @override
  _OgrenciBildirimState createState() => _OgrenciBildirimState();
}

class _OgrenciBildirimState extends State<OgrenciBildirim>
    with AutomaticKeepAliveClientMixin<OgrenciBildirim> {
  @override
  bool get wantKeepAlive => true;
  String ekranMesaji = "";
  List icerikler = [], kimden = [];
  void ekranKurulum() async {
    User _user = await User.uyeOlustur();
    for (int i = _user.uyeBildirimleri.length; i > 0; i--) {
      var uyeler = await Firestore.instance
          .collection("uyeler")
          .document(_user.uyeBildirimleri["bildirim$i"]["kimden"])
          .get();
      String icerik = _user.uyeBildirimleri["bildirim$i"]["icerik"];
      setState(() {
        icerikler.add(icerik);
        kimden.add(uyeler.data["uyeIsim"]);
        ekranMesaji += "$icerik : ${uyeler.data["uyeIsim"]} \n";
      });
      print(icerik);
    }
  }

  @override
  void initState() {
    super.initState();
    ekranKurulum();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      alignment: Alignment.center,
      child: icerikler.isEmpty
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: icerikler.length,
              itemBuilder: (BuildContext c, int i) {
                return Card(
                  elevation: 3,
                  child: ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.notifications,
                          size: 28,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                    title: Text(kimden[i]),
                    subtitle: Text(icerikler[i]),
                    onTap: () {
                      AwesomeDialog(
                              context: context,
                              dialogType: DialogType.INFO,
                              animType: AnimType.BOTTOMSLIDE,
                              tittle: kimden[i],
                              desc: icerikler[i],
                              btnOkText: "Kapat",
                              btnOkOnPress: () {})
                          .show();
                    },
                  ),
                );
              },
            ),
    );
  }
}
