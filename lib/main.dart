import 'package:flutter/material.dart';
import 'add_category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
      home: MyHomePage(title: 'Admin Panel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              child: FlatButton(
                child: Text(
                  "Kategori Ekle",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.orange,
                onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (AddCategory())),
                );},
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: FlatButton(
                child: Text("Ürün Ekle", style: TextStyle(color: Colors.white)),
                color: Colors.orange,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
