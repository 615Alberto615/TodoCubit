import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_todo2/cubit/task_cubit.dart'; // Importa el archivo task_cubit.dart
import 'package:proyecto_todo2/login.dart';

import 'cubit/etiquetas_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<EtiquetasCubit>(create: (context) => EtiquetasCubit([''])),
          // Agrega el provider para TaskCubit
          BlocProvider<TaskCubit>(
            create: (context) => TaskCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Practica 2 TodoList",
          home: loginp(),
        ));
  }
}
