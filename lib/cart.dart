import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class cart extends StatefulWidget {
  State<StatefulWidget> createState() => cartState();
}

class cartState extends State<cart> {
  int cartnumber = 0;
  final List<String> imageList = [
    "assets/arinac.jpeg",
    "assets/augmentin.jpeg",
    "assets/brufen.jpg",
    "assets/disprin.jpg",
    "assets/folic.jpg",
  ];
  String email;
  @override
  Widget build(BuildContext context) {
    Future<Map<String, dynamic>> fetchData() async {
      SharedPreferences _preferences = await SharedPreferences.getInstance();
      email = _preferences.getString("current");

      var reference =
          await FirebaseFirestore.instance.collection("purchase").get();
      for (int i = 0; i < reference.docs.length; i++) {
        if (reference.docs[i].data()[email] != null)
          return reference.docs[i].data();
      }

      return null;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("My Cart(" + cartnumber.toString() + ")"),
          backgroundColor: Colors.green,
        ),
        body: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("comes" + snapshot.data.toString());
                return SingleChildScrollView(
                    child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Container(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          autoPlay: true,
                        ),
                        items: imageList
                            .map((e) => ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Image.asset(e,
                                          width: 100,
                                          height: 200,
                                          fit: BoxFit.cover)
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    Container(
                      height: 120,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              snapshot.data[email][2].toString(),
                              width: 160,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    snapshot.data[email][0].toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Row(children: [
                                    Text(
                                      snapshot.data[email][1].toString(),
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.red),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          --cartnumber;
                                          if (cartnumber < 0) cartnumber = 0;
                                        });
                                      },
                                      child: Text("\u2212",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25)),
                                    ),
                                    Text(
                                      cartnumber.toString(),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            ++cartnumber;
                                          });
                                        })
                                  ])
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                    Row(children: [
                      Container(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: "Enter voucher code"),
                          )),
                      TextButton(onPressed: () {}, child: Text("APPLY VOUCHER"))
                    ])
                  ],
                ));
              } else if (snapshot.hasError) {
                return Text("Problem in Firebase");
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  semanticsLabel: "Firebase reterival",
                ));
              }
            }),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Rs. 1490",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
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
                  child: Text("Check Out")),
            ],
          ),
        ));
  }
}
