// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_web_app/utils/lorem_ipsum.dart';

String _career = "Carreras";
Widget evaluationsPage() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          color: Colors.grey[200],
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/practico.png',
                        width: 400, height: 200, fit: BoxFit.fill),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 20,
                        color: Colors.white,
                      ),
                      Container(
                        width: 50,
                        height: 20,
                        color: Colors.grey,
                      ),
                      Container(
                        width: 50,
                        height: 20,
                        color: Colors.white,
                      ),
                      Container(
                        width: 50,
                        height: 20,
                        color: Colors.grey,
                      ),
                    ],
                  )
                ],
              ),
              Flexible(
                child: Container(
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
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Filtro"),
                    Text("Categorías"),
                    _careerDropdown(),
                    Text("Entornos de práctica")
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('assets/teorico.png',
                            width: 300, height: 200, fit: BoxFit.fill),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 200,
                          ),
                          Center(
                            child: _enterButton(),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text("Exámenes teóricos",
                          style: GoogleFonts.chelaOne(),
                          textAlign: TextAlign.left),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 400,
                        child: Text(loremIpsum,
                            style: GoogleFonts.dosis(),
                            maxLines: 20,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text("Exámenes prácticos",
                          style: GoogleFonts.chelaOne(),
                          textAlign: TextAlign.left),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 400,
                        child: Text(loremIpsum,
                            style: GoogleFonts.dosis(),
                            maxLines: 20,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('assets/teorico.png',
                            width: 300, height: 200, fit: BoxFit.fill),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 200,
                          ),
                          Center(
                            child: _enterButton(),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _enterButton() {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color?>(Colors.green),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    ),
    onPressed: () {},
    child: Text(
      "Ingresar",
      style: GoogleFonts.dosis(
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _careerDropdown() {
  return StatefulBuilder(builder: (context, setState) {
    return DropdownButton<String>(
      value: _career,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      underline: Container(
        height: 2,
        color: Colors.green,
      ),
      onChanged: (String? newValue) {
        setState(() {
          _career = newValue!;
        });
      },
      items: <String>[
        "Carreras",
        "Ing. Meca",
        "Ing. Software",
        "Ing. Sistemas",
        "Ing. Civil",
        "Medicina",
        "Arquitectura",
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  });
}
