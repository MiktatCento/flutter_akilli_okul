import 'package:akilli_okul/ogrenci/ui/ogrenci_drawer.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:akilli_okul/style/theme.dart' as tTheme;

class OgrenciSinavSo extends StatefulWidget {
  @override
  _OgrenciSinavSoState createState() => _OgrenciSinavSoState();
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = new charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class _OgrenciSinavSoState extends State<OgrenciSinavSo> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = [
      new ClicksPerYear('Sayısal', 12, Colors.red),
      new ClicksPerYear('Sözel', 42, Colors.yellow),
      new ClicksPerYear('Dil', _counter, Colors.green),
    ];

    var series = [
      new charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );
    var chartWidget = new Padding(
      padding: new EdgeInsets.all(32.0),
      child: new SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Sınav Sonuçları"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            OgrenciDrawer().innerKeyAc();
          },
        ),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            chartWidget,
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Arttır',
        child: new Icon(Icons.add),
        backgroundColor: tTheme.Colors.loginGradientEnd,
      ),
    );
  }
}
