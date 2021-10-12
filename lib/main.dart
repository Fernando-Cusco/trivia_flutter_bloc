import 'package:bloc_patron/bloc/pregunta/bloc/pregunta_bloc.dart';
import 'package:bloc_patron/bloc/pregunta/views/preguntas_view.dart';
import 'package:bloc_patron/bloc/usuario/usuario_bloc.dart';
import 'package:bloc_patron/pages/pagina1_page.dart';
import 'package:bloc_patron/pages/pagina2_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UsuarioBloc()),
        BlocProvider(create: (_) => PreguntaBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, 
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': ( _ ) => Pagina1Page(),
          'pagina2': ( _ ) => Pagina2Page(),
          'preguntas': (_) => PreguntasView()
        },
      ),
    );
  }
}