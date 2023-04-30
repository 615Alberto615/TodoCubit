import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/etiquetas_cubit.dart';
import '../login.dart';

class EditEtiqueta extends StatefulWidget {
  const EditEtiqueta({super.key});

  @override
  State<EditEtiqueta> createState() => _EditEtiquetaState();
}

class _EditEtiquetaState extends State<EditEtiqueta> {
  final TextEditingController _editTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EtiquetasCubit>().state;
    final actualValor = state.isNotEmpty ? state[0] : null;

    return Scaffold(
      backgroundColor: HexColor.fromHex('#FFEEEFF5'),
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Etiqueta Actual: $actualValor'),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: _editTextController,
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
              height: 16.0,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    final newEtiqueta = _editTextController.text;
                    if (newEtiqueta.isNotEmpty) {
                      context
                          .read<EtiquetasCubit>()
                          .editElemento(0, newEtiqueta);
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Actualizar Etiqueta"),
                  style: ElevatedButton.styleFrom(
                    primary: HexColor.fromHex('#e6e6fa'),
                    onPrimary: Colors.black,
                  )),
            )
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
