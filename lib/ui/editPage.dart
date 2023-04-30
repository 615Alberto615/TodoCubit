import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_todo2/cubit/task_cubit.dart';
import 'package:proyecto_todo2/modelo/modelo_task.dart';

import '../cubit/etiquetas_cubit.dart';
import '../login.dart';
import 'etiquetas.dart';

class EditPage extends StatefulWidget {
  final Task task;

  EditPage({required this.task});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController _nombreController;
  late String _etiquetaSeleccionada;
  late TextEditingController _fechaController;
  late bool _estado;

  @override
  void initState() {
    super.initState();

    _nombreController = TextEditingController(text: widget.task.nombre);
    _etiquetaSeleccionada = widget.task.etiqueta;
    _fechaController =
        TextEditingController(text: widget.task.fecha.toString());
    _estado = widget.task.estado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex('#FFEEEFF5'),
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(
                hintText: 'Nueva Etiqueta',
                labelText: "Nueva Etiqueta",
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
            SizedBox(
              height: 20.0,
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
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: _fechaController,
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
            SizedBox(
              height: 20.0,
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
                    widget.task.id,
                    _nombreController.text,
                    _etiquetaSeleccionada,
                    DateTime.tryParse(_fechaController.text) ?? DateTime.now(),
                    _estado,
                  );
                  context.read<TaskCubit>().actualizarTask(task);
                  Navigator.pop(context);
                },
                child: Text('Update'),
                style: ElevatedButton.styleFrom(
                  primary: HexColor.fromHex('#e6e6fa'),
                  onPrimary: Colors.black,
                )),
          ],
        ),
      ),
    );
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
