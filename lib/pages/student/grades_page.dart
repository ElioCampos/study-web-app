// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

Map<String, double> grades = {
  "Respuestas correctas": 16,
  "Respuestas incorrectas": 4,
};

Map<String, double> exams = {
  "Exámenes aprobados": 8,
  "Exámenes desaprobados": 1,
};

List<Color> colorList = [
  Colors.green[300]!,
  Colors.red[300]!,
];

Widget gradesPage() {
  return Container(
    padding: EdgeInsets.all(10),
    child: SingleChildScrollView(
      child: Column(
        children: [_firstRow(), SizedBox(height: 20), _secondRow()],
      ),
    ),
  );
}

Widget _detailsButton() {
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
      "Ver detalles",
      style: GoogleFonts.dosis(
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _firstRow() {
  return Row(
    children: [
      Expanded(
        flex: 3,
        child: Container(
          height: 250,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue[400],
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Text(
            "Detalle de últimas calificaciones",
            style: GoogleFonts.dosis(
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 2,
        child: Container(
          height: 250,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue[400],
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Text(
            "Calificaciones en curso",
            style: GoogleFonts.dosis(
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _secondRow() {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 250,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: PieChart(
                dataMap: grades,
                colorList: colorList,
                chartType: ChartType.ring,
                chartValuesOptions: ChartValuesOptions(
                  showChartValuesInPercentage: true,
                  decimalPlaces: 0,
                ),
              ),),
              _detailsButton()
            ],
          ),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        child: Container(
          height: 250,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: PieChart(
                  dataMap: exams,
                  colorList: colorList,
                  chartValuesOptions: ChartValuesOptions(
                    showChartValuesInPercentage: true,
                    decimalPlaces: 0,
                  ),
                ),
              ),
              _detailsButton()
            ],
          ),
        ),
      ),
    ],
  );
}
