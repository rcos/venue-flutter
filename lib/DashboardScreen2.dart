import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import "EventDetailsScreen.dart";

class DashboardScreen2 extends StatefulWidget {
  DashboardScreen2() : super();

  DashboardScreen2State createState() => new DashboardScreen2State();
}

class EventData{
  const EventData({this.name, this.description, this.due});
  final String name, description, due;
}

class EventCardItem extends StatelessWidget {
  EventCardItem({ Key key, this.event }) : super(key: key) {
    assert(event != null);
  }

  final EventData event;

  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle titleStyle = theme.textTheme.headline.copyWith(color: Colors.white);
    TextStyle descriptionStyle = theme.textTheme.subhead;
    TextStyle buttonStyle = theme.textTheme.button.copyWith(color: theme.primaryColor);

    return new Card(
      child: new SizedBox(
        height: 328.0,
        child: new Column(
          children: <Widget>[
            // photo and title
            new SizedBox(
              height: 184.0,
              child: new Stack(
                children: <Widget>[
                  new Positioned(
                    left: 0.0,
                    top: 0.0,
                    bottom: 0.0,
                    right: 0.0,
                    child: new AssetImage(
                      name: "assets/empac.jpg",
                      fit: ImageFit.cover
                    )
                  ),
                  new Positioned(
                    bottom: 16.0,
                    left: 16.0,
                    child: new Text(event.name, style: titleStyle)
                  )
                ]
              )
            ),
            // description and share/expore buttons
            new Flexible(
              child: new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // three line description
                    new Text(event.description, style: descriptionStyle),
                    // share, explore buttons
                    new Flexible(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          new GestureDetector(
                            child: new Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: new Text('SHARE', style: buttonStyle)
                            ),
                            onTap: (){
                              Scaffold.of(context).showSnackBar(new SnackBar(
                                content: new Text("Sharing is not currently supported")
                              ));
                            }
                          ),
                          new GestureDetector(
                            child: new Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: new Text('DETAILS', style: buttonStyle)
                            ),
                            onTap: (){
                              Navigator.push(context, new MaterialPageRoute<Null>(
                                builder: (BuildContext context) => new EventDetailsScreen()
                              ));
                            }
                          ),
                          new Text('ATTEND', style: buttonStyle)
                        ]
                      )
                    )
                  ]
                )
              )
            )
          ]
        )
      )
    );
  }
}

class DashboardScreen2State extends State<DashboardScreen2> {

  List<EventData> events;

  DashboardScreen2State(){
    events = <EventData>[
      new EventData(
        name: "Turing the Machine",
        description: "Explorations in computation from a truely novel artist.",
        due: "March 27th"
      ),
      new EventData(
        name: "Turing the Machine",
        description: "Explorations in computation from a truely novel artist.",
        due: "March 27th"
      ),
      new EventData(
        name: "Turing the Machine",
        description: "Explorations in computation from a truely novel artist.",
        due: "March 27th"
      )
    ];
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Event Dashboard'),
        actions: <Widget>[
          new IconButton(
            icon: Icons.more_vert,
            tooltip: 'Show menu'
          )
        ]
      ),
      body: new Block(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        children: events.map((EventData event) {
          return new Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            child: new EventCardItem(event: event)
          );
        })
        .toList()
      )
    );
  }
}
