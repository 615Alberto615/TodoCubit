import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/etiquetas_cubit.dart';
import '../login.dart';

class AddEtiqueta extends StatefulWidget {
  const AddEtiqueta({super.key});

  @override
  State<AddEtiqueta> createState() => _AddEtiquetaState();
}

class _AddEtiquetaState extends State<AddEtiqueta> {
  final _addTextController = TextEditingController();

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
              controller: _addTextController,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final newValor = _addTextController.text;
                    context.read<EtiquetasCubit>().addElemeto(newValor);
                    Navigator.pop(context, newValor);
                  },
                  child: Text("Agregar"),
                  style: ElevatedButton.styleFrom(
                    primary: HexColor.fromHex('#e6e6fa'),
                    onPrimary: Colors.black,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar"),
                    style: ElevatedButton.styleFrom(
                      primary: HexColor.fromHex('#e6e6fa'),
                      onPrimary: Colors.black,
                    )),
              ],
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
