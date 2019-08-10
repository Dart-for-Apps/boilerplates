import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'main.g.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter hooks demo'),
    );
  }
}

@widget
Widget thisisWidget(String title) {
  return Center(
    child: Text(
      'This is a $title widget',
    ),
  );
}

@hwidget
Widget thisisHookWidget() {
  final secondCounter = useState(0);
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          "This is second Counter: ${secondCounter.value}",
        ),
        RaisedButton(
          onPressed: () {
            secondCounter.value++;
          },
          child: Text("Plus one to second counter"),
        ),
      ],
    ),
  );
}

class MyHomePage extends HookWidget {
  MyHomePage({this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    final animationController = useAnimationController(
      duration: Duration(milliseconds: 1500),
    );
    // animationController.repeat();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          SizeTransition(
            sizeFactor: animationController,
            child: Container(
              width: 100,
              height: 200,
              color: Colors.indigo,
            ),
          ),
          Center(
            child: Text("You touched button ${counter.value} times"),
          ),
          ThisisWidget("hii"),
          ThisisHookWidget(),
        ],
      ),
    );
  }
}
