import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:third_scafhold/dashboard.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
        title: "Firebase login and signup",
        onLogin: onLoginUser,
        onSignup: onSignUpUser,
        onSubmitAnimationCompleted: () async {
          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (context) => DashBoardScrenn()));

          FirebaseAuth _auth = FirebaseAuth.instance;
          await _auth.currentUser().then((user) => user != null
              ? Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => DashBoardScrenn()))
              : Fluttertoast.showToast(msg: "User not register before"));
        },
        onRecoverPassword: _onRecoveryPassword);
  }

  Future<String> onLoginUser(LoginData loginData) {
    _handleSignIn(loginData.name.trim(), loginData.password).then((user) =>
        Fluttertoast.showToast(
                msg: 'Welcome)',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.teal,
                textColor: Colors.white,
                fontSize: 16)
            .catchError((e) => Fluttertoast.showToast(
                msg: '${e}',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16)));
  }

  Future<FirebaseUser> _handleSignIn(String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser _user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    return _user;
  }

  Future<String> onSignUpUser(LoginData loginData) {
    _handleSignUp(loginData.name.trim(), loginData.password).then((user) =>
        Fluttertoast.showToast(
                msg: 'Welcome)',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.teal,
                textColor: Colors.white,
                fontSize: 16)
            .catchError((e) => Fluttertoast.showToast(
                msg: '${e}',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16)));
  }

  Future<FirebaseUser> _handleSignUp(String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser _user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    return _user;
  }

  Future<String> _onRecoveryPassword(String email) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.sendPasswordResetEmail(email: email).catchError((e) =>
        Fluttertoast.showToast(
            msg: '${e}',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16));
  }
}
