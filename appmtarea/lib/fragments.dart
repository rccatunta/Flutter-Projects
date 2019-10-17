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
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body:
      AnimatedContainer(
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
            title: Text("Centro", style: TextStyle(color: Colors.deepPurple)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_missed),
            title: Text("TopLeft", style: TextStyle(color: Colors.deepPurple)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_made),
            title: Text("TopRight", style: TextStyle(color: Colors.deepPurple)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_received),
            title: Text("Bottom\nLeft", style: TextStyle(color: Colors.deepPurple)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            title: Text("Bottom\nRight", style: TextStyle(color: Colors.deepPurple)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_downward),
            title: Text("Bottom\nCenter", style: TextStyle(color: Colors.deepPurple)),
          ),
        ],
        onTap: _function,
      ),
    );
  }
}

Widget pelota(){
  return Container(
    width: 60.0,
    height: 60.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
      gradient: LinearGradient(
        begin: Alignment.center,
        end: Alignment.bottomCenter,
        stops: [0.0, 0.9],
        colors: [
          Colors.cyanAccent,
          Colors.blue,
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
        backgroundColor: Colors.deepPurple,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          width: 80,
                          height: 50,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.center,
                                  end: Alignment.bottomCenter,
                                  stops: [0.0, 0.5],
                                  colors: [
                                    Colors.purpleAccent,
                                    Colors.purple,
                                  ]
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 5)
                              ]),
                          child: Center(
                            child: TextFormField(
                              controller: myNum1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: "Num 1",
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          )
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
                                  Colors.purpleAccent,
                                  Colors.purple,
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
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Num 2",
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
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [0.0, 0.1, 0.6, 0.9, 0.12],
                                colors: [
                                  Colors.yellow,
                                  Colors.yellowAccent,
                                  Colors.purple,
                                  Colors.purple,
                                  Colors.purple,
                                ]
                            ),
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 5)
                            ]),

                        child: FlatButton(
                          child: Text('+',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                          onPressed: (){
                            int s = _suma(myNum1, myNum2);
                            myRes.text = s.toString();
                          },

                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          padding: EdgeInsets.all(10.0),
                        ),
                      ),

                      Container(
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [0.0, 0.3, 0.6, 0.9, 0.12],
                                colors: [
                                  Colors.yellow,
                                  Colors.yellowAccent,
                                  Colors.purple,
                                  Colors.purple,
                                  Colors.purple,
                                ]
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 5)
                            ]),
                        child: FlatButton(
                          child: Text('-',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                          onPressed: (){
                            int r = _resta(myNum1, myNum2);
                            myRes.text = r.toString();
                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          padding: EdgeInsets.all(10.0),
                        ),
                      ),

                      Container(
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [0.0, 0.5, 0.7, 0.9, 0.12],
                                colors: [
                                  Colors.yellow,
                                  Colors.yellowAccent,
                                  Colors.purple,
                                  Colors.purple,
                                  Colors.purple,
                                ]
                            ),
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 5)
                            ]),
                        child: FlatButton(
                          child: Text('*',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                          onPressed: (){
                            int m = _multiplicacion(myNum1, myNum2);
                            myRes.text = m.toString();
                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          padding: EdgeInsets.all(10.0),
                        ),
                      ),

                      Container(
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [0.0, 0.6, 0.8, 0.10, 0.12],
                                colors: [
                                  Colors.yellow,
                                  Colors.yellowAccent,
                                  Colors.purple,
                                  Colors.purple,
                                  Colors.purple,
                                ]
                            ),
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 5)
                            ]),
                        child: FlatButton(
                          child: Text('/',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                          onPressed: (){
                            double d = _division(myNum1, myNum2);
                            myRes.text = d.toString();
                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          padding: EdgeInsets.all(10.0),
                        ),
                      ),

                      Container(
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                stops: [0.0, 0.7, 0.9, 0.11],
                                colors: [
                                  Colors.yellow,
                                  Colors.yellowAccent,
                                  Colors.purple,
                                  Colors.purple,
                                ]
                            ),
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 5)
                            ]),
                        child: FlatButton(
                          child: Text('C',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                          onPressed: (){
                            myNum1.clear();
                            myNum2.clear();
                            myRes.text = ('');
                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          padding: EdgeInsets.all(10.0),
                        ),
                      ),
                    ]),

                Container(
                  width: 150,
                  height: 50,
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 0.3, 0.6, 0.9, 0.12],
                          colors: [
                            Colors.white,
                            Colors.white,
                            Colors.grey,
                            Colors.purple,
                            Colors.purple,
                          ]
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 5)
                      ]),
                  child: TextField(
                    enabled: false,
                    controller: myRes,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
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
        backgroundColor: Colors.deepPurple,
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