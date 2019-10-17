import 'package:flutter/material.dart';

class Balon extends StatefulWidget{
  @override
  Movimiento createState() => Movimiento();
}
class Movimiento extends State<Balon>{
  var _alignment = Alignment.center;
  _function(int index) {
    switch (index) {
      case 0:
        setState(() => _alignment = Alignment.center);
        break;
      case 1:
        setState(() =>_alignment = Alignment.topLeft);
        break;
      case 2:
        setState(() => _alignment = Alignment.topRight);
        break;
      case 3:
        setState(() => _alignment = Alignment.bottomLeft);
        break;
      case 4:
        setState(() => _alignment = Alignment.bottomRight);
        break;
      default:
        setState(() => _alignment = Alignment.bottomCenter);
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body:
      AnimatedContainer(
        //padding: EdgeInsets.all(5.0),
        duration: Duration(seconds: 3),
        alignment: _alignment,
        child: Container(
          child: pelota(),
        ),
      ),
      bottomNavigationBar:
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text("Cen", style: TextStyle(color: Colors.teal)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_missed),
            title: Text("TopLef", style: TextStyle(color: Colors.teal)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_made),
            title: Text("TopRig", style: TextStyle(color: Colors.teal)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_received),
            title: Text("BotLef", style: TextStyle(color: Colors.teal)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            title: Text("BotRigh", style: TextStyle(color: Colors.teal)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_downward),
            title: Text("BotCen", style: TextStyle(color: Colors.teal)),
          ),
        ],
        onTap: _function,
      ),
    );
  }
}
Widget pelota(){
  return Container(
    width: 80.0,
    height: 80.0,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
      gradient: LinearGradient(
        begin: Alignment.center,
        end: Alignment.bottomCenter,
        stops: [0.0, 0.9],
        colors: [
          Color(0xff006666),
          Color(0xff00cccc),
        ],
      ),
    ),
  );

}
class Calculadora extends StatelessWidget{

  var myNum1 = TextEditingController();
  var myNum2 = TextEditingController();
  var myRes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          width: 90,
                          height: 50,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.center,
                                  end: Alignment.bottomCenter,
                                  stops: [0.0, 0.5],
                                  colors: [
                                    Color(0xff009900),
                                    Color(0xff00cc00),
                                  ]
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 5)
                              ]),

                            child: TextFormField(
                              controller: myNum1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                hintText: "N1",
                              ),
                              keyboardType: TextInputType.number,
                            ),

                      ),

                      Container(
                        width: 90,
                        height: 50,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                                stops: [0.0, 0.5],
                                colors: [
                                  Color(0xff009900),
                                  Color(0xff00cc00),
                                ]
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 5)
                            ]),
                        child: TextFormField(
                          controller: myNum2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            hintText: "N2",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      )
                    ],
                  ),
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 60,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 5)
                            ]),
                        child: FlatButton(
                          child: Text('+'),
                          onPressed: (){
                            int s = _suma(myNum1, myNum2);
                            myRes.text = s.toString();
                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          color: Colors.white,
                          padding: EdgeInsets.all(10.0),
                        ),
                      ),

                      Container(
                        width: 60,
                        height: 60,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 5)
                            ]),
                        child: FlatButton(
                          child: Text('-'),
                          onPressed: (){
                            int r = _resta(myNum1, myNum2);
                            myRes.text = r.toString();
                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          color: Colors.white,
                          padding: EdgeInsets.all(10.0),
                        ),
                      ),

                      Container(
                        width: 60,
                        height: 60,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 5)
                            ]),
                        child: FlatButton(
                          child: Text('*'),
                          onPressed: (){
                            int m = _multiplicacion(myNum1, myNum2);
                            myRes.text = m.toString();
                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          color: Colors.white,
                          padding: EdgeInsets.all(10.0),
                        ),
                      ),

                      Container(
                        width: 60,
                        height: 60,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 5)
                            ]),
                        child: FlatButton(
                          child: Text('/'),
                          onPressed: (){
                            double d = _division(myNum1, myNum2);
                            myRes.text = d.toString();
                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          color: Colors.white,
                          padding: EdgeInsets.all(10.0),
                        ),
                      ),

                      Container(
                        width: 60,
                        height: 60,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 5)
                            ]),
                        child: FlatButton(
                          child: Text('C'),
                          onPressed: (){
                            myNum1.clear();
                            myNum2.clear();
                            myRes.text = ('');
                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          color: Colors.white,
                          padding: EdgeInsets.all(10.0),
                        ),
                      ),
                    ]),

                Container(
                  width: 150,
                  height: 80,
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 5)
                      ]),
                  child: TextField(
                    enabled: false,
                    controller: myRes,
                    style: TextStyle(fontSize: 20.0, color: Colors.black,
                    ),
                    decoration: InputDecoration(hintText:'Resultado'),
                  ),
                ),

              ],
            )
        )
    );
  }
}

class Primo extends StatelessWidget{
  var myTEC = TextEditingController();
  var myRespuesta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: AlertDialog(
          content: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Ingrese un numero'),
                  keyboardType: TextInputType.number,
                  controller: myTEC,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    RaisedButton(
                        child: Text('Primo'),
                        onPressed: (){
                          myRespuesta.text = _primo(myTEC);
                        }),

                    RaisedButton(
                        child: Text('Limpiar'),
                        onPressed: (){
                          myRespuesta.text = '';
                          myTEC.text = '';
                        }),

                  ],
                ),

                TextField(
                  enabled: false,
                  controller: myRespuesta,
                  style: TextStyle( color: Colors.black,
                  ),
                  decoration: InputDecoration(hintText:'Resultado'),
                )
              ],
            ),
          ),
        )
    );
  }
}

_suma(TextEditingController tec1, TextEditingController tec2)
{
  int n1 = int.parse(tec1.text.toString());
  int n2 = int.parse(tec2.text.toString());
  return n1+n2;
}

_resta(TextEditingController tec1, TextEditingController tec2)
{
  int n1 = int.parse(tec1.text.toString());
  int n2 = int.parse(tec2.text.toString());
  return n1-n2;
}

_multiplicacion(TextEditingController tec1, TextEditingController tec2)
{
  int n1 = int.parse(tec1.text.toString());
  int n2 = int.parse(tec2.text.toString());
  return n1*n2;
}

_division(TextEditingController tec1, TextEditingController tec2)
{
  double r=0;
  int n1 = int.parse(tec1.text.toString());
  int n2 = int.parse(tec2.text.toString());
  if(n2==0){
    r=0;
  }
  else {
    r=n1/n2;
  }
  return r;
}

_primo(TextEditingController tec){
  String msg ='4654654';
  String ts = tec.text.toString().trim();
  if(_vacio(ts)){
    msg = 'El campo no debe estar vacío';
  }else{
    int n = int.parse(ts);
    if(_esPrimo(n)){
      msg = '$n si es primo';
    }else{
      msg = '$n es primo';
    }
  }
  print(msg);
  return msg;
}


_vacio(String t){
  if(t.length==0)
    return true;
  else
    return false;
}

_esPrimo(int n){
  if(_cde(n)==2)
    return true;
  else
    return false;
}

_cde(int n){
  int c = 0, d ;
  for(d=1;d<=n;d++){
    if(n%d==0) c++;
  }
  return c;
}