import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreen createState() => _ProfileScreen( );
}
class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Container(
        child: Column(children: <Widget>[ 
          Row(children :[
            Expanded(child: Image.asset('images/nataly.png')),
            Container(child: Center( child: Text(
              'Nataly',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, 
                      color: Colors.black),
              softWrap: true,
              textAlign: TextAlign.right,
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.5,)
           ] ),
          Row(children: [Center( child: Padding(padding:EdgeInsets.fromLTRB(10, 50, 10, 50), 
            child: Text("Medalhas", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))))]),
          Row( children: [
            Expanded(child: Icon(Icons.camera_rounded, size: 30,)), 
            Expanded(child: Icon(Icons.trending_up_rounded, size: 30,)),
            ],
            ),
          // Row(children: [Center(child:Text("Objetivos", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))]),
          // Row(children: [
          //   ListTile(
          //     leading: Icon(Icons.check_box_outline_blank),
          //     title: Text('Empreendimento'),
          //     onTap: () => {},
          //   ),
          //   ListTile(
          //     leading: Icon(Icons.check_box_outlined),
          //     title: Text('Renda extra'),
          //     onTap: () => {},
          //   ),
          //   ListTile(
          //     leading: Icon(Icons.check_box_outline_blank),
          //     title: Text('Quitar dívidas'),
          //     onTap: () => {},
          //   ),
          //   ListTile(
          //     leading: Icon(Icons.check_box_outlined),
          //     title: Text('Investimentos'),
          //     onTap: () => {},
          //   ),
          //   ListTile(
          //     leading: Icon(Icons.check_box_outline_blank),
          //     title: Text('Economizar'),
          //     onTap: () => {},
          //   ),
          // ],)
         // This trailing comma makes auto-formatting nicer for build methods.
        ]),// This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}