import 'package:daily_recipe/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //FormController _formController;
  TextEditingController _emailController;
  TextEditingController _passwordController;

  /// Get the `FormController` and fakes
  /// a login.
  void onClickSignIn(BuildContext context) {
    // Removes the actual screen and pushes to the home
    Navigator.of(context).popAndPushNamed('/home');
  }

  @override
  void initState() {
    // Inits the controllers for the inputs
    _emailController = new TextEditingController();
    _passwordController = new TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // Disposes the controllers
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/auth_bg.jpg"),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter),
      ),
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Row(
            children: [
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Expanded(
                          child: Form(
                            child: Column(children: [
                              SizedBox(height: 40),
                              Logo(width: 250),
                              SizedBox(height: 30),
                              Text("Sign In",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                              SizedBox(height: 30),
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF4F5052)),
                                    ),
                                    hintText: 'Email Address',
                                    prefixIcon: Icon(
                                        Icons.supervised_user_circle,
                                        color: Color(0xFFB2B7C6))),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF4F5052)),
                                    ),
                                    hintText: 'Password',
                                    fillColor: Colors.red,
                                    prefixIcon: Icon(Icons.lock,
                                        color: Color(0xFFB2B7C6))),
                              ),
                              SizedBox(height: 60),
                              Container(
                                width: double.infinity,
                                child: RaisedButton(
                                    child: Text("Sign In",
                                        style: TextStyle(color: Colors.white)),
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    onPressed: () => onClickSignIn(context),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        side: BorderSide(color: Colors.red)),
                                    color: Theme.of(context).primaryColor),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(text: "Don't have an account?"),
                        WidgetSpan(child: SizedBox(width: 5)),
                        TextSpan(
                            text: "Register",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor))
                      ]))
                    ]),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
