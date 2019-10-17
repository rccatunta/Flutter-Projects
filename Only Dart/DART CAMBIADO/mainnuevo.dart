import 'package:flutter/material.dart';
import 'package:flutter_app_tarea/fragments.dart' as fragments;

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
  MiPrograma createState() => MiPrograma();
}

class MiPrograma extends State<Puente> with TickerProviderStateMixin {

  TabController tabController;

  @override
  Widget build(BuildContext context) {

    tabController = TabController(length: 3, vsync: this);

    var tabBar = TabBar(
      tabs:[
        Tab(
          child:
          Text('Balón',
          ),
          icon: Icon(Icons.language,
            color: Colors.deepPurple,
          ),
        ),

        Tab(
          child: Text('Calculadora',
          ),
          icon: Icon(Icons.plus_one,
            color: Colors.deepPurple,
          ),
        ),

        Tab(
          child: Text('Primo',
          ),
          icon: Icon(Icons.filter_9,
            color: Colors.deepPurple,
          ),
        ),
      ],
      indicatorColor: Colors.white,
      controller: tabController,
    );

    return new DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Opciones'),
            backgroundColor: Colors.amber,
            bottom: tabBar,
          ),
          body: new TabBarView(
            controller: tabController,
            children: [
              fragments.Balon(),
              fragments.Calculadora(),
              fragments.Primo(),
            ],
          ),
        )
    );
  }
}