
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventDetailsScreen extends StatefulWidget {
  EventDetailsScreenState createState() => new EventDetailsScreenState();
}

class EventDetailsScreenState extends State<EventDetailsScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final double appBarHeight = 256.0;
  final Key scrollableKey = new UniqueKey();
  AppBarBehavior _appBarBehavior = AppBarBehavior.scroll;

  Widget build(BuildContext context) {
    return new Theme(
      data: new ThemeData(
        brightness: ThemeBrightness.light,
        primarySwatch: Colors.indigo
      ),
      child: new Scaffold(
        key: scaffoldKey,
        scrollableKey: scrollableKey,
        appBarBehavior: _appBarBehavior,
        appBar: new AppBar(
          actions: <Widget>[
            new IconButton(
              icon: Icons.create,
              tooltip: 'Search',
              onPressed: () {
                scaffoldKey.currentState.showSnackBar(new SnackBar(
                  content: new Text('Not supported.')
                ));
              }
            ),
            new PopupMenuButton<AppBarBehavior>(
              onSelected: (AppBarBehavior value) {
                setState(() {
                  _appBarBehavior = value;
                });
              },
              child: new Row(
                children: <PopupMenuItem<AppBarBehavior>>[
                  new PopupMenuItem<AppBarBehavior>(
                    value: AppBarBehavior.scroll,
                    child: new Text('AppBar scrolls away')
                  ),
                  new PopupMenuItem<AppBarBehavior>(
                    value: AppBarBehavior.under,
                    child: new Text('AppBar stays put')
                  )
                ]
              )
            )
          ],
          leading: new FlexibleSpaceBar(
            title : new Text('Turing the Machine'),
            background: new AssetImage(
              name: 'assets/empac.jpg',
              fit: ImageFit.cover,
              height: appBarHeight
            )
          )
        ),
        body: new Block(
          scrollableKey: scrollableKey,
          padding: new EdgeInsets.only(top: appBarHeight),
          children: <Widget>[
            new _BodyText(
              content: "Turing the machine is an innovative and provocative "+
                       "semi-literate work. Stacy Mendon outdoes the herself "+
                       "in a performing arts demonstration that ceases to amaze"
            ),
            new _InfoCategory(
              icon: Icons.navigation,
              children: <Widget>[
                new _CategoryItem(
                  icon: Icons.map,
                  lines: <String>[
                    '1222 Burdett Ave.',
                    "Troy NY"
                  ]
                )
              ]
            ),
            new _BodyText(
              content: "Make sure to get a picture infront of the stage and "+
                       "with the presenter"
            ),
          ]
        )
      )
    );
  }
}

class _BodyText extends StatelessWidget{
  _BodyText({ Key key, this.content }) : super(key: key);

  final String content;

  Widget build(BuildContext context){
    return new Container(
      padding: const EdgeInsets.symmetric(vertical:16.0),
      decoration: new BoxDecoration(
        border: new Border(bottom: new BorderSide(color: Theme.of(context).dividerColor))
      ),
      child: new DefaultTextStyle(
        style: Theme.of(context).textTheme.subhead,
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical:18.0),
              child: new Text(content)
            )
          ]
        )
      )
    );
  }
}

class _InfoCategory extends StatelessWidget {
  _InfoCategory({ Key key, this.icon, this.children }) : super(key: key);

  final IconData icon;
  final List<Widget> children;

  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: new BoxDecoration(
        border: new Border(bottom: new BorderSide(color: Theme.of(context).dividerColor))
      ),
      child: new DefaultTextStyle(
        style: Theme.of(context).textTheme.subhead,
        child: new Row(
          children: <Widget>[
            new SizedBox(
              width: 72.0,
              child: new Icon(icon: icon, color: Theme.of(context).primaryColor)
            ),
            new Flexible(child: new Column(children: children))
          ]
        )
      )
    );
  }
}

class _CategoryItem extends StatelessWidget {
  _CategoryItem({ Key key, this.icon, this.lines }) : super(key: key) {
    assert(lines.length > 1);
  }

  final IconData icon;
  final List<String> lines;

  Widget build(BuildContext context) {
    List<Widget> columnChildren = lines.sublist(0, lines.length - 1).map((String line) => new Text(line)).toList();
    columnChildren.add(new Text(lines.last, style: Theme.of(context).textTheme.caption));

    List<Widget> rowChildren = <Widget>[
      new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columnChildren
      )
    ];
    if (icon != null) {
      rowChildren.add(new SizedBox(
        width: 72.0,
        child: new Icon(icon: icon, color: Theme.of(context).disabledColor)
      ));
    }
    return new Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: rowChildren
      )
    );
  }
}
