
import 'package:flutter/material.dart';

class ScrollControllerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScrollControllerWidgetState();
  }
}

class ScrollControllerWidgetState extends State<ScrollControllerWidget> {

  ScrollController _scrollController = ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      print("offset: " + _scrollController.offset.toString() + " showToTopBtn: " + showToTopBtn.toString());
      if(_scrollController.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if(_scrollController.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "滑动控制",
        ),
      ),
      body: Scrollbar(
        child: ListView.builder(itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
          );
        },itemExtent: 50.0,itemCount: 100,controller: _scrollController,),
      ),
      floatingActionButton: !showToTopBtn? null : FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(.0, duration: Duration(microseconds: 200), curve: Curves.ease);
        },
        child: Icon(
          Icons.arrow_upward
        ),
      ),
    );
  }
}