// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_web_app/utils/lorem_ipsum.dart';

// ignore: non_constant_identifier_names
Widget EvaluationsPage() {
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
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    width: 400,
                    height: 200,
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
                    Text("Carreras"),
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
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        _enterButton()
                      ],
                    ),
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
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        _enterButton()
                      ],
                    ),
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
