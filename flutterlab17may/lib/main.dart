import 'package:flutter/material.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Puente(),
    );
  }
}

class Puente extends StatefulWidget{
  @override
  DemoUbi createState() => DemoUbi();
}

class DemoUbi extends State<Puente> {
  var xx=0.0,yy=0.0;
  bool ft=false;
  int pos;
  var c1,c2;
  int p1,p2;
  List<Color> colores=[Colors.red,Colors.yellow,Colors.green,Colors.blue,Colors.purple];
  List<double> px=[-1,-1,-1,-1,-1];
  List<double> py=[-1,-1,-1,-1,-1];
  Widget Ventana(Color col, double w,double h,double x,double y,int pos){
    return Align(
      alignment: Alignment(x, y),
      child: Container(
        color: col,
        width: w,
        height: h,
        child: GestureDetector(
          onTap: (){
            setState(() {
              if(ft){
                c2=col;
                ft=false;
                p2=pos;
                Color aux=colores[p1];
                colores[p1]=c2;
                colores[p2]=aux;
              }
              else{
                c1=col;
                ft=true;
                p1=pos;
              }
            });
          },
          onDoubleTap: (){
            setState(() {
              ft=false;
              px[pos]=1;
            });
          },
          onLongPress: (){
            setState(() {
              ft=false;
              px[pos]=1;
              py[pos]=1;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Demo Expanded"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.home), onPressed: (){
              setState(() {
                for(int i=0;i<5;i++){
                  px[i]=-1;
                  py[i]=-1;
                }
              });
            }
            ),
            IconButton(icon: Icon(Icons.plus_one), onPressed: (){
              setState(() {
                for(int i=0;i<5;i++){
                  px[i]=0;
                  py[i]=0;
                }
              });
            }
            ),
          ],
        ),
        body: Container(
          color: Colors.lime,
          child: Stack(
            children: <Widget>[
              Ventana(colores[0],250,250,px[0],py[0],0),
              Ventana(colores[1],200,200,px[1],py[1],1),
              Ventana(colores[2],150,150,px[2],py[2],2),
              Ventana(colores[3],100,100,px[3],py[3],3),
              Ventana(colores[4],50,50,px[4],py[4],4),
            ],
          ),
        )
    );
  }
}