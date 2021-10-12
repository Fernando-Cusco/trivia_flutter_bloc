import 'dart:math';

import 'package:bloc_patron/bloc/usuario/usuario_bloc.dart';
import 'package:bloc_patron/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                if (!usuarioBloc.state.existeUsuario) {
                  final usuario = Usuario(edad: 25, nombre: 'Fernando Cusco', profesiones: ['Desarrollador']);
                  usuarioBloc.add(ActivarUsuario(usuario));
                } else {
                  print('Usuario ya esta activado');
                }
              }
            ),

            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                if (usuarioBloc.state.existeUsuario) {
                  final rnd = Random();
                  final edad = rnd.nextInt(100);
                  usuarioBloc.add(CambiarEdad(edad));
                } else {
                  print('No se encontro ningun usuario');
                }
              }
            ),

            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                if (usuarioBloc.state.existeUsuario) {
                  usuarioBloc.add(AgregarProfesion(profesion: 'nueva profesion'));
                } else {
                  print('No se encontro ningun usuario');
                }
              }
            ),

          ],
        )
     ),
   );
  }
}