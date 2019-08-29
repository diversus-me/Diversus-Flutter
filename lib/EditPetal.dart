import 'package:diversus/SeedScreen.dart';
import 'package:diversus/SeedWithPetalScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';

class EditPetalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/petalsImage.png'),
                fit: BoxFit.cover)),
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: <Widget>[
                Text(
                  'Solar Energy',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                PetalConnection(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    height: 110,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              LinkType(
                                color: Color.fromRGBO(112, 115, 130, 1),
                                text: 'Neutral',
                                isSelected: false,
                              ),
                              LinkType(
                                color: Color.fromRGBO(220, 49, 72, 1),
                                text: 'Contradiction',
                                isSelected: false,
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              LinkType(
                                color: Color.fromRGBO(82, 110, 248, 1),
                                text: 'Fact Check',
                                isSelected: false,
                              ),
                              SizedBox(width: 40),
                              LinkType(
                                color: Color.fromRGBO(0, 163, 145, 1),
                                text: 'Support',
                                isSelected: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Icon(Icons.keyboard_arrow_up),
                Text('Choose link type'),
                SizedBox(height: 16),
                RaisedButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) => AddTitleDescriptionScreen());
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.white,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Add Title & Description',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.keyboard_arrow_down,
                      )
                    ],
                  ),
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
                                builder: (cotnext) => SeedWithPetalScreen())))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LinkType extends StatelessWidget {
  final String text;
  final Color color;
  final bool isSelected;

  const LinkType({Key key, this.text, this.color, this.isSelected})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          color: color,
          border: isSelected ? Border.all(width: 1, color: Colors.white) : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                      color: color.withAlpha(200),
                      spreadRadius: 3,
                      blurRadius: 12)
                ]
              : null),
      child: Center(
          child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      )),
    );
  }
}

class PetalConnection extends StatefulWidget {
  @override
  _PetalConnectionState createState() => _PetalConnectionState();
}

class _PetalConnectionState extends State<PetalConnection> {
  var seedKey = GlobalKey();
  var petalKey = GlobalKey();
  Offset point1;
  Offset point2;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _getPositions());
    super.initState();
  }

  _getPositions() {
    final RenderBox seedBox = seedKey.currentContext?.findRenderObject();
    final positionSeed = seedBox?.localToGlobal(Offset.zero);
    print("POSITION of seed: $positionSeed ");
    // point1 = positionSeed;

    final RenderBox petalBox = seedKey.currentContext?.findRenderObject();
    final positionpetal = petalBox?.localToGlobal(Offset.zero);
    print("POSITION of petal: $positionpetal ");
    // point2 = positionpetal;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: <Widget>[
          CustomPaint(
            foregroundPainter: JoinPetalToSeed(
                point1 ?? Offset(80.0, 230), point2 ?? Offset(150, 150)),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: DoubleCircularSlider(
              100,
              0,
              20,
              size: 200,
              child: Image.asset(
                'assets/selfie.jpg',
                fit: BoxFit.cover,
                key: petalKey,
              ),
              sliderStrokeWidth: 4,
              baseColor: Colors.grey,
              handlerColor: Theme.of(context).primaryColor,
              selectionColor: Theme.of(context).primaryColor,
              handlerOutterRadius: 4,
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                key: seedKey,
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    border: Border.all(color: Colors.black, width: 2),
                    image: DecorationImage(
                        image: AssetImage('assets/selfie.jpg'),
                        fit: BoxFit.cover)),
              ))
        ],
      ),
    );
  }
}

class JoinPetalToSeed extends CustomPainter {
  final Offset p1;
  final Offset p2;

  JoinPetalToSeed(this.p1, this.p2);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
