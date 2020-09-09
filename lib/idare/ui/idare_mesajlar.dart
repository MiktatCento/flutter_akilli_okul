import 'package:flutter/material.dart';

class IdareMesajlar extends StatefulWidget {
  @override
  _IdareMesajlarState createState() => _IdareMesajlarState();
}

class _IdareMesajlarState extends State<IdareMesajlar> with AutomaticKeepAliveClientMixin<IdareMesajlar>{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (BuildContext c, int index) {
        index++;
        return Card(
          elevation: 4.5,
          child: ListTile(
            onTap: (){},
            leading: CircleAvatar(
              child: Text(index.toString()),
            ),
            title: Text("Mesaj başlığı $index"),
            subtitle: Text("Mesaj içeriği $index"),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
