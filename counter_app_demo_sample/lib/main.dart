import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatefulWidget {
  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
        ),
        body: Center(
          child: Text(
            _counter.toString(),
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.red[900]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: IconButton(
            color: Colors.blue[800],
            icon: Icon(Icons.plus_one),
            onPressed: () {
              setState(() {
                _counter += 1;
              });
            },
          ),
        ),
      ),
    );
  }
}
