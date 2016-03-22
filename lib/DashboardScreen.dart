import 'package:flutter/material.dart';

class DashboardScreen extends StatefulComponent{
  _DashboardScreenState createState() => new _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>{

  Widget build(BuildContext context) {
    return new Scaffold(
      toolBar: new ToolBar(
        center: new Text('Dashboard')
      ),
      body: new MaterialList(
        type: MaterialListType.oneLineWithAvatar,
        children: [
          new EventItem(),
          new EventItem(),
          new EventItem(),
          new EventItem(),
          new EventItem(),
          new EventItem()
        ]
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Upload to Event',
        child: new Icon(icon: Icons.add)
      )
    );
  }
}

class EventItem extends StatelessComponent {

  Widget build(BuildContext context) {
    return new ListItem(
      onTap: (){
        print("View Event Page");
      },
      left: new CircleAvatar(
        child: new Text("M")
      ),
      primary: new Text("Mock Event")
    );
  }
}
