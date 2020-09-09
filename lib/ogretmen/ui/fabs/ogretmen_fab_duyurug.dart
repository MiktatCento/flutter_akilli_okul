import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OgretmenFabDuyurug extends StatefulWidget {
  @override
  _OgretmenFabDuyurugState createState() => _OgretmenFabDuyurugState();
}

class _OgretmenFabDuyurugState extends State<OgretmenFabDuyurug> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(FontAwesomeIcons.user),
                title: Text("Gönderilecek grubu seçiniz"),
                subtitle: Text("Gönderilecek grup: 10-K"),
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
                    hintText: "Duyuru Başlığı",
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
                  maxLength: 300,
                  // focusNode: myFocusNodeEmail,
                  // controller: signupEmailController,
                  keyboardType: TextInputType.text,
                  maxLines: 6,
                  style: TextStyle(
                      fontFamily: "WorkSansSemiBold",
                      fontSize: 16.0,
                      color: Colors.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Duyuru İçeriği",
                    hintStyle: TextStyle(
                        fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                  ),
                ),
              ),
            ),
            /*Card(
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
             */
          ],
        ),
      ),
    );
  }
}