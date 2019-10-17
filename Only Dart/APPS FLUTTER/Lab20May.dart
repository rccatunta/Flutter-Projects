import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Puente(),
    );
  }
}
class Puente extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return DemoCB();
  }
}
class DemoCB extends State<Puente> {
  int num = 0;
  bool m=true;
  var gr=Random();
  Future timer(int t) async {
    Completer c = Completer();
    Timer(Duration(milliseconds: t),(){
      c.complete(_loop(t));
    });
  }
  _loop(int t){
    setState(() {

        if (num < 100 && m) {
          num = num + 1;
          timer(t);
        }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Demo Callback"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.play_arrow), onPressed: (){
          setState(() {
            m=true;
          });
          timer(1000);
        },),
        IconButton(icon: Icon(Icons.pause),onPressed: (){
          setState(() {
            m=false;
          });
        },),
        IconButton(icon: Icon(Icons.stop),onPressed: (){
          setState(() {
            num=0;
            m=false;
          });
        },)
      ],),
      body: Align(

        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            gradient: LinearGradient(
              colors: [Colors.yellowAccent,Colors.black],
              begin: gr.nextBool()?Alignment.bottomCenter : Alignment.topRight,
              end: gr.nextBool() ? Alignment.topRight : Alignment.bottomCenter,
              stops: [0.0,0.9],
            )
          ),
          alignment: Alignment.center,

          child: Text(num.toString(), style: TextStyle(fontSize: 50),),
        ),
      ),
    );
  }
}