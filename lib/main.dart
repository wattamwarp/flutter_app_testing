import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Padmanabh Wattamwar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter(BuildContext context) {
    if(_counter >=5){
      setState(() {
        _counter=5;
      });
      moreAlertDialog(context);
    }else{
    setState(() {
      _counter++;
    });}
  }

  void _decrementCounter(BuildContext context) {
    if (_counter <= 1) {
      setState(() {
        _counter = 0;
      });
      showAlertDialog(context);
    } else {
      setState(() {
        _counter--;
      });
    }
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("this is minimum quantity"),
      actions: [
        okButton,
      ],
    );


    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  moreAlertDialog(BuildContext context) {

    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("this is maximum quantity"),

      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Center(
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  _decrementCounter(context);
                },
                child: Container(
                  height: 26,
                  width: 26,
                  margin: EdgeInsets.only(right: 20),
                  color: Colors.blue,
                  child: Center(child: Icon(Icons.remove)),
                ),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              InkWell(
                onTap: () {
                  _incrementCounter(context);
                },
                child: Container(
                  height: 26,
                  width: 26,
                  margin: EdgeInsets.only(left: 20),
                  color: Colors.blue,
                  child: Center(child: Icon(Icons.add)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
