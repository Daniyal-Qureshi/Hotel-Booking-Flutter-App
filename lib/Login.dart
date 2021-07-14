import 'package:flutter/material.dart';
import 'Store.dart';
import 'homepage.dart';
import 'Signup.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Loginstate();
}

class Loginstate extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isvisible = false;
  String errormessage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.green,
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 200,
                    child: Image.asset("assets/logo.png"),
                  )),
              Visibility(
                  visible: isvisible,
                  child: Padding(
                    padding: EdgeInsets.only(left: 6, right: 6),
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        color: Color(int.parse("0xff${"f4c2c2"}")),
                        child: Align(
                          child: Text(errormessage,
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.red)),
                        )),
                  )),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: TextField(
                  controller: _email,
                  onChanged: (text) {
                    setState(() {
                      isvisible = false;
                    });
                  },
                  maxLines: null,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.green,
                      ),
                      labelText: "Email"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: TextField(
                  controller: _password,
                  onChanged: (text) {
                    setState(() {
                      isvisible = false;
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.green,
                      ),
                      labelText: "Password"),
                ),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    width: 200,
                    margin: EdgeInsets.only(top: 5),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        child: Text("Sign in"),
                        onPressed: () {
                          Store.getData(_email.text, _password.text);
                          Store.status().then((value) {
                            if (!value)
                              setState(() {
                                errormessage = "Incorrect Email or Password";
                                isvisible = true;
                              });
                            else {
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          homepage()));
                            }
                          });
                        }))
              ]),
              Padding(padding: EdgeInsets.only(top: 5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have account ? create one",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.green),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
