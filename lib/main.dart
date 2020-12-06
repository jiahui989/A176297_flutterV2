// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'catalogitem.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<Home> {
  int item = 0;
  List<CatalogItem> catalogItems = [
    CatalogItem(
        itemName: 'BackPack',
        itemPrice: '12.00',
        itemImage: 'image_backpack.png',
        itemDescription: 'Leather'),
    CatalogItem(
        itemName: 'T-Shirt',
        itemPrice: '10.00',
        itemImage: 'image_tshirt.png',
        itemDescription: 'Cotton'),
    CatalogItem(
        itemName: 'Cap',
        itemPrice: '30.00',
        itemImage: 'image_cap.png',
        itemDescription: 'Black'),
  ];
  Widget catalogItemCard(catalogItem) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/' + catalogItem.itemImage),
                    width: 150,
                    height: 150,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      catalogItem.itemName,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(catalogItem.itemDescription),
                    Text(
                      'RM' + catalogItem.itemPrice,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                    RaisedButton.icon(
                      onPressed: () {
                        setState(() {
                          item++;
                        });
                      },
                      color: Colors.red,
                      icon: Icon(Icons.add, color: Colors.white),
                      label: Text(
                        'Add Item',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text(
              'Catalog Item',
              style: TextStyle(fontSize: 18),
            ),
            centerTitle: true,
            backgroundColor: Colors.redAccent,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                child: Badge(
                  position: BadgePosition.topEnd(top: 0, end: 3),
                  badgeContent: Text(
                    item.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.shopping_basket),
                    onPressed: () {
                      setState(() {
                        item = 0;
                      });
                    },
                  ),
                ),
              )
            ]),
        body: Column(
          children: catalogItems
              .map((catalogItem) => catalogItemCard(catalogItem))
              .toList(),
        ),
        // body: Padding(
        //     padding: EdgeInsets.fromLTRB(0, 200, 0, 200),
        //     child: Column(
        //       children: <Widget>[
        //         Center(
        //             child: Text(
        //           'My Item',
        //           style: TextStyle(
        //             fontSize: 25,
        //             color: Colors.black,
        //             fontFamily: 'Pacifico',
        //           ),
        //         )),
        //         Center(
        //             child: Text(
        //           '$item',
        //           style: TextStyle(
        //             fontSize: 30,
        //             fontFamily: 'Pacifico',
        //             color: Colors.black54,
        //           ),
        //         )),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(
        //               horizontal: 0.0, vertical: 20.0),
        //           child: Center(
        //             child: RaisedButton.icon(
        //               onPressed: () {
        //                 setState(() {
        //                   item = 0;
        //                 });
        //               },
        //               color: Colors.red,
        //               icon: Icon(Icons.restore, color: Colors.white),
        //               label: Text(
        //                 'Restore Item',
        //                 style: TextStyle(color: Colors.white),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     )),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     setState(() {
        //       item++;
        //     });
        //   },
        //   child: Icon(Icons.add),
        //   backgroundColor: Colors.redAccent,
        // ),
      ),
    );
  }
}
