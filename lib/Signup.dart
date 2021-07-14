import 'Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:email_validator/email_validator.dart';
import 'Store.dart';

class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignupState();
}

class SignupState extends State<Signup> {
  TextEditingController _name = TextEditingController();
  TextEditingController _confirm_password = TextEditingController();
  TextEditingController _create_password = TextEditingController();
  TextEditingController _email = TextEditingController();
  String errormessage = "";
  bool isvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
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
              //error log
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
                padding: EdgeInsets.only(top: 20, left: 6, right: 6),
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      isvisible = false;
                    });
                  },
                  controller: _name,
                  maxLines: null,
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.green,
                      ),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      labelText: "First Name"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 6, top: 10, right: 6),
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      isvisible = false;
                    });
                  },
                  controller: _email,
                  maxLines: null,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.green,
                      ),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      labelText: "Email Address"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 6, top: 10, right: 6),
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      isvisible = false;
                    });
                  },
                  controller: _create_password,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.green,
                      ),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      labelText: "Create Password"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 6, top: 10, right: 6),
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      isvisible = false;
                    });
                  },
                  controller: _confirm_password,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.green,
                      ),
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                      ),
                      labelText: "Confirm Password"),
                ),
              ),
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
                        child: Text("Sign up"),
                        onPressed: () {
                          setState(() {
                            if (_confirm_password.text !=
                                _create_password.text) {
                              errormessage = "Enter Password Correctly";
                              isvisible = true;
                            } else if (!EmailValidator.validate(_email.text)) {
                              errormessage = "Type Correct Email address";
                              isvisible = true;
                            } else {
                              Store.signupsave(_name.text, _email.text,
                                  _confirm_password.text);

                              _name.clear();
                              _confirm_password.clear();
                              _create_password.clear();
                              _email.clear();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Login()));
                            }
                          });
                        }))
              ]),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: Colors.blue),
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
