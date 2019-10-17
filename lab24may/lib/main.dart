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
  double xc=0,yc=0.5,angulo=0.0,radio=1;
  List<double>xv=List();
  List<double>yv=List();
  List<double>rv=List();
  List<double>yzv=List();
  List<double>vv=List();
  List<double>av=List();
  List<double>xpv=List();
  List<double>ypv=List();
  var gr=Random();
  _oargaListas(){
    for(int i=0;i<100;i++){
      xv.add(gr.nextDouble()*100);
      yv.add(gr.nextDouble()*700);
      rv.add(gr.nextDouble()*50);
      av.add(gr.nextDouble()*5);
      vv.add(gr.nextDouble()/4);
      xpv.add(xv[i]);
      ypv.add(yv[i]);
    }
  }
  _loop(int t){

    setState(() {
      if(xv.length==0){
        _oargaListas();
      }
      xc=radio*cos(angulo);
      yc=(radio/8)*sin(angulo)+0.6;
      angulo=angulo-0.05;
    });

    timer(t);
  }
  Future timer(int t) async{
    Completer c=Completer();
    Timer(Duration(milliseconds: t),(){
      c.complete(_loop(t));
    });
  }
  Widget _canion(double xc,double yc){
    return Align(
      alignment: Alignment(xc, yc),
      child: Container(
        width: 100.0,
        height: 60.0,
        color: Colors.red,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Jogo Bonito"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.play_arrow),onPressed: (){
          timer(10);
        },)
      ],),

      body: Stack(
        children: <Widget>[
          _canion(xc,yc),
        ],
      ),
    );
  }

}