import 'package:flutter/material.dart';

// As login page has to handle user input, it has to be stateful
class Signin extends StatefulWidget {
  // Callback function that will be called on pressing the login button
  final onSignin;

  Signin({@required this.onSignin});

  @override
  State<StatefulWidget> createState() {
    return SigninState();
  }
}

class SigninState extends State<Signin> {
  // Controllers for handling email and password
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void onSignin() {
    widget.onSignin(emailController.text, passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
            child: SizedBox(
          width: 600,
          child: Card(
            child: Form(
                child: Padding(
                    padding: EdgeInsets.all(16),
                    // Align widgets in a vertical column
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // Passing multiple widgets as children to Column
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: Text(
                              'Company Name',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32),
                            )),
                        Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email'),
                            )),
                        Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password'),
                            )),
                        Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: CheckboxListTile(
                            title: Text("Remember Me"),
                            value: true,
                            onChanged: (newValue) {
                              // setState(() {
                              //   checkedValue = newValue;
                              // });
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
                        ),
                        RaisedButton(
                          // Calling the callback with the supplied email and password
                          onPressed: () => this.onSignin(),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text('SIGNIN'),
                          ),
                          // Setting the primary color on the button
                          color: Colors.blue[800],
                          textColor: Colors.white,
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ))),
          ),
        )));
  }
}
