

import 'package:flutter/material.dart';

class FlowLayoutWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text("流式布局"),
     ),
     body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Wrap(
           spacing: 8.0,
           runSpacing: 8.0,
           alignment: WrapAlignment.center,
           children: [
             Chip(
               avatar: CircleAvatar(
                 backgroundColor: Colors.blue,
                 child: Text(
                   "A"
                 ),
               ),
               label: Text(
                 "Hamilton"
               ),
             ),
             Chip(
               avatar: CircleAvatar(
                 backgroundColor: Colors.blue,
                 child: Text(
                     "A"
                 ),
               ),
               label: Text(
                   "Hamilton"
               ),
             ),
             Chip(
               avatar: CircleAvatar(
                 backgroundColor: Colors.blue,
                 child: Text(
                     "A"
                 ),
               ),
               label: Text(
                   "Hamilton"
               ),
             ),
             Chip(
               avatar: CircleAvatar(
                 backgroundColor: Colors.blue,
                 child: Text(
                     "A"
                 ),
               ),
               label: Text(
                   "Hamilton"
               ),
             ),
           ],
         )
       ],
     ),
   );
  }

}