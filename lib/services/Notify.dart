import 'package:flutter/material.dart';

class notify extends StatefulWidget {
  notify({Key key}) : super(key: key);

  @override
  _notifyState createState() => _notifyState();
}

class _notifyState extends State<notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 40),
              title: Text('Gautam'),
              subtitle: Text('Surat to Bardoli'),
              trailing: Icon(Icons.notification_important),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 40),
              title: Text('Mehul'),
              subtitle: Text('Surat To Navsari'),
              trailing: Icon(Icons.notification_important),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 40),
              title: Text('Jigar'),
              subtitle: Text('Mandvi To Bardoli'),
              trailing: Icon(Icons.notification_important),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 40),
              title: Text('Thiren'),
              subtitle: Text('Bardoli To Surat '),
              trailing: Icon(Icons.notification_important),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 40,
              ),
              title: Text('MK'),
              subtitle: Text('Surat To Rajkot'),
              trailing: Icon(Icons.notification_important),
            ),
          ),
        ],
      ),
    );
  }
}
