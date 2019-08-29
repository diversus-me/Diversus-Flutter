import 'package:diversus/SeedScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';

class EditSeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),

                decoration: BoxDecoration(
                    color: Color.fromRGBO(227, 229, 232, 1),
                    borderRadius: BorderRadius.circular(8)),
                // height: 50,
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: 'Title', border: InputBorder.none)),
              ),
              // RaisedButton(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              //   onPressed: () {
              //     showCupertinoModalPopup(
              //         context: context,
              //         builder: (context) => AddTitleDescriptionScreen());
              //   },
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8)),
              //   color: Colors.grey[300],
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: <Widget>[
              //       Text('Add Title & Description'),
              //       SizedBox(width: 50),
              //       Icon(
              //         Icons.keyboard_arrow_down,
              //       )
              //     ],
              //   ),
              // ),
              DoubleCircularSlider(
                100,
                0,
                20,
                size: 250,
                sliderStrokeWidth: 8,
                baseColor: Colors.grey,
                handlerColor: Theme.of(context).primaryColor,
                selectionColor: Theme.of(context).primaryColor,
                handlerOutterRadius: 8,
                child: Image.asset(
                  'assets/selfie.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),

                decoration: BoxDecoration(
                    color: Color.fromRGBO(227, 229, 232, 1),
                    borderRadius: BorderRadius.circular(8)),
                // height: 50,
                child: TextField(
                    textAlign: TextAlign.center,
                    maxLines: 6,
                    decoration: InputDecoration(
                        hintText: 'Description', border: InputBorder.none)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => Navigator.of(context).pop()),
                  IconButton(
                      icon: Icon(Icons.check, color: Colors.green),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => SeedScreen())))
                ],
              )
            ],
          ),
        ),
      ),
    );
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
