import 'package:flutter/material.dart';
import '/ui/task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_todo2/cubit/task_cubit.dart';

final _userController = TextEditingController();
final _passwordController = TextEditingController();

class loginp extends StatefulWidget {
  const loginp({super.key});
  @override
  State<loginp> createState() => _loginpState();
}

class _loginpState extends State<loginp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor.fromHex('#FFEEEFF5'),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Image.asset(
                'media/softlog.png',
                height: 300.0,
              ),
              SizedBox(
                height: 15.0,
              ),
              _userTextField(),
              SizedBox(
                height: 15.0,
              ),
              _passwordTextField(),
              SizedBox(
                height: 20.0,
              ),
              _loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 60.0),
            child: TextField(
              controller: _userController,
              decoration: InputDecoration(
                icon: Icon(Icons.person, color: HexColor.fromHex("20262E")),
                hintText: 'Username',
                labelText: "Username",
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
              onChanged: (value) {},
            ));
      },
    );
  }

  Widget _passwordTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 60.0),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock, color: HexColor.fromHex("20262E")),
                hintText: 'Password',
                labelText: "Password",
                hintStyle: TextStyle(
                  color: HexColor.fromHex("20262E"),
                ),
                labelStyle: TextStyle(
                  color: HexColor.fromHex("20262E"),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              onChanged: (value) {},
            ));
      },
    );
  }

  Widget _loginButton() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //crear el boton with out RaisedButton
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 100.0),
          child: ElevatedButton(
            child: Text('Iniciar Sesión',
                style: TextStyle(color: HexColor.fromHex("FFEEEFF5"))),
            style: ElevatedButton.styleFrom(
              primary: HexColor.fromHex('#20262E'),
              onPrimary: HexColor.fromHex("20262E"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () {
              // Llamar al TaskCubit y realizar una acción
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskPage()),
              );

              // Limpiar los campos de texto
              _userController.clear();
              _passwordController.clear();
            },
          ),
        );
      },
    );
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to true (default is true).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
