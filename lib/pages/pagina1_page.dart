import 'package:bloc_patron/bloc/pregunta/bloc/pregunta_bloc.dart';
import 'package:bloc_patron/bloc/pregunta/modelo/pregunta_model.dart';
import 'package:bloc_patron/bloc/usuario/usuario_bloc.dart';
import 'package:bloc_patron/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final preguntaBloc = BlocProvider.of<PreguntaBloc>(context);
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context, listen: true);

    preguntaBloc.add(CargarPreguntas());
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (usuarioBloc.state.existeUsuario) ? () {
              usuarioBloc.add(BorrarUsuario());
            } : null
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: BlocBuilder<UsuarioBloc, UsuarioState>(
              builder: (context, state) {
                if (state.existeUsuario) {
                  return InformacionUsuario(state.usuario);
                } else {
                  return Container(
                    child: Center(
                      child: Text('No hay un usuario cargado'),
                    ),
                  );
                }
              }
            ),
          ),
          Container(
            child: TextButton(
              child: Text('Preguntas'),
              onPressed: (){
                preguntaBloc.add(CargarPreguntas());
                Navigator.pushNamed(context, 'preguntas');
              }
            ),
          )
        ],
      ),
     floatingActionButton: FloatingActionButton(
       child: Icon( Icons.accessibility_new ),
       onPressed: () => Navigator.pushNamed(context, 'pagina2')
     ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario(this.usuario);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          Divider(),

          ListTile( title: Text('Nombre: ${usuario.nombre}') ),
          ListTile( title: Text('Edad: ${usuario.edad}') ),

          Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          Divider(),
          ...usuario.profesiones.map((e) => ListTile( title: Text('$e') )).toList(),
        ],
      ),
    );
  }
}
