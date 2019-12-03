import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];
  final bottomNavigationBarItemStyle =
  TextStyle(fontStyle: FontStyle.normal, color: Colors.black);

  ButtomNavigation(){
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.blue,
        ),
        title: Text("Explore", style: bottomNavigationBarItemStyle.copyWith(color: Colors.blue)),
      ),
    );
    bottomBarItems.add(
      new BottomNavigationBarItem(
        icon: new Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        title: Text(
          "Favorite",
          style: bottomNavigationBarItemStyle,
        ),
      ),
    );
    bottomBarItems.add(
      new BottomNavigationBarItem(
        icon: new Icon(
          Icons.notifications,
          color: Colors.black,
        ),
        title: Text(
          "Notification",
          style: bottomNavigationBarItemStyle,
        ),
      ),
    );
    bottomBarItems.add(
      new BottomNavigationBarItem(
        icon: new Icon(
          Icons.person,
          color: Colors.black,
        ),
        title: Text(
          "Profile",
          style: bottomNavigationBarItemStyle,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 15.0,
      items: bottomBarItems,
      type: BottomNavigationBarType.fixed,
    );
  }
}
