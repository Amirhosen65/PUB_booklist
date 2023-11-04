import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pub_booklist/Auth/LogInPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Login()
      )
    );
  }

  initScreen(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("images/pub_logo.png"),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Text(
              "PUB Book List",
              style: TextStyle(
                  fontSize: 30.0,
              ),
            ),
            SizedBox(height: 15,),
            Text(
              "A Book Library",
              style: TextStyle(
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 4,
            )
          ],
        ),
      ),
    );
  }
}