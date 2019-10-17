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
  int num = 0,num2=0,num3=0,num4=0,num1=0;
  bool m=true,alba=false,mariana=true;
  var gr=Random();
  Future timer(int t) async {
    Completer c = Completer();
    Timer(Duration(milliseconds: t),(){
      c.complete(_loop(t));
    });
  }
  _loop(int t){
    setState(() {

        if (num < 100) {
          num++;
          if(num%4==1){
              num1=num;
          }
          if(num%4==2){
              num2=num;
          }
          if(num%4==3){

              num3=num;
          }
          if(num%4==0){
            num4=num;

          }
        }
        else{
          alba=true;
          mariana=false;
        }
        timer(t);
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget Esfera(var al,int x){
      return Align(
        alignment: al,
        child: Visibility(
            visible: mariana,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  gradient: LinearGradient(
                    colors: [Colors.yellowAccent,Colors.yellowAccent],
                    begin: gr.nextBool()?Alignment.bottomCenter : Alignment.topRight,
                    end: gr.nextBool() ? Alignment.topRight : Alignment.bottomCenter,
                    stops: [0.0,0.9],
                  )
              ),
              alignment: Alignment.center,
              child: Text(x.toString(), style: TextStyle(fontSize: 50),),
            )
        ),
        );
    }
    Widget EsferaTexto(var al,String x){
      return Align(
          alignment: al,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                gradient: LinearGradient(
                  colors: [Colors.yellowAccent,Colors.yellowAccent],
                  begin: gr.nextBool()?Alignment.bottomCenter : Alignment.topRight,
                  end: gr.nextBool() ? Alignment.topRight : Alignment.bottomCenter,
                  stops: [0.0,0.9],
                )
            ),
            alignment: Alignment.center,
            child: Text(x.toString(), style: TextStyle(fontSize: 50),),
          ));
    }
    return Scaffold(
      appBar: AppBar(title: Text("Demo Callback"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.play_arrow), onPressed: (){
          setState(() {
            m=true;
          });
          timer(400);
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

      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            Esfera(Alignment.topLeft,num1),
            Esfera(Alignment.topRight,num2),
            Esfera(Alignment.bottomRight,num3),
            Esfera(Alignment.bottomLeft,num4),
            Visibility(
              visible: alba,
              child: EsferaTexto(Alignment.center,"FINISH"),
            ),
          ],
        ),
      ),
    );
  }
}