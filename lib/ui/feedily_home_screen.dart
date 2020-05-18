import 'package:feedily/ui/feedily_add_screen.dart';
import 'package:feedily/ui/feedily_feed_screen.dart';
import 'package:feedily/ui/feedily_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feedily_activity_screen.dart';
import 'feedily_search_screen.dart';

class FeedilyHomeScreen extends StatefulWidget {
  @override
  _FeedilyHomeScreenState createState() => _FeedilyHomeScreenState();
}

PageController pageController;

class _FeedilyHomeScreenState extends State<FeedilyHomeScreen> {
  int _page = 0;

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new PageView(
        children: [
          new Container(
            color: Colors.white,
            child: FeedilyFeedScreen(),
          ),
          new Container(color: Colors.white, child: FeedilySearchScreen()),
          new Container(
            color: Colors.white,
            child: FeedilyAddScreen(),
          ),
          new Container(color: Colors.white, child: FeedilyActivityScreen()),
          new Container(color: Colors.white, child: FeedilyProfileScreen()),
        ],
        controller: pageController,
        physics: new NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: new CupertinoTabBar(
        activeColor: Colors.orange,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home,
                  color: (_page == 0) ? Colors.black : Colors.grey),
              title: new Container(height: 0.0),
              backgroundColor: Colors.white),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.search,
                  color: (_page == 1) ? Colors.black : Colors.grey),
              title: new Container(height: 0.0),
              backgroundColor: Colors.white),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.add_circle,
                  color: (_page == 2) ? Colors.black : Colors.grey),
              title: new Container(height: 0.0),
              backgroundColor: Colors.white),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.star,
                  color: (_page == 3) ? Colors.black : Colors.grey),
              title: new Container(height: 0.0),
              backgroundColor: Colors.white),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.person,
                  color: (_page == 4) ? Colors.black : Colors.grey),
              title: new Container(height: 0.0),
              backgroundColor: Colors.white),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
