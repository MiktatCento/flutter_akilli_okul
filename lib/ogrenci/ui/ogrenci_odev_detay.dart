import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';

class OgrenciOdevDetay extends StatefulWidget {
  final int id;
  final String postTuru;
  final String odevBaslik;
  final String fotograf;

  OgrenciOdevDetay({
    @required this.id,
    @required this.postTuru,
    @required this.fotograf,
    @required this.odevBaslik,
  });

  @override
  _OgrenciOdevDetayState createState() => _OgrenciOdevDetayState();
}

class _OgrenciOdevDetayState extends State<OgrenciOdevDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(widget.odevBaslik,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Hero(
                    tag: "${widget.postTuru}Resim${widget.id}",
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.black12, Colors.black87],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                          ),
                          child: TransitionToImage(
                            width: double.infinity,
                            fit: BoxFit.cover,
                            loadingWidget: Stack(
                              children: <Widget>[
                                Image.asset(
                                  'assets/404.png',
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: 16,
                                  right: 16,
                                  child: CupertinoActivityIndicator(),
                                ),
                              ],
                            ),
                            image: AdvancedNetworkImage(
                              widget.fotograf,
                              fallbackAssetImage: 'assets/404.png',
                              timeoutDuration: Duration(minutes: 1),
                              cacheRule: CacheRule(maxAge: Duration(days: 3)),
                              useDiskCache: true,
                            ),
                            // This is the default placeholder widget at loading status,
                            // you can write your own widget with CustomPainter.
                            placeholder: Image.asset(
                              'assets/404.png',
                              scale: 1.0,
                              fit: BoxFit.cover,
                            ),
                            // This is default duration
                            duration: Duration(milliseconds: 300),
                          ),
                        ),
                        Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.grey.withOpacity(0.2),
                                Colors.black.withOpacity(0.6),
                              ],
                              stops: [0.0, 0.59595],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
        ];
      },
      body: Center(
        child: Text("${widget.postTuru} içeriği"),
      ),
    ));
  }
}
