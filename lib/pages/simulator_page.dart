// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_cube/flutter_cube.dart';

class SimulatorPage extends StatefulWidget {
  const SimulatorPage({Key? key}) : super(key: key);

  @override
  _SimulatorPageState createState() => _SimulatorPageState();
}

class _SimulatorPageState extends State<SimulatorPage> {
  int _selectedIndex = 0;
  double currentScale = 1;
  List tabOptions = [
    "Inicio",
    "Simulación",
    "Configuración",
    "Criterios de evaluación",
  ];
  Scene threeD = Scene();
  Object model = Object(fileName: 'assets/cube.obj');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              tabOptions.length,
              (index) {
                return Container(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: index == _selectedIndex
                          ? Colors.blue
                          : Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: InkWell(
                      child: Center(
                        child: Text(
                          tabOptions[index],
                          style: GoogleFonts.dosis(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: index == _selectedIndex
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.blue[100],
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: _buttons(1),
                  ),
                  VerticalDivider(),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: _buttons(2),
                  ),
                  VerticalDivider(),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: _buttons(3),
                  ),
                  VerticalDivider(),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: _buttons(4),
                  ),
                  VerticalDivider(),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: _buttons(5),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Container(
                    width: 200,
                    height: 500,
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              // threeD.world.remove(model);
                              // model = Object(fileName: 'assets/umbreon.obj');
                              // threeD.world.add(model);
                              threeD.world.transform.scale(5, 5, 5);
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text("Herramientas",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Divider(),
                        ...List.generate(11, (index) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            child: _placeholder(),
                          );
                        }),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 500,
                      child: Cube(
                        interactive: true,
                        onSceneCreated: (Scene scene) {
                          threeD = scene;
                          threeD.world.add(model);
                          threeD.world.transform.scale(3, 3, 3);
                        },
                      ),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buttons(int i) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red[200],
                  ),
                  SizedBox(height: 7),
                  Text(
                    "Opción $i.1",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red[200],
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "Opción $i.2",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(),
        Text(
          "Opciones $i",
          style: TextStyle(fontSize: 10, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _placeholder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 30,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 20,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 30,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
