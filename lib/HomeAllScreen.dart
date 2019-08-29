import 'package:flutter/material.dart';

class HomeAllScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      itemBuilder: (context, index) => HomeAllTableCell(),
      separatorBuilder: (context, index) => Divider(
        indent: 30,
        endIndent: 30,
      ),
    );
  }
}

class HomeAllTableCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
      child: Row(
        children: <Widget>[
          Flexible(
              flex: 2,
              child: Image.asset('assets/groupUsers.png', height: 120)),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 0, 8, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Title of the flower and and this is the second and third line...',
                    maxLines: 3,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                  SizedBox(height: 8),
                  Text('133 Petals',
                      style: TextStyle(
                          color: Colors.blue[300],
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Joseph L.'),
                      Text('July 13, 2019'),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
