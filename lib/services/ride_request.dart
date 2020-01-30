import 'package:flutter/material.dart';
import 'package:mobilyft/services/request_page.dart';

class ride_request extends StatefulWidget {
  ride_request({Key key}) : super(key: key);

  @override
  _ride_requestState createState() => _ride_requestState();
}

class _ride_requestState extends State<ride_request> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
                leading: Icon(Icons.account_circle, size: 40),
                title: Text('Raj'),
                subtitle: Text('Surat'),
                trailing: Icon(Icons.delete),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => request_page()));
                }),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 40),
              title: Text('Mehul'),
              subtitle: Text('Surat'),
              trailing: Icon(Icons.delete),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 40),
              title: Text('Jigar'),
              subtitle: Text('Mandvi'),
              trailing: Icon(Icons.delete),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 40),
              title: Text('Thiren'),
              subtitle: Text('Bardoli '),
              trailing: Icon(Icons.delete),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 40),
              title: Text('MK'),
              subtitle: Text('Surat'),
              trailing: Icon(Icons.delete),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 40),
              title: Text('SK'),
              subtitle: Text('Surat'),
              trailing: Icon(Icons.delete),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 40),
              title: Text('Gautam'),
              subtitle: Text('Surat'),
              trailing: IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {},
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 40),
              title: Text('DP'),
              subtitle: Text('Surat '),
            ),
          ),
        ],
      ),
    );
  }
}
