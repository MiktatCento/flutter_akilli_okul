//import 'package:connectivity/connectivity.dart';
import 'package:akilli_okul/ayarlar.dart';
import 'package:akilli_okul/models/uyeler.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:akilli_okul/style/theme.dart' as Theme;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void uyeKont() async {
    var firebaseUser = await _auth.currentUser();
    if (firebaseUser != null) {
      User _user = await User.uyeOlustur();
      print("veri sonunda geldi ${_user.uyeIsim}");
      String uyeYetki = _user.uyeYetki;
      if (uyeYetki == "öğrenci") {
        print("öğrenci girmiş");
        Navigator.of(context).pushReplacementNamed("ogrenciAS");
      } else if (uyeYetki == "öğretmen") {
        print("öğretmen girmiş");
        Navigator.of(context).pushReplacementNamed("ogretmenAS");
      } else if (uyeYetki == "veli") {
        print("veli girmiş");
        Navigator.of(context).pushReplacementNamed("veliAS");
      }
    } else {
      Navigator.of(context).pushReplacementNamed("loginPage");
    }
  }

  bool isOnline = false;
  void intKont() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      isOnline = false;
      AwesomeDialog(
          dismissOnTouchOutside: false,
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          tittle: Ayarlar().uygulamaIsmi,
          desc: "İnternet olmadan bu uygulamayı kullanamazsınız!",
          btnOkText: "Yeniden Dene",
          btnOkOnPress: () {
            intKont();
          },
          btnCancelText: "Çıkış Yap",
          btnCancelOnPress: () {
            SystemNavigator.pop();
          }).show();
      print("int yok");
    } else {
      isOnline = true;
      print("int var");
      uyeKont();
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    setState(() {
      intKont();
    });
    //uyeKont();
  }

  // added test yourself
  // and made the text to align at center
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: "logo",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      width: 150,
                      height: 150,
                      image: AssetImage("assets/images/meblogo.png"),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Image(
                      width: 150,
                      height: 150,
                      image: AssetImage("assets/images/meblogo.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Text(
                "Akıllı Okul",
                style: TextStyle(
                    fontSize: 45,
                    color: Colors.white,
                    fontFamily: "VeganStyle"),
              ),
              SizedBox(height: 25),
              SpinKitRing(
                color: Colors.white,
              )
            ],
          ),
          decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  Theme.Colors.loginGradientEnd,
                  Theme.Colors.loginGradientStart
                ],
                begin: const FractionalOffset(0.2, 0.2),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ));
  }
}
