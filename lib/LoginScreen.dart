import 'package:diversus/Home.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/loginBackground.png"),
            // colorFilter: ColorFilter.mode(Colors.grey, BlendMode.softLight),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.grey.withOpacity(0.26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.transparent,
                child: Image.asset('assets/dRound.png'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 120, 50, 40),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Enter email',
                  ),
                ),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen())),
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 70.0, vertical: 10),
                  child: Text('Login',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
