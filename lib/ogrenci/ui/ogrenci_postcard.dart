//import 'package:blogapp/pages/single_page.dart';
import 'package:akilli_okul/ogrenci/ui/ogrenci_konu_detay.dart';
import 'package:akilli_okul/ogrenci/ui/ogrenci_odev_detay.dart';
import 'package:flutter/material.dart';
//import 'package:blogapp/global.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:flutter/cupertino.dart';

class PostCard extends StatefulWidget {
  final String postTuru;
  final String imageUrl;
  final String title;
  final String category;
  final String date;
  final int categoryID;
  final int views;
  final int id;

  const PostCard(
      {Key key,
      @required this.postTuru,
      @required this.imageUrl,
      @required this.title,
      @required this.category,
      @required this.views,
      @required this.categoryID,
      @required this.date,
      @required this.id})
      : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool image = false;

  @override
  void initState() {
    super.initState();
    image = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (widget.postTuru == "ödev") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OgrenciOdevDetay(
                  id: widget.id,
                  postTuru: widget.postTuru,
                  odevBaslik: widget.title,
                  fotograf: widget.imageUrl,
                ),
              ),
            );
          } else if (widget.postTuru == "konu") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OgrenciKonuDetay(
                  id: widget.id,
                  postTuru: widget.postTuru,
                  konuBaslik: widget.title,
                  fotograf: widget.imageUrl,
                ),
              ),
            );
          }
        },
        child: Hero(
            tag: "${widget.postTuru}Resim${widget.id}",
            child: Container(
              padding: EdgeInsets.only(top: 10, right: 10, left: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 190,
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
                                widget.imageUrl,
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
                            height: 190.0,
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
                          Positioned(
                            left: 8,
                            right: 8,
                            bottom: 0,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      '${this.widget.title}',
                                      maxLines: 3,
                                      textScaleFactor: 1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 8, bottom: 8),
                                          height: 24,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          padding: EdgeInsets.only(
                                              bottom: 2,
                                              top: 2,
                                              right: 4,
                                              left: 4),
                                          child: Center(
                                            child: Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.format_list_bulleted,
                                                  size: 14,
                                                ),
                                                Text(
                                                  ' ${widget.category}',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Lato'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.remove_red_eye,
                                              color: Colors.white,
                                              size: 14,
                                            ),
                                            Center(
                                                child: Text(
                                              ' ${this.widget.views ?? 0}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ))
                                          ],
                                        ),
                                        Text(
                                          '${this.widget.date}',
                                          textScaleFactor: 1,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
