import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/Services/auth_services.dart';
import 'package:flutterapp/Services/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../rounded_button.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email = '';
  String _matricula = '';
  String _password = '';
  String _name = '';
  String _apellidopaterno = '';
  String _apellidomaterno = '';
  String _folio = '';
  String carrera = 'Ing Arquitectura';
  String _genero1 = 'Masculino'; // valor seleccionado en el dropdown
  List<String> carreras = [
    'Ing Arquitectura',
    'Lic. en Administración',
    'Contador Público',
    'Ing. Aeronáutica',
    'Ing. Ambiental',
    'Ing. Biomédica',
    'Ing. Bioquímica',
    'Ing. Civil',
    'Ing. en Diseño Industrial',
    'Ing. Electromecánica',
    'Ing. Electrónica',
    'Ing. en Gestión Empresarial',
    'Ing. Informática',
    'Ing. en Logística',
    'Ing. en Nanotecnología',
    'Ing. en Sistemas Computacionales',
    'Ing. Industrial',
    'Ing. Química',
    'Ing. Mecánica',
  ];

  List<String> _Generos = ['Masculino', 'Femenino'];

  createAccountPressed() async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
    if (emailValid) {
      http.Response response = await AuthServices.register(
          _folio,
          _matricula,
          _name,
          _email,
          _password,
          carrera,
          _apellidopaterno,
          _apellidomaterno,
          _genero1);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first[0]);
      }
    } else {
      errorSnackBar(context, 'Contraseña Incorrecta');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Registrar',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Folio',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (value) {
                _folio = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Numero De Control',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (value) {
                _matricula = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                hintText: 'Nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (value) {
                _name = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                hintText: 'Apellido Paterno',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (value) {
                _apellidopaterno = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                hintText: 'Apellido Materno',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (value) {
                _apellidomaterno = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Correo Electronico',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (value) {
                _email = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (value) {
                _password = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              value: carrera,
              decoration: InputDecoration(
                hintText: 'Carrera',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  carrera = value!;
                });
              },
              items: carreras.map((carrera) {
                return DropdownMenuItem<String>(
                  value: carrera,
                  child: Text(carrera),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              value: _genero1,
              decoration: InputDecoration(
                hintText: 'Género',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _genero1 = value!;
                });
              },
              items: _Generos.map((genero) {
                return DropdownMenuItem<String>(
                  value: genero,
                  child: Text(genero),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedButton(
              btnText: 'Crear Cuenta',
              onBtnPressed: () => createAccountPressed(),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('¿Ya tienes una cuenta? '),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const LoginScreen(),
                        ));
                  },
                  child: const Text(
                    'Inicia Sesión',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
