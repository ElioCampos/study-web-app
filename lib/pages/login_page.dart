// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:study_web_app/pages/main_page.dart';
import 'package:study_web_app/utils/global.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  TextEditingController emailText = TextEditingController();
  TextEditingController passText = TextEditingController();
  bool emailValid = true;
  bool passValid = true;
  int _selectedUser = 0;
  final List _userTypes = ["PROFESORES", "ESTUDIANTES"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.red[200]!,
              Colors.blue[300]!,
            ],
          ),
        ),
        child: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
              maxOpacity: 0.3,
              spawnMinSpeed: 10.0,
              spawnMaxSpeed: 20.0,
              baseColor: Colors.red,
            ),
          ),
          vsync: this,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_userTypes.length, (index) {
                          return Container(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                color: index == _selectedUser
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
                                    _userTypes[index],
                                    style: GoogleFonts.dosis(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: index == _selectedUser
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    _selectedUser = index;
                                  });
                                },
                              ),
                            ),
                          );
                        }),
                      ),
                      _loginForm(),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            emailText.text.isNotEmpty
                                ? emailValid = true
                                : emailValid = false;
                            passText.text.isNotEmpty
                                ? passValid = true
                                : passValid = false;
                          });
                          if (emailValid && passValid) {
                            Get.find<GlobalController>().loggedIn.value = true;
                            Navigator.pop(context);
                            Navigator.pushNamed(context, 'main');
                          }
                        },
                        child: Text("Iniciar sesión"),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      child: Theme(
        data: ThemeData(
          // brightness: Brightness.dark,
          // primarySwatch: Colors.red,
          inputDecorationTheme: InputDecorationTheme(
              // labelStyle: TextStyle(color: Colors.black, fontSize: 15),
              ),
        ),
        child: Container(
          padding: EdgeInsets.only(bottom: 40.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: emailText,
                decoration: InputDecoration(
                  labelText: "Correo electrónico",
                  errorText:
                      emailValid ? null : "Por favor, complete este campo",
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: passText,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  errorText:
                      passValid ? null : "Por favor, complete este campo",
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
