import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'register_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _username = '';
  int _selectedIndex = 0;
  int index = 0;

  List<dynamic> examenes = [];

  Future<List<dynamic>> getExamenesDisponibles() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.77:8000/api/auth/exam'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Error al obtener los exámenes disponibles: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    _getUsername();
    getExamenesDisponibles().then((examenes) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String username = prefs.getString('username') ?? '';

      final inscritosResponse = await http.get(
          Uri.parse('http://192.168.1.77:8000/api/auth/inscritos/$username'));
      if (inscritosResponse.statusCode == 200) {
        final inscritos = List<int>.from(json.decode(inscritosResponse.body));
        final examenesDisponibles = examenes
            .where((examen) => !inscritos.contains(examen['idexamen']))
            .toList();
        setState(() {
          this.examenes = examenesDisponibles;
        });
      } else {
        throw Exception(
            'Error al obtener los exámenes inscritos: ${inscritosResponse.statusCode}');
      }
    });
  }

  void _getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? '';
    setState(() {
      _username = username;
    });
  }

  Future<void> cancelarCita(String username) async {
    final url = Uri.parse(
        'http://192.168.1.77:8000/api/auth/cancelarexamen/$_username');
    final response = await http.delete(url, body: {'username': username});

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Cita Eliminada'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Se ha producido un Error Inténtelo más Tarde'),
        ),
      );
    }
  }

  Future<List<dynamic>> exameninscrito() async {
    final response = await http.get(Uri.parse(
        'http://192.168.1.77:8000/api/auth/exameninscrito/$_username'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 404) {
      return [];
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Error al obtener los exámenes disponibles: ${response.statusCode}'),
        ),
      );

      throw Exception(
          'Error al obtener los exámenes disponibles: ${response.statusCode}');
    }
  }

  void inscribirse(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username') ?? '';
    final examen = examenes[index];
    final examId = examen['idexamen'];
    final fechaexamen = examen['fechaexamen'];

    print("El username es: $username");

    final response = await http.post(
      Uri.parse('http://192.168.1.77:8000/api/auth/inscribirse'),
      body: {
        'usuario_id': username,
        'examen_id': examId.toString(),
        'fecha_examen': fechaexamen.toString(),
      },
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Te has inscrito correctamente en el examen $username'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(' El examen excedio el limite de capacidad de alumnos'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido - $_username'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Bienvenido $_username',
                  style: TextStyle(fontSize: 35, color: Colors.white)),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.assignment_turned_in),
              title: Text('Examen Inscrito'),
              onTap: () async {
                final examenInscrito = await exameninscrito();
                final firstExamenInscrito = examenInscrito.first;

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Examen Inscrito'),
                      content: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'ID del examen: ${firstExamenInscrito['examen_id']}'),
                            Text(
                                'Usuario: ${firstExamenInscrito['usuario_id']}'),
                            Text(
                                'Fecha del examen: ${firstExamenInscrito['fecha_examen']}'),
                            Text(
                                'Hora Del Examen: ${firstExamenInscrito['hora']}'),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            cancelarCita(_username);
                            Navigator.pop(context);
                          },
                          child: Text('Eliminar Cita'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Aceptar'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Cerrar Sesion'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const RegisterScreen(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Editar Perfil'),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Folio',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onChanged: (value) {
                              // Actualizar el valor del folio
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Correo Electronico',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onChanged: (value) {
                              // Actualizar el valor del correo electrónico
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Contraseña',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onChanged: (value) {
                              // Actualizar el valor de la contraseña
                            },
                          ),
                          SizedBox(height: 20.0),
                          ElevatedButton(
                            child: Text('Guardar Cambios'),
                            onPressed: () {
                              // Guardar los cambios en el perfil
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: examenes.isNotEmpty
            ? ListView.builder(
                padding: EdgeInsets.all(16.0),
                itemCount: examenes.length,
                itemBuilder: (context, index) {
                  final examen = examenes[index];
                  return Dismissible(
                    key: Key(examen['idexamen'].toString()),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.startToEnd) {
                        inscribirse(index);
                      }
                    },
                    background: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Icon(Icons.check, color: Colors.white),
                        ),
                      ),
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0)),
                      elevation: 10,
                      child: ListTile(
                        leading: Icon(Icons.event),
                        title: Text(examen['examendes'],
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fecha De Examen: ${examen['fechaexamen']}',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              'Hora De Examen: ${examen['hora']}',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              'Capacidad: ${examen['capacidad']}',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Text('No hay examenes disponibles intente mas tarde'),
      ),
    );
  }
}
