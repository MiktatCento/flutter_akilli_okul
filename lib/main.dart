import 'package:akilli_okul/login/loginpage.dart';
import 'package:akilli_okul/ogrenci/ui/ogrenci_drawer.dart';
import 'package:akilli_okul/ogretmen/ui/ogretmen_drawer.dart';
import 'package:akilli_okul/splash.dart';
import 'package:akilli_okul/veli/ui/veli_drawer.dart';
import 'package:flutter/material.dart';
import 'style/theme.dart' as Theme;

void main() {
  print("Yaaa ALLAH BİSMİLLAH");
  runApp(MainPage());
}


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: Ayarlar().uygulamaIsmi,
      theme: ThemeData(
        primaryColor: Theme.Colors.loginGradientEnd,
        accentColor: Theme.Colors.loginGradientStart
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        "loginPage": (context) => LoginPage(),
        "veliAS": (context) => VeliDrawer(),
        "ogrenciAS": (context) => OgrenciDrawer(),
        "ogretmenAS": (context) => OgretmenDrawer()
      },
    );
  }
}
