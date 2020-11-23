import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<Home> {
  int item = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Catalog Item',
            style: TextStyle(fontSize: 18),
          ),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(0, 200, 0, 200),
            child: Column(
              children: <Widget>[
                Center(
                    child: Text(
                  'My Item',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontFamily: 'Pacifico',
                  ),
                )),
                Center(
                    child: Text(
                  '$item',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Pacifico',
                    color: Colors.black54,
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 20.0),
                  child: Center(
                    child: RaisedButton.icon(
                      onPressed: () {
                        setState(() {
                          item = 0;
                        });
                      },
                      color: Colors.red,
                      icon: Icon(Icons.restore, color: Colors.white),
                      label: Text(
                        'Restore Item',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              item++;
            });
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.redAccent,
        ),
      ),
    );
  }
}
