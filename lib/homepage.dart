import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';
import 'cart.dart';
import 'order.dart';

class homepage extends StatelessWidget {
  Future<List> set() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();

    List list = _preferences.getStringList(_preferences.getString("current"));
    list.add(_preferences.getString("current"));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Homepage"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 50,
                  child: Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: new TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: new InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "Search for medicine",
                            fillColor: Colors.white70),
                      ))),
              Container(
                width: double.infinity,
                child: Image.asset("assets/1.jpg"),
              ),
              Card(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                    Column(children: [
                      new InkWell(
                        child: Image.asset(
                          "assets/medicine.png",
                          width: 100,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => order()));
                        },
                      ),
                      Text("Order Medicines"),
                    ]),
                    Column(
                      children: [
                        new InkWell(
                          child: Image.asset(
                            "assets/orders.png",
                            width: 100,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => cart()));
                          },
                        ),
                        Text("My Orders")
                      ],
                    )
                  ])),
              Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: Image.asset(
                      "assets/refer.jpg",
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ))
            ],
          ),
        ),
        drawer: Drawer(
            child: Container(
          color: Colors.white,
          child: FutureBuilder(
              future: set(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  print(snapshot.data);
                  return Column(children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      color: Colors.green,
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30, bottom: 10),
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("assets/man.png"),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Text(
                              snapshot.data[1],
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              snapshot.data[2],
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Profile"),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text("Settings"),
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("Logout"),
                      onTap: () async {
                        SharedPreferences _preferences =
                            await SharedPreferences.getInstance();
                        _preferences.setBool("login", false);
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Login()));
                      },
                    ),
                  ]);
                } else {
                  return CircularProgressIndicator();
                }
              }),
        )));
  }
}
