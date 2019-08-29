import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetalViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/petalsImage.png'),
                fit: BoxFit.cover)),
        height: MediaQuery.of(context).size.height,
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
            SizedBox(height: 120),
            Text('Uses of this Energy',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
            Text('Renewable Energy',
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 14)),
            SizedBox(height: 16),
            Container(
              color: Color.fromRGBO(220, 49, 72, 1),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 16, bottom: 24),
              child: Center(
                child: Text(
                  'Contradiction',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ),
            ),
          ],
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
  var showPlay = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.topCenter,
              child: InkWell(
                onTap: () => setState(() => showPlay = !showPlay),
                child: Container(
                  width: 180,
                  height: 180,
                  child: InkWell(
                    onTap: () => setState(() => showPlay = !showPlay),
                    child: showPlay
                        ? Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Image.asset('assets/playIcon.png'),
                                SizedBox(height: 12),
                                Text(
                                  'Double tap to',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  'Fullscreen',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(height: 22),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.black.withAlpha(120),
                                borderRadius: BorderRadius.circular(200)),
                          )
                        : null,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(
                          color: Color.fromRGBO(220, 49, 72, 1), width: 8),
                      image: DecorationImage(
                          image: AssetImage('assets/selfie.jpg'),
                          fit: BoxFit.cover)),
                ),
              )),
          Align(
              alignment: Alignment.bottomLeft,
              child: Container(
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

class PetalTitlePopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () => Navigator.of(context).pop(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 100, left: 50, right: 50),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, spreadRadius: 2, blurRadius: 4)
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Uses of this Energy',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                  SizedBox(height: 16),
                  Text(
                      "The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs. Waltz, bad nymph, for quick jigs vex! Fox nymphs grab quick-jived waltz. Brick quiz whangs jumpy veldt fox. Bright vixens jump; dozy fowl quack. Quick wafting zephyrs vex bold Jim. Quick zephyrs blow, vexing daft Jim. Sex-charged fop blew my junk TV quiz. How quickly daft jumping zebras vex.",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w100)),
                  SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                          backgroundImage: AssetImage('assets/selfie.jpg')),
                      Text('  Nora F.  ', style: TextStyle(fontSize: 16)),
                      Spacer(),
                      Text(
                        'Jul 25, 2019',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
