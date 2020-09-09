import 'package:flutter/material.dart';

class VeliMesajlar extends StatefulWidget {
  @override
  _VeliMesajlarState createState() => _VeliMesajlarState();
}

class _VeliMesajlarState extends State<VeliMesajlar> with AutomaticKeepAliveClientMixin<VeliMesajlar>{
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
