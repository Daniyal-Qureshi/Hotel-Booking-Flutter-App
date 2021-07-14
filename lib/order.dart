import 'package:attendance/purchase.dart';
import 'package:flutter/material.dart';

class order extends StatefulWidget {
  @override
  orderState createState() => orderState();
}

class orderState extends State<order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hello")),
      body: Column(children: [
        Row(children: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => purchase(
                              name: "Arinac 200 mg (Zafa)",
                              path: "assets/arinac.jpeg",
                              price: "300",
                            )));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/arinac.jpeg",
                            width: double.infinity,
                          ),
                          Text(
                            "Arinac 200 mg (Zafa)",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Rs.  300",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          Text(
                            "Pakistan",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ))),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => purchase(
                              name: "Rigix 200 mg (Abbot)",
                              path: "assets/rigix.jpg",
                              price: "400",
                            )));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/rigix.jpg",
                            width: double.infinity,
                          ),
                          Text(
                            "Rigix 200 mg (Abbot)",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Rs.  400",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          Text(
                            "Pakistan",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ))),
        ]),
        Row(children: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => purchase(
                              name: "Augmentin 375 mg (gsk)",
                              path: "assets/augmentin.jpeg",
                              price: "600",
                            )));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            "assets/augmentin.jpeg",
                            height: 90,
                          ),
                          Flexible(
                              child: Text(
                            "Augmentin 375 mg (gsk)",
                            style: TextStyle(fontSize: 15),
                          )),
                          Text(
                            "Rs.  600",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          Text(
                            "Pakistan",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ))),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => purchase(
                              name: "Brufen 400 mg",
                              path: "assets/brufen.jpg",
                              price: "200",
                            )));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            "assets/brufen.jpg",
                            height: 110,
                          ),
                          Text(
                            "Brufen 400 mg",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Rs.  200",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          Text(
                            "Pakistan",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ))),
        ]),
        Row(children: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => purchase(
                              name: "Disprin Original CCL Pharma",
                              path: "assets/disprin.jpg",
                              price: "300",
                            )));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            "assets/disprin.jpg",
                            height: 90,
                          ),
                          Flexible(
                              child: Text(
                            "Disprin Original CCL Pharma",
                            style: TextStyle(fontSize: 15),
                          )),
                          Text(
                            "Rs.  300",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          Text(
                            "Pakistan",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ))),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => purchase(
                              name: "Folic Acid ",
                              path: "assets/folic.jpg",
                              price: "240",
                            )));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            "assets/folic.jpg",
                            height: 110,
                          ),
                          Text(
                            "Folic Acid ",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Rs.  240",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          Text(
                            "Pakistan",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ))),
        ]),
      ]),
    );
  }
}
