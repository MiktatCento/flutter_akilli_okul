import 'package:akilli_okul/ogretmen/ui/fabs/ogretmen_fab_duyurug.dart';
import 'package:akilli_okul/ogretmen/ui/fabs/ogretmen_fab_konug.dart';
import 'package:akilli_okul/ogretmen/ui/fabs/ogretmen_fab_odevg.dart';
import 'package:flutter/material.dart';
import 'package:akilli_okul/style/theme.dart' as Theme;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_popup/mobile_popup.dart';

class OgretmenFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  OgretmenFab({this.onPressed, this.tooltip, this.icon});

  @override
  _OgretmenFabState createState() => _OgretmenFabState();
}

class _OgretmenFabState extends State<OgretmenFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Theme.Colors.loginGradientEnd,
      end: Theme.Colors.loginGradientStart,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget duyuruGonder() {
    return Container(
      child: FloatingActionButton(
        heroTag: "duyuruGonder",
        onPressed: (){
          showMobilePopup(context: context,
          builder: (context){
            return MobilePopUp(
              //appTitle: Ayarlar().uygulamaIsmi,
              title: "Duyuru Gönder",
              showDoneButton: true,
              showFullScreen: false,
              child: OgretmenFabDuyurug(),
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
                      SizedBox(width: 3,),
                      Icon(Icons.send, color: Colors.white,),
                    ],
                  ),
                  onPressed: () {},
                )
              ],
            );
          });
        },
        tooltip: 'Duyuru Gönder',
        child: Icon(FontAwesomeIcons.exclamationCircle),
      ),
    );
  }

  Widget konuGonder() {
    return Container(
      child: FloatingActionButton(
        heroTag: "konuGonder",
        onPressed: (){
          showMobilePopup(context: context,
              builder: (context){
                return MobilePopUp(
                  //appTitle: Ayarlar().uygulamaIsmi,
                  title: "Konu Anlatımı Gönder",
                  showDoneButton: true,
                  showFullScreen: false,
                  child: OgretmenFabKonug(),
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
                          SizedBox(width: 3,),
                          Icon(Icons.send, color: Colors.white,),
                        ],
                      ),
                      onPressed: () {},
                    )
                  ],
                );
              });
        },
        tooltip: 'Konu Gönder',
        child: Icon(Icons.subject),
      ),
    );
  }

  Widget odevGonder() {
    return Container(
      child: FloatingActionButton(
        heroTag: "odevGonder",
        onPressed: (){
          showMobilePopup(context: context,
              builder: (context){
                return MobilePopUp(
                  //appTitle: Ayarlar().uygulamaIsmi,
                  title: "Ödev Gönder",
                  showDoneButton: true,
                  showFullScreen: false,
                  child: OgretmenFabOdevg(),
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
                          SizedBox(width: 3,),
                          Icon(Icons.send, color: Colors.white,),
                        ],
                      ),
                      onPressed: () {},
                    )
                  ],
                );
              });
        },
        tooltip: 'Ödev Gönder',
        child: Icon(FontAwesomeIcons.tasks),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        heroTag: "mainfab",
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Öğrenci İşleri',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 3.0,
            0.0,
          ),
          child: odevGonder(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: konuGonder(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: duyuruGonder(),
        ),
        toggle(),
      ],
    );
  }
}