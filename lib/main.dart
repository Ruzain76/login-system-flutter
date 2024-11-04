import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyApp> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
      padding: EdgeInsets.all(60.0),
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [
            0.1,
            0.4,
            0.7,
            0.9
          ],
              colors: [
            Colors.purple[800]!,
            Colors.purple[600]!,
            Colors.purple[400]!,
            Colors.purple[200]!,
          ])),
      child: Center(
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            Image.asset(
              "assets/main_logo.png",
              height: 150.0,
            ),
            SizedBox(
              height: 50.0,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter the username";
                        }
                      },
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.account_circle,
                            color: Colors.white70,
                          ),
                          hintText: "User Name",
                          hintStyle: TextStyle(color: Colors.white30)),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter the password!";
                        }
                      },
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Colors.white70,
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white30)),
                    ),
                  ],
                )),
            SizedBox(
              height: 50.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Form validated sucessfully")));
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => FirstPage()));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Error in form!")));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white10, // Background color (red)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 120, vertical: 15), // Button padding
              ),
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Forget Password?",
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/google_icon.png",
                  height: 30.0,
                ),
                Image.asset(
                  "assets/facebook_icon.png",
                  color: Colors.white,
                  height: 50.0,
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome"),
      ),
    );
  }
}
