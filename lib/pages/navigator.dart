// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_web_app/pages/student/evaluations_page.dart';
import 'package:study_web_app/pages/student/grades_page.dart';
import 'package:study_web_app/utils/placeholder.dart';
import 'package:study_web_app/utils/global.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 1;
  bool isLoggedIn = false;
  List<Widget> routes = [
    viewPlaceholder(),
    evaluationsPage(),
    gradesPage(),
    ...List.generate(8, (index) {
      return viewPlaceholder();
    })
  ];
  List routeNames = [
    "Inicio",
    "Evaluaciones",
    "Calificaciones",
    "Grupos",
    "Comentarios",
    "Cursos",
    "Estadísticas",
    "Reportes",
    "Tareas",
    "Materiales de estudio",
    "Ayuda"
  ];
  List headers = [
    "PÁGINA PRINCIPAL",
    "REALIZAR EVALUACIÓN",
    "VER CALIFICACIONES",
    "GRUPOS",
    "COMENTARIOS",
    "CURSOS",
    "ESTADÍSTICAS",
    "REPORTES",
    "TAREAS",
    "MATERIALES DE ESTUDIO",
    "AYUDA"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          _authButtons(headers[_selectedIndex]),
          Expanded(
            child: Row(
              children: [
                SingleChildScrollView(child:  Column(
                  children: List.generate(routeNames.length, (index) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: index == _selectedIndex
                                  ? Colors.blue
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                            child: InkWell(
                              child: Center(
                                child: Text(
                                  routeNames[index],
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
                        )
                      ],
                    );
                  }),
                ),),
                VerticalDivider(thickness: 1, width: 1),
                Expanded(child: routes[_selectedIndex])
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _authButtons(String text) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide())),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              text,
              style: GoogleFonts.chelaOne(
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, right: 10, bottom: 10),
            child: Get.find<GlobalController>().loggedIn.value
                ? Text("¡Bienvendidx, usuarix!",
                    style: GoogleFonts.dosis(color: Colors.black, fontSize: 17),
                    textAlign: TextAlign.left)
                : Row(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        child: const Text("Iniciar sesión"),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color?>(
                              Colors.blue[900]),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        child: const Text("Registrarse"),
                        onPressed: () {},
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
