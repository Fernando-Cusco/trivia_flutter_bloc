part of 'pregunta_bloc.dart';

class PreguntaState {
  final Pregunta pregunta;  //detalle de una pregunta
  final List<Pregunta> preguntas; // lista de preguntas

  PreguntaState({Pregunta pregunta, List<Pregunta> preguntas}):
  pregunta = pregunta ?? null,
  preguntas = preguntas ?? [];

  



}