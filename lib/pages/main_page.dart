// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  openDrawer(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            maxOpacity: 0.3,
            spawnMinSpeed: 20.0,
            spawnMaxSpeed: 30.0,
          ),
        ),
        vsync: this,
        child: Center(
          child: Column(
            children: [_authButtons(), _mainOptions(), _searchBox()],
          ),
        ),
      ),
    );
  }

  Widget _authButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            "SVES",
            style: GoogleFonts.chelaOne(
              textStyle: TextStyle(fontSize: 20),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, right: 10, bottom: 10),
          child: Row(
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
                  backgroundColor:
                      MaterialStateProperty.all<Color?>(Colors.blue[900]),
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
    );
  }

  Widget _mainOptions() {
    return Container(
      padding: EdgeInsets.all(30),
      color: Colors.grey[300]!.withOpacity(0.5),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "¿ERES ALUMNO?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(200, 50)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Text(
                    "Dar un examen",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {},
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "¿ERES PROFESOR?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith(
                      (states) {
                        return states.contains(MaterialState.pressed)
                            ? Colors.grey[100]
                            : null;
                      },
                    ),
                    minimumSize: MaterialStateProperty.all(Size(250, 50)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Text(
                    "Crear una evaluación",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  onPressed: () {
                    // Navigator.pop(context);
                    Navigator.pushNamed(context, 'navigator');
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _searchBox() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.grey[200]!.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Row(
            children: [
              Container(
                width: 300,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Buscar...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 100,
              )
            ],
          ),
        ],
      ),
    );
  }
}
