// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_web_app/utils/global.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  bool isLoggedIn = false;

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
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _mainOptions(),
                          _searchBox(),
                          SizedBox(height: 100,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              _authButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _authButtons() {
    return Container(
      color: Colors.grey[800]!.withOpacity(0.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, right: 10, bottom: 10),
            child: Get.find<GlobalController>().loggedIn.value
                ? Text("¡Bienvendidx, usuarix!",
                    style: GoogleFonts.dosis(color: Colors.white, fontSize: 17),
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
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, 'login');
                        },
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

  Widget _mainOptions() {
    return Container(
      padding: EdgeInsets.all(30),
      color: Colors.grey[300]!.withOpacity(0.5),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: _imageSlider()
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "¿ERES ALUMNO?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                      onPressed: () {
                        Navigator.pushNamed(context, 'navigator');
                      },
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "¿ERES PROFESOR?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                        Navigator.pushNamed(context, 'makeExam');
                      },
                    )
                  ],
                )
              ],
            ),
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

  Widget _imageSlider() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: 30),
          ImageSlideshow(
            width: 500,
            height: 300,
            initialPage: 0,
            indicatorColor: Colors.blue,
            indicatorBackgroundColor: Colors.grey,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'simulator');
                },
                child: Image.asset(
                  'assets/simu-1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'simulator');
                },
                child: Image.asset(
                  'assets/simu-2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'simulator');
                },
                child: Image.asset(
                  'assets/simu-3.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
            onPageChanged: (value) {
              print('Page changed: $value');
            },
            autoPlayInterval: 10000,
            isLoop: true,
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
