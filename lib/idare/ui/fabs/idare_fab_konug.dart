import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VeliFabKonug extends StatefulWidget {
  @override
  _VeliFabKonugState createState() => _VeliFabKonugState();
}

class _VeliFabKonugState extends State<VeliFabKonug> {
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
                leading: Icon(FontAwesomeIcons.user),
                title: Text("Gönderilecek konu anlatımı türünü seçiniz"),
                subtitle: Text("Gönderilecek tür: PDF"),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.add_a_photo),
                title: Text("Konu anlatımı kapak resmi"),
                subtitle: Text("Resim: Seçilmedi"),
                onTap: (){

                },
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
                    hintText: "Konu anlatımı başlığı",
                    hintStyle: TextStyle(
                        fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.picture_as_pdf),
                title: Text("PDF Dosyası"),
                subtitle: Text("Dosya: Seçilmedi"),
                onTap: (){

                },
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