import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'Store.dart';

class purchase extends StatelessWidget {
  String email, name, path, price;
  purchase({Key key, @required this.name, this.path, this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("place"),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            child: Image.asset(path),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Rs. " + price,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: ''),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              name,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Delivery",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Row(children: [
                Text("Sindh,Karach-Gulshan-e-Iqbal",
                    style: TextStyle(color: Colors.red)),
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 20,
                )
              ]),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 135, top: 5, bottom: 10),
            child: Text("Express Delivery,1 days Rs.50"),
          ),
          Divider(
            color: Colors.grey,
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Service",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text("7 days Returns")),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(left: 135, bottom: 10),
              child: Text(
                "Change of  mind is not applicable",
                style: TextStyle(color: Colors.grey),
              )),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.storefront,
              color: Colors.red,
              size: 40,
            ),
            Text(
              "|",
              style: TextStyle(fontSize: 40, color: Colors.grey),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Icon(
              Icons.message,
              color: Colors.red,
              size: 40,
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            ElevatedButton(
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.SCALE,
                    dialogType: DialogType.SUCCES,
                    body: Center(
                      child: Text(
                        'Your shipping will be delivered soon',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    btnOkOnPress: () {
                      Navigator.pop(context);
                    },
                  )..show();
                },
                child: Text("Buy Now")),
            Padding(padding: EdgeInsets.only(left: 10)),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () async {
                  SharedPreferences _preferences =
                      await SharedPreferences.getInstance();

                  CollectionReference reference =
                      FirebaseFirestore.instance.collection('purchase');
                  reference.add({
                    _preferences.getString("current"): [name, price, path]
                  });

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Added to cart successfully"),
                  ));
                },
                child: Text("Add to Cart")),
          ],
        ),
      ),
    );
  }
}
