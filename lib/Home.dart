import 'package:diversus/EditPetal.dart';
import 'package:diversus/EditSeedScreen.dart';
import 'package:diversus/Fab2.dart';
import 'package:diversus/HomeAllScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  FabCircularMenu fab;
  @override
  Widget build(BuildContext context) {
    showAddLink() {
      fab.state?.changeAnimation();

      showCupertinoModalPopup(
          context: context, builder: (context) => NewLinkSeed());
    }

    fab = FabCircularMenu(
      ringDiameter: 200,
      ringColor: Theme.of(context).primaryColor,
      fabCloseIcon: Icon(Icons.clear),
      fabOpenIcon: Icon(Icons.add),
      child: TabBarView(
        children: [
          HomeAllScreen(),
          HomeAllScreen(),
          HomeAllScreen(),
        ],
        controller: _tabController,
      ),
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
    );

    return Scaffold(
      body: fab,
      appBar: AppBar(
          title: Text(
            'diversus',
            style: TextStyle(color: Colors.grey[600], fontSize: 35),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/menu.png',
              width: 23,
              height: 23,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.grey[700],
              ),
            )
          ],
          bottom: TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.grey[700],
              indicatorColor: Colors.grey[700],
              tabs: [
                Tab(child: Text('All', style: TextStyle(fontSize: 17))),
                Tab(child: Text('My Flowers', style: TextStyle(fontSize: 17))),
                Tab(child: Text('Popular', style: TextStyle(fontSize: 17)))
              ])),
    );
  }
}

class NewLinkSeed extends StatelessWidget {
  final bool isSeed;

  const NewLinkSeed({Key key, this.isSeed: true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.white.withOpacity(0.7),
      child: Center(
        child: Card(
          elevation: 2,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 16),
                  child: Text(
                    isSeed ? 'Create New Seed' : 'Create New Petal',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    isSeed
                        ? 'Provide YouTube link to create new topic'
                        : 'Provide YouTube link to add supplementary information.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Provide YouTube Link',
                          prefixIcon: Image.asset(
                            'assets/youtubeIcon.png',
                            scale: 2.5,
                          )),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.clear),
                    ),
                    IconButton(
                      onPressed: () {
                        isSeed
                            ? Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => EditSeedScreen()))
                            : Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => EditPetalScreen()));
                      },
                      icon: Icon(Icons.check, color: Colors.green),
                    )
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
