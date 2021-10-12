part of 'pregunta_bloc.dart';


@immutable
abstract class PreguntaEvent {}

class CargarPreguntas extends PreguntaEvent {

  final List<Pregunta> preguntas;

  CargarPreguntas({this.preguntas});

}