import 'package:flutter/material.dart';
import 'Register.dart';
import 'Dashport.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  bool _validate = false;
  bool _validat = false;

  @override
  // void dispose() {Email.dispose();super.dispose();}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.orange,

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/1.png",
                width: 700,
                height: 80,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  child: Text('Register')),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text('Login')),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: Email,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Your Email',
                      errorText:
                          _validate ? 'Please Enter Valid Email ID' : null),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: Password,
                  obscureText: _validat,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _validat = !_validat;
                        });
                      },
                      child: Icon(
                          _validat ? Icons.visibility : Icons.visibility_off),
                    ),
                    hintText: 'Password',
                  ),
                ),
              ),
              Container(
                child: FlatButton(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Forget Password',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    onPressed: () {}),
              ),
              Container(
                child: RaisedButton(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    color: Colors.orange,
                    onPressed: () {
                      print(".................." + Email.text);
                      if (Email.text.isEmpty ||
                          !Email.text.contains("@") ||
                          !Email.text.endsWith(".com")) {
                        print("enter valid email..................");
                        setState(() {
                          _validate = true;
                        });
                      } else {
                        print("success..................");
                        setState(() {
                          _validate = false;
                        }
                        );
                        if (_validat = false) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (
                                  BuildContext context) => Home()));
                        }
                      }
                    }

                    )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
