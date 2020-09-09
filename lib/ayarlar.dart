import 'package:flutter/services.dart';

class Ayarlar{
  String uygulamaIsmi = "Akıllı Okul";

  void klavyeKapat(){
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}