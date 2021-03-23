import 'package:daily_recipe/helpers/validator.dart';
import 'package:daily_recipe/models/user.dart';
import 'package:daily_recipe/providers/auth_provider.dart';
import 'package:daily_recipe/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  /// Get the `FormController` and fakes
  /// a login.
  void onClickSignIn(BuildContext context) {
    // Validate if the form is validated
    if (_formKey.currentState.validate()) {
      // Creates the user (simulate an API call)
      User user =
          new User(email: _emailController.text, name: "Alex", surname: "AF");
      Provider.of<AuthProvider>(context, listen: false).logIn(user);
      // Removes the actual screen and pushes to the home
      Navigator.of(context).popAndPushNamed('/home');
    }
  }

  @override
  void initState() {
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
                            key: _formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 40),
                                  Logo(width: 250),
                                  SizedBox(height: 30),
                                  Text("Sign In",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      )),
                                  SizedBox(height: 30),
                                  TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(color: Colors.white),
                                    validator: (value) {
                                      Validator validator =
                                          new Validator(value);
                                      String validation = validator.email();
                                      return validation;
                                    },
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF4F5052)),
                                        ),
                                        hintText: 'Email Address',
                                        prefixIcon: SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: IconButton(
                                              padding: EdgeInsets.all(0.0),
                                              color: Colors.red,
                                              icon: SvgPicture.asset(
                                                'assets/icons/email.svg',
                                              ),
                                              onPressed: () {}),
                                        )),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    style: TextStyle(color: Colors.white),
                                    validator: (value) {
                                      Validator validator =
                                          new Validator(value);
                                      String validation = validator.password();
                                      return validation;
                                    },
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF4F5052)),
                                        ),
                                        hintText: 'Password',
                                        fillColor: Colors.red,
                                        prefixIcon: SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: IconButton(
                                              padding: EdgeInsets.all(0.0),
                                              color: Colors.red,
                                              icon: SvgPicture.asset(
                                                'assets/icons/password.svg',
                                              ),
                                              onPressed: () {}),
                                        )),
                                  ),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: FlatButton(
                                          splashColor: Color(0xFF0D6D85),
                                          child: Text("Forgot Password?",
                                              style: TextStyle(
                                                  color: Color(0xFF128FAE))),
                                          onPressed: () {})),
                                  SizedBox(height: 60),
                                  Container(
                                    width: double.infinity,
                                    child: RaisedButton(
                                        child: Text(
                                          "Sign In",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        onPressed: () => onClickSignIn(context),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            side:
                                                BorderSide(color: Colors.red)),
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(color: Color(0xFFB2B7C6))),
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
