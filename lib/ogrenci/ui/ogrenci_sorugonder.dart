import 'package:akilli_okul/ogrenci/ui/ogrenci_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_popup/mobile_popup.dart';

class OgrenciSoruGonder extends StatefulWidget {
  @override
  _OgrenciSoruGonderState createState() => _OgrenciSoruGonderState();
}

class _OgrenciSoruGonderState extends State<OgrenciSoruGonder>
    with AutomaticKeepAliveClientMixin<OgrenciSoruGonder> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Öğretmene Soru Gönder"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            OgrenciDrawer().innerKeyAc();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 1000,
        itemBuilder: (BuildContext c, int index) {
          index++;
          return Card(
            elevation: 4.5,
            child: ListTile(
              onTap: () {},
              leading: CircleAvatar(
                child: Text(index.toString()),
              ),
              title: Text("Öğretmen $index"),
              subtitle: Text("Soru İçeriği $index"),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMobilePopup(
            context: context,
            builder: (context) => MobilePopUp(
              //title: Ayarlar().uygulamaIsmi,
              title: 'Öğretmene Soru Gönder',
              showFullScreen: false,
              showDoneButton: true,
              actions: <Widget>[
                MaterialButton(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Gönder",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          // color: Colors.white
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  onPressed: () {},
                )
              ],
              leadingColor: Colors.white,
              child: Builder(builder: (navigator) => PopupIcerik()),
            ),
          );
        },
        child: Icon(
          Icons.add,
          size: 24,
        ),
      ),
    );
  }
}

class PopupIcerik extends StatefulWidget {
  @override
  _PopupIcerikState createState() => _PopupIcerikState();
}

class _PopupIcerikState extends State<PopupIcerik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(FontAwesomeIcons.user),
                title: Text("Gönderilecek öğretmeninizi seçiniz"),
                subtitle: Text("Gönderilecek öğretmen: Şule Avşar"),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.text_fields),
                title: TextField(
                  maxLength: 50,
                  // focusNode: myFocusNodeEmail,
                  // controller: signupEmailController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      fontFamily: "WorkSansSemiBold",
                      fontSize: 16.0,
                      color: Colors.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Soru Başlığı",
                    hintStyle: TextStyle(
                        fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.text_fields),
                title: TextField(
                  // focusNode: myFocusNodeEmail,
                  // controller: signupEmailController,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(
                      fontFamily: "WorkSansSemiBold",
                      fontSize: 16.0,
                      color: Colors.black),
                  maxLines: 6,
                  maxLength: 500,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Soru İçeriği",
                    hintStyle: TextStyle(
                        fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.add_a_photo),
                title: Text("Resim Eklemek İsterseniz Seçiniz"),
                subtitle: Text("Resim: Seçilmedi"),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
