

import 'package:flutter/material.dart';

import 'MyDrawer.dart';

class ScaffoldWidget extends StatefulWidget {
  @override
  State<ScaffoldWidget> createState() {
    // TODO: implement createState
    return ScaffoldWidgetState();
  }

}

class ScaffoldWidgetState extends State<ScaffoldWidget> with SingleTickerProviderStateMixin{

  int _selectedIndex = 1;
  TabController _tabController;
  List tabs = ["新闻","历史","图片"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      switch(_tabController.index) {

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ScaffoldWidget"
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {

            },
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e,)).toList(),
        ),
      ),

      drawer: MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) { //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("home")
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text("Business")
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text("School")
          )
        ],

        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {

        },
      ),
    );


  }

}
