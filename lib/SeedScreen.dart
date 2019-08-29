import 'package:diversus/Fab2.dart';
import 'package:diversus/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeedScreen extends StatelessWidget {
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
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Solar Energy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, spreadRadius: 1, blurRadius: 5)
                  ],
                  borderRadius: BorderRadius.circular(500),
                ),
                width: 250,
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: Image.asset(
                    'assets/selfie.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      icon: Image.asset(
                        'assets/menu.png',
                        width: 23,
                        height: 23,
                      ),
                      onPressed: () => Navigator.of(context).pop())
                ],
              )
            ],
          ),
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent), body: fab);
  }
}

class AddTitleDescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.7),
      body: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                padding: const EdgeInsets.fromLTRB(30, 12, 30, 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 6,
                          spreadRadius: 3)
                    ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.keyboard_arrow_up),
                    SizedBox(height: 12),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(236, 238, 242, 0.8),
                          borderRadius: BorderRadius.circular(6)),
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            hintText: 'Title',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(236, 238, 242, 0.8),
                            borderRadius: BorderRadius.circular(6)),
                        child: TextField(
                          maxLines: 6,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              hintText: 'Description',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/selfie.jpg'),
                            ),
                            Text(
                              '  Nora F.',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Text(
                          'Jul 25, 2019',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w100),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => Navigator.of(context).pop()),
                    IconButton(
                        icon: Icon(Icons.check, color: Colors.green),
                        onPressed: () {})
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
