import 'package:bloc_patron/bloc/pregunta/bloc/pregunta_bloc.dart';
import 'package:bloc_patron/bloc/pregunta/modelo/pregunta_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreguntasView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: (){
              BlocProvider.of<PreguntaBloc>(context).add(CargarPreguntas());
            }
          )
        ],
        title: Text('Trivia'),
      ),
      body: SafeArea(
        child: Container(
          child: BlocBuilder<PreguntaBloc, PreguntaState>(
            builder: (context, state) {
              if (state.preguntas.length > 0) {
                return ListaPreguntas(preguntas: state.preguntas);
              } else {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator()
                  ),
                );
              }
            }
          ),
        ),
      ),
    );
  }
}

class ListaPreguntas extends StatefulWidget {
  final List<Pregunta> preguntas;

  const ListaPreguntas({this.preguntas}) : super();

  @override
  _ListaPreguntasState createState() => _ListaPreguntasState();
}

class _ListaPreguntasState extends State<ListaPreguntas> {
  bool answer = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Preguntas', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          Divider(),
          ...widget.preguntas.map((e) => GestureDetector(onTap: () async {
            answer = await showDialog(context: context, builder: (_) {
              return DialogOpciones(pregunta: e);
            });
          }, child: ListTile( title: Text('${e.question}', style: TextStyle(color: (answer)? Colors.green: Colors.black),)))).toList(),
        ],
      ),
    );
  }
}

class DialogOpciones extends StatelessWidget {
  final Pregunta pregunta;

  const DialogOpciones({this.pregunta}) : super();

  @override
  Widget build(BuildContext context) {
    List<Map<String, bool>> respuestas = [];
    pregunta.incorrectAnswers.forEach((e) => {
      respuestas.add({e: false})
    });
    respuestas.add({pregunta.correctAnswer: true});
    final size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.only(top: 40),
        height: (respuestas.length == 2)? size.height * 0.25 : size.height * 0.37,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Text('Choose correct Answer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              ),
              ...respuestas.map((e) => ListTile(title: TextButton(
                child: Text('${e.keys}'),
                onPressed: (){
                  bool respuesta = e[pregunta.correctAnswer] ?? false;
                  Navigator.pop(context, respuesta);
                },
              ))).toList(),
            ],

          ),
        ),
      )
    );
  }
}