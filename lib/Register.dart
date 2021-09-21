import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'loginPage.dart';
import 'package:flutter/src/painting/image_provider.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var _formkey = GlobalKey<FormState>();
  bool _validat = true;
  bool _validate = true;
  bool _fn = false;
  bool _ln = false;
  bool _mn = false;
  bool _e = false;
  bool _fp = false;
  bool _sp = false;

  /* void _submit(){
    final isValid=_formkey.currentState.validate();
    if(!isValid) {
      return;
    }
    else {
      _formkey.currentState.save();
    }
  }*/
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phno = TextEditingController();
  TextEditingController cpass = TextEditingController();
  TextEditingController conpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // home: Padding(padding: EdgeInsets.all(20),child: SizedBox(height: 160,child: Image.asset(logo.png),),),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Form(
                key: _formkey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/1.png",
                        width: 700,
                        height: 80,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()));
                          },
                          child: Text('Register')),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text('Login')),
                      /*Container(padding: EdgeInsets.all(10),child:*/
                      TextFormField(
                        controller: fname,
                        inputFormatters: [
                          new WhitelistingTextInputFormatter(
                              new RegExp(r'^[a-z A-Z]*$')),
                          LengthLimitingTextInputFormatter(20)
                        ],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'First Name',
                            errorText: _fn ? "please enter valid name" : null),
                        keyboardType: TextInputType.name,
                        onFieldSubmitted: (validate) {},

                        /* validator: (value) {
              if (value.isNotEmpty || !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                return "please enter value name";
              } else {
                return null;
              }
            },*/
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      /*Container(padding: EdgeInsets.all(10),child:*/
                      TextFormField(
                        controller: lname,
                        inputFormatters: [
                          new WhitelistingTextInputFormatter(
                              new RegExp(r'^[a-z A-Z]*$')),
                          LengthLimitingTextInputFormatter(20)
                        ],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Last Name',
                            errorText: _ln ? "please enter valid name" : null),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      /* Container(padding: EdgeInsets.all(10),child:*/
                      TextFormField(
                        controller: phno,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Mobile Number',
                            errorText: _mn
                                ? "please enter valid mobile number"
                                : null),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          new WhitelistingTextInputFormatter(
                              new RegExp(r'^[0-9]*$')),
                          LengthLimitingTextInputFormatter(10)
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      /*Container(padding: EdgeInsets.all(10),child:*/
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Email',
                            errorText:
                                _e ? "please enter valid mail id" : null),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      /*Container(padding: EdgeInsets.all(10),child:*/
                      TextFormField(
                        controller: cpass,
                        inputFormatters: [LengthLimitingTextInputFormatter(15)],
                        obscureText: _validate,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _validate = !_validate;
                                });
                              },
                              child: Icon(_validate
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            hintText: 'Create Password',
                            errorText:
                                _fp ? "password should not empty" : null),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      /*Container(padding: EdgeInsets.all(10), child:*/
                      TextFormField(
                        controller: conpass,
                        inputFormatters: [LengthLimitingTextInputFormatter(15)],
                        obscureText: _validat,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _validat = !_validat;
                                });
                              },
                              child: Icon(_validat
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            hintText: 'Confirm Password',
                            errorText:
                                _sp ? "password should not empty" : null),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      /* Container(
            child:*/
                      RaisedButton(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          color: Colors.orange,
                          onPressed: () {
                            if (fname.text.isEmpty) {
                              print("fname error");
                              setState(() {
                                _fn = true;
                              });
                            } else {
                              _fn = false;
                              print("success fname");
                              if (lname.text.isEmpty) {
                                print("sname error");
                                setState(() {
                                  _ln = true;
                                });
                              } else {
                                _ln = false;
                                print("success");
                                if (phno.text.isEmpty) {
                                  print("mobile no success");
                                  setState(() {
                                    _mn = true;
                                  });
                                } else {
                                  _mn = false;
                                  print("mn success");
                                  if (email.text.isEmpty|| !email.text.contains('@') || !email.text.endsWith('.com')) {
                                    setState(() {
                                      print("wrong mail");
                                      _e = true;
                                    });
                                  } else {
                                    _e = false;
                                    print("mail succ");
                                    if (cpass.text.isEmpty) {
                                      setState(() {
                                        print("cpass empt");
                                        _fp = true;
                                      });
                                    } else {
                                      _fp = false;

                                      print("cpass");
                                      if (conpass.text.isEmpty) {
                                        setState(() {
                                          print("con pass empt");
                                          _sp = true;
                                        });
                                      } else {
                                        _sp = false;
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                          )
                    ])
            )
        )
    );
  }
}
