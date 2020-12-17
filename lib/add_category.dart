import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final databaseReference = Firestore.instance;

class AddCategory extends StatefulWidget {
  AddCategory({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final CategoryNameController = TextEditingController();

  void addCategory() async {
    var documentx = await databaseReference
        .collection("categories");

//    DocumentSnapshot documentSnapshot = await databaseReference
//        .collection("tables")
//        .document(table_)
//        .collection("basket")
//        .document(product_id.toString())
//        .get();
//
//    await databaseReference
//        .collection("tables")
//        .document(table_)
//        .collection("basket")
//        .document(product_id.toString())
//        .setData({
//      "name": product_name,
//      'count': count,
//      "product_id": product_id,
//      "price": price
//    });
//    if (count == 0) {
//      await databaseReference
//          .collection("tables")
//          .document(table_)
//          .collection("basket")
//          .document(product_id.toString())
//          .delete();
//    }

    List<int>id_sorting=new List<int>();
    id_sorting.clear();

    documentx.orderBy("categoryid", descending: true).limit(1).getDocuments().then((querySnapshot) =>
        querySnapshot.documents.forEach((element) {
          int id=0;
          id= element.data["categoryid"];
          print(id.toString());
          id_sorting[0]=id;



        })

    );


      documentx.orderBy("sorting", descending: true).limit(1).getDocuments().then((querySnapshot) =>
         querySnapshot.documents.forEach((element) {
           int sorting=0;
           sorting= element.data["sorting"];
           print(sorting.toString());
           id_sorting[1]=sorting;

         })

      );

      print("id: "+id_sorting[0].toString()+"sorting: "+id_sorting[1].toString());


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategori Ekle"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              child: TextField(
                controller: CategoryNameController,
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: FlatButton(
                child: Text(
                  "Kategori Ekle",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.orange,
                onPressed: () {addCategory();},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
