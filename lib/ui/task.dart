import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_todo2/cubit/task_cubit.dart';
import 'package:proyecto_todo2/modelo/modelo_task.dart';

import '../login.dart';
import 'add.dart';
import 'editPage.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex('#FFEEEFF5'),
      appBar: _buildAppBar(),
      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView(children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(
                            'Lista de Tareas',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: HexColor.fromHex('#20262E'),
                            ),
                          ),
                        ),
                        ...state.tasks
                            .map((task) => _tar(context, task))
                            .toList(),
                      ])),
                    ],
                  ))
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor.fromHex("FF5F5F52EE"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _tar(BuildContext context, Task task) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          onTap: () {
            // hacer algo al hacer tap en el elemento de la lista
          },
          title: Text(
            task.nombre,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: HexColor.fromHex("FF3A3A3A"),
              decoration: task.estado ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.etiqueta,
                style: TextStyle(
                  fontSize: 13,
                  color: HexColor.fromHex("FF3A3A3A"),
                  decoration: task.estado ? TextDecoration.lineThrough : null,
                ),
              ),
              Text(
                task.fecha.toString(),
                style: TextStyle(
                  fontSize: 12,
                  color: HexColor.fromHex("FF3A3A3A"),
                  decoration: task.estado ? TextDecoration.lineThrough : null,
                ),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: HexColor.fromHex("c5e4dc"),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  color: Colors.white,
                  iconSize: 18,
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Navegar a la pantalla de edición, pasando la tarea como argumento
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPage(task: task),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.symmetric(vertical: 12),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: HexColor.fromHex("FF5DA4040"),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  color: Colors.white,
                  iconSize: 18,
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    context.read<TaskCubit>().deleteTask(task);
                  },
                ),
              ),
            ],
          )),
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
