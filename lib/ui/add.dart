import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_todo2/cubit/etiquetas_cubit.dart';
import 'package:proyecto_todo2/cubit/task_cubit.dart';
import 'package:proyecto_todo2/modelo/modelo_task.dart';

import '../login.dart';
import '../ui/etiquetas.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String _nombre = '';
  String _etiqueta = '';
  String _etiquetaSeleccionada = '';
  DateTime? _fecha;
  bool _estado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor.fromHex('#FFEEEFF5'),
        appBar: _buildAppBar(),
        body: BlocBuilder<EtiquetasCubit, List<String>>(
          builder: (context, state) => Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            _nombre = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Tarea',
                          labelText: "Tarea",
                          hintStyle: TextStyle(
                            color: HexColor.fromHex("20262E"),
                          ),
                          labelStyle: TextStyle(
                            color: HexColor.fromHex("20262E"),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DropdownButton<String>(
                              value: _etiquetaSeleccionada,
                              items: context
                                  .watch<EtiquetasCubit>()
                                  .state
                                  .map(
                                    (etiqueta) => DropdownMenuItem<String>(
                                      value: etiqueta,
                                      child: Text(etiqueta),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _etiquetaSeleccionada = value!;
                                });
                              },
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EtiquetasScreen(),
                                  ),
                                );
                              },
                              icon: Icon(Icons.edit),
                            ),
                          ],
                        ),
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            _fecha = DateTime.tryParse(value);
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Fecha (YYYY-MM-DD)',
                          labelText: "Fecha (YYYY-MM-DD)",
                          hintStyle: TextStyle(
                            color: HexColor.fromHex("20262E"),
                          ),
                          labelStyle: TextStyle(
                            color: HexColor.fromHex("20262E"),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Estado'),
                            Switch(
                              activeColor: HexColor.fromHex("#A4D0A4"),
                              value: _estado,
                              onChanged: (value) {
                                setState(() {
                                  _estado = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            final task = Task(
                              DateTime.now().microsecondsSinceEpoch,
                              _nombre,
                              _etiquetaSeleccionada,
                              _fecha ?? DateTime.now(),
                              _estado,
                            );
                            context.read<TaskCubit>().saveTask(task);
                            Navigator.pop(context);
                          },
                          child: Text('Save'),
                          style: ElevatedButton.styleFrom(
                            primary: HexColor.fromHex('#FF5F5F52EE'),
                            onPrimary: Colors.white,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: HexColor.fromHex('#FFEEEFF5'),
      elevation: 0,
      automaticallyImplyLeading: false, //flechita hacia atras
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: HexColor.fromHex("FF3A3A3A"),
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('media/user.png'),
            ),
          ),
        ],
      ),
    );
  }
}
