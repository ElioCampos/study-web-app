// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_web_app/utils/placeholder.dart';

class MakeEvaluationPage extends StatefulWidget {
  const MakeEvaluationPage({Key? key}) : super(key: key);

  @override
  _MakeEvaluationPageState createState() => _MakeEvaluationPageState();
}

class _MakeEvaluationPageState extends State<MakeEvaluationPage> {
  final canvasKey = GlobalKey();
  int _selectedIndex = 0;
  int _selectedCanvasColor = 0;
  int _selectedContainerColor = 0;
  Offset _position = Offset(0, 0);
  Offset _canvasPosition = Offset(0, 0);
  List tabOptions = [
    "Inicio",
    "Pregunta",
    "Diseño",
    "Grupos",
    "Opciones",
    "Gráficos",
    "Cursos",
    "Ejecución",
    "Tiempo",
    "Ventana",
    "Vista",
  ];
  List objects = [];
  String addedText = '';
  final List _colorList = [
    Colors.white,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.blue,
    Colors.cyan,
    Colors.green,
    Colors.brown,
    Colors.grey,
    Colors.black,
  ];
  void calculateSizeAndPosition() =>
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        final RenderBox box =
            canvasKey.currentContext!.findRenderObject() as RenderBox;
        setState(() {
          _canvasPosition = box.localToGlobal(Offset.zero);
          print("GAAAAAAAAAAAAA");
          print(box.localToGlobal(Offset.zero));
        });
      });
  @override
  void initState() {
    super.initState();
    calculateSizeAndPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              tabOptions.length,
              (index) {
                return Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: index == _selectedIndex
                          ? Colors.blue
                          : Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
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
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 400,
                  color: Colors.blue[200],
                  child: Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: _draggableContainer(),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Wrap(
                              children: List.generate(
                                _colorList.length,
                                (index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selectedContainerColor = index;
                                      });
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      color: _colorList[index],
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: "Añadir texto...",
                                  border: InputBorder.none,
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    addedText = text;
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 10),
                            _draggableTextButton(addedText),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ...List.generate(
                        6,
                        (index) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            child: optionsPlaceholder(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                key: canvasKey,
                flex: 3,
                child: Container(
                  height: 400,
                  color: _colorList[_selectedCanvasColor],
                  child: DragTarget<Container>(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return Stack(
                        children: [...objects],
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.all(10),
                    height: 400,
                    color: Colors.blue[200],
                    child: Column(
                      children: [
                        Wrap(
                          children: List.generate(
                            _colorList.length,
                            (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    _selectedCanvasColor = index;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  color: _colorList[index],
                                ),
                              );
                            },
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                objects.removeLast();
                              });
                            },
                            icon: Icon(Icons.undo))
                      ],
                    )),
              ),
            ],
          ),
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
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 3,
                          offset: Offset(2, 3),
                        ),
                      ],
                    ),
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
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 3,
                          offset: Offset(2, 3),
                        ),
                      ],
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

  Widget _draggableContainer() {
    return LongPressDraggable<Container>(
      data: Container(
        width: 50,
        height: 50,
        color: _colorList[_selectedContainerColor],
      ),
      feedback: Container(
        decoration: BoxDecoration(
            color: _colorList[_selectedContainerColor],
            border: Border.all(color: Colors.blue)),
        width: 50,
        height: 50,
      ),
      child: Container(
        width: 50,
        height: 50,
        color: _colorList[_selectedContainerColor],
      ),
      onDragEnd: (DraggableDetails details) {
        if (details.wasAccepted) {
          setState(() {
            _position = details.offset;
            objects.add(
              Positioned(
                left: _position.dx - _canvasPosition.dx,
                top: _position.dy - _canvasPosition.dy,
                child: Container(
                  width: 50,
                  height: 50,
                  color: _colorList[_selectedContainerColor],
                ),
              ),
            );
          });
        }
      },
    );
  }

  Widget _draggableTextButton(String text) {
    return LongPressDraggable<Container>(
      data: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Text(text),
      ),
      feedback: Material(
        child: Container(
          color: Colors.blue.withOpacity(0.2),
          padding: EdgeInsets.all(10),
          child: Text(text),
        ),
      ),
      child: InkWell(
        onTap: () {},
        child: Icon(Icons.touch_app),
      ),
      onDragEnd: (DraggableDetails details) {
        if (details.wasAccepted) {
          setState(() {
            _position = details.offset;
            objects.add(
              Positioned(
                left: _position.dx - _canvasPosition.dx,
                top: _position.dy - _canvasPosition.dy,
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Flexible(
                    child: Text(text),
                  ),
                ),
              ),
            );
          });
        }
      },
    );
  }
}
