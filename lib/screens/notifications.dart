import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreen createState() => _NotificationsScreen( );
}
class _NotificationsScreen extends State<NotificationsScreen> {

 final notifications = [{'titulo': "Este conteúdo pode te interessar", 'url': 3000.0}];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificações'),
      ),
      body: Container(
        child: Column(children: <Widget>[ 
          Expanded(child: ListView.builder(itemCount: notifications.length, itemBuilder: (context, index){
            double c_width = MediaQuery.of(context).size.width * 0.5;
            return Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              height: 220,
              width: double.maxFinite,
              child: Card(elevation: 5,
                          child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(child: Image.asset('images/strips.jpg')),
                              Container(child: Center( child: Text(
                                notifications[index]['titulo'],
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, 
                                        color: Colors.black),
                                softWrap: true,
                                textAlign: TextAlign.right,
                                ),
                              ),
                              width: c_width,)
                            ])
              ));
          }))],)
         // This trailing comma makes auto-formatting nicer for build methods.
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}