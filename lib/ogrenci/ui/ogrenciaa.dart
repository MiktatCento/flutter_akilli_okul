import 'package:akilliokul/ayarlar.dart';
import 'package:akilliokul/ogrenci/ui/ogrenciKonulari.dart';
import 'package:akilliokul/ogrenci/ui/ogrenci_bildirimler.dart';
import 'package:akilliokul/ogrenci/ui/ogrenci_drawer.dart';
import 'package:akilliokul/ogrenci/ui/ogrenci_odevler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

class OgrenciAnasayfa extends StatefulWidget {
  @override
  _OgrenciAnasayfaState createState() => _OgrenciAnasayfaState();
}

class _OgrenciAnasayfaState extends State<OgrenciAnasayfa> {
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();

  @override
  Widget build(BuildContext context) {
    return InnerDrawer(
        key: _innerDrawerKey,
        onTapClose: true, // default false
        swipe: true, // default true
        colorTransition: Colors.red, // default Color.black54

        // DEPRECATED: use offset
        leftOffset: 0.3, // Will be removed in 0.6.0 version
        rightOffset: 0.3, // Will be removed in 0.6.0 version

        //When setting the vertical offset, be sure to use only top or bottom
        offset: IDOffset.only(left: 0.2),

        // DEPRECATED:  use scale
        leftScale: 0.9, // Will be removed in 0.6.0 version
        rightScale: 0.9, // Will be removed in 0.6.0 version

        scale: IDOffset.horizontal(0.8), // set the offset in both directions

        proportionalChildArea: true, // default true
        borderRadius: 50, // default 0
        leftAnimationType: InnerDrawerAnimation.static, // default static
        rightAnimationType: InnerDrawerAnimation.quadratic,
        backgroundColor:
            Colors.red, // default  Theme.of(context).backgroundColor

        //when a pointer that is in contact with the screen and moves to the right or left
        onDragUpdate: (double val, InnerDrawerDirection direction) {
          // return values between 1 and 0
          print(val);
          // check if the swipe is to the right or to the left
          print(direction == InnerDrawerDirection.start);
        },
        innerDrawerCallback: (a) =>
            print(a), // return  true (open) or false (close)
        leftChild: Container(), // required if rightChild is not set
        rightChild: Container(), // required if leftChild is not set

        //  A Scaffold is generally used but you are free to use other widgets
        // Note: use "automaticallyImplyLeading: false" if you do not personalize "leading" of Bar
        scaffold: DefaultTabController(
          length: 3,
          child: StreamBuilder<DocumentSnapshot>(
            stream: Firestore.instance
                .collection("uyeler")
                .document("pLA6hM3ar9MsARyqyzrbIKiFX752")
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  return Scaffold(
                    appBar: AppBar(
                      centerTitle: true,
                      bottom: TabBar(
                        isScrollable: false,
                        tabs: [
                          Tab(child: Text("ÖDEVLER")),
                          Tab(child: Text("KONU ANLATIMI")),
                          Tab(child: Text("BİLDİRİMLER")),
                        ],
                      ),
                      title: Text(Ayarlar().uygulamaIsmi + " - Öğrenci"),
                      leading: IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          _innerDrawerKey.currentState.open();
                        },
                      ),
                      automaticallyImplyLeading: false,
                    ),
                    drawer: OgrenciDrawer(),
                    body: TabBarView(
                      children: [
                        OgrenciOdevleri(),
                        OgrenciKonulari(),
                        OgrenciBildirimleri(),
                      ],
                    ),
                  );
              }
            },
          ),
        ));
  }
}
