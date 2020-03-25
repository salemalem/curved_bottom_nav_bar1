import 'package:flutter/material.dart';

// for curved navigation bar
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(
    MaterialApp(
      home: BottomNavBar(),
    )
);

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(
            Icons.search,
            size: 30,
            color: Colors.white70,
          ),
          Icon(
            Icons.library_music,
            size: 30,
            color: Colors.white70,
          ),
          Icon(
            Icons.free_breakfast,
            size: 30,
            color: Colors.white70,
          )
        ],
        color: Colors.black,
        buttonBackgroundColor: Colors.green[500],
        backgroundColor: Colors.grey[900],
        animationCurve: Curves.easeOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: bodyWidget(_page),
    );
  }
}

bodyWidget(page) {
  if (page == 0) {
    return Page1();
  } else {
    return Page2();
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}