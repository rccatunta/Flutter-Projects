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
  double xb=50,yb=50,angulo=0.0,radio=50;
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

    if(yv.length==0){
      _oargaListas();
    }
    setState(() {
      for(int i=0;i<xv.length;i++){
        xv[i]=rv[i]*3*cos(av[i])+xpv[i];
        yv[i]=rv[i]*3*sin(av[i])+ypv[i];
        av[i]=av[i]+vv[i]*av[i];
      }
      xb=radio*cos(angulo);
      yb=radio*sin(angulo);
      angulo=angulo+0.1;
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
      appBar: AppBar(title: Text("Dibujito"),
       actions: <Widget>[
          IconButton(icon: Icon(Icons.play_arrow),onPressed: (){
            timer(100);
          },)
        ],),

      body: Stack(
        children: <Widget>[
          CustomPaint(painter: Ejes(),child: Container(),),
          CustomPaint(painter: Estrella(xb+150,yb+300,50,50),child: Container(),),
          CustomPaint(painter: Barra(xb,yb),child: Container(),),
        ],
      ),
    );
  }

}
class Ejes extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint= Paint()
    ..color=Colors.red
        ..style=PaintingStyle.stroke
        ..strokeWidth=1.1;
    canvas.drawLine(Offset(0,size.height/2),Offset(size.width, size.height/2), paint);
    canvas.drawLine(Offset(size.width/2,0),Offset(size.width/2, size.height), paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
class Barra extends CustomPainter{
  double x,y;

  Barra(this.x, this.y);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint=Paint()
      ..color=Colors.lime
      ..style=PaintingStyle.stroke
      ..strokeWidth=1.1;
    canvas.drawLine(Offset(size.width/2,size.height/2), Offset(x+(size.width/2),y+(size.height/2)), paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

class Burbuja extends CustomPainter{
  double x,y;

  Burbuja(this.x, this.y);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint=Paint()
      ..color=Colors.lime
      ..style=PaintingStyle.stroke
      ..strokeWidth=1.1;
    for(int i=0;i<xv.length;i++){
      canvas.drawCircle(Offset(vx[i], vy[i]), vr[i], paint);
    }


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
class Estrella extends CustomPainter{
  double x,y,w,h;

  Estrella(this.x, this.y, this.w, this.h);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint=Paint()
        ..color=Colors.deepPurpleAccent
        ..style=PaintingStyle.stroke
        ..strokeWidth=1.1;
    canvas.drawLine(Offset(x,y+h/4), Offset(x+w,y+h/4), paint);
    canvas.drawLine(Offset(x+w,y+h/4), Offset(x,y+h), paint);
    canvas.drawLine(Offset(x,y+h), Offset(x+w/2,y), paint);
    canvas.drawLine(Offset(x+w/2,y), Offset(x+w,y+h), paint);
    canvas.drawLine(Offset(x+w,y+h), Offset(x,y+h/4), paint);
    //canvas.drawLine(Offset(x,y+h/5), Offset(x+w,y+h), paint);
    //canvas.drawLine(Offset(x+w,y+h/5), Offset(x,y+h), paint);
    //canvas.drawLine(Offset(x+w,y+h), Offset(x,y+w/2), paint);
    //canvas.drawLine(Offset(x,y+h), Offset(x+y,y+w/2), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
  
}