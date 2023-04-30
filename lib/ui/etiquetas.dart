import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/etiquetas_cubit.dart';
import '../login.dart';
import 'addEti.dart';
import 'editEti.dart';

class EtiquetasScreen extends StatelessWidget {
  const EtiquetasScreen({super.key});

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
                child: Column(children: [
                  DropdownButton(
                    value: state.isNotEmpty ? state[0] : null,
                    items: state
                        .map(
                          (elemento) => DropdownMenuItem(
                            value: elemento,
                            child: Text(elemento),
                          ),
                        )
                        .toList(),
                    onChanged: (newValue) {
                      context
                          .read<EtiquetasCubit>()
                          .seleccionarValue(newValue!);
                    },
                  ),
                  SizedBox(
                    height: 80.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddEtiqueta(),
                            ));
                      },
                      child: Text("Nueva Etiqueta"),
                      style: ElevatedButton.styleFrom(
                        primary: HexColor.fromHex('#e6e6fa'),
                        onPrimary: Colors.black,
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<EtiquetasCubit>().deleteElemento();
                      },
                      child: Text("Elimina etiqueta"),
                      style: ElevatedButton.styleFrom(
                        primary: HexColor.fromHex('#e6e6fa'),
                        onPrimary: Colors.black,
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditEtiqueta(),
                            ));
                      },
                      child: Text("Editar etiqueta"),
                      style: ElevatedButton.styleFrom(
                        primary: HexColor.fromHex('#e6e6fa'),
                        onPrimary: Colors.black,
                      )),
                ]),
              )
            ],
          ),
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
