import 'package:diversus/Fab2.dart';
import 'package:diversus/Home.dart';
import 'package:diversus/PetalViewScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeedWithPetalScreen extends StatelessWidget {
  FabCircularMenu fab;
  @override
  Widget build(BuildContext context) {
    showAddLink() {
      fab.state?.changeAnimation();
      showCupertinoModalPopup(
          context: context, builder: (context) => NewLinkSeed(isSeed: false));
    }

    fab = FabCircularMenu(
        ringDiameter: 200,
        ringColor: Theme.of(context).primaryColor,
        fabCloseIcon: Icon(Icons.clear),
        fabOpenIcon: Icon(Icons.add),
        options: <Widget>[
          IconButton(
              icon: Image.asset('assets/microphone.png', height: 25),
              onPressed: () {},
              color: Colors.white),
          IconButton(
              icon: Image.asset('assets/addLinkIcon.png', height: 25),
              onPressed: () => showAddLink(),
              color: Colors.white),
          IconButton(
              icon: Image.asset('assets/uploadIcon.png', height: 25),
              onPressed: () {},
              color: Colors.white),
        ],
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset('assets/seedViewImage.png'),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.black),
                      borderRadius: BorderRadius.circular(500),
                    ),
                    width: 200,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Image.asset(
                        'assets/selfie.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: fab,
      appBar: AppBar(
        leading: IconButton(
            icon: Image.asset(
              'assets/menu.png',
              width: 23,
              height: 23,
            ),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PetalViewScreen()))),
        title: Text(
          'Solar Energy',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
    );
  }
}
