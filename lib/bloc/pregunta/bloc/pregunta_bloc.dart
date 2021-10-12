import 'package:bloc_patron/bloc/pregunta/modelo/pregunta_model.dart';
import 'package:bloc_patron/bloc/pregunta/service/pregunta_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'pregunta_event.dart';
part 'pregunta_state.dart';

class PreguntaBloc extends Bloc<PreguntaEvent, PreguntaState> {
  final PreguntaService _preguntaService = PreguntaService();
  List<Pregunta> preguntas;
  PreguntaBloc() : super(PreguntaState()) {
    on<CargarPreguntas>((event, emit) async => {
       preguntas = await _preguntaService.obtenerPreguntas(),
       emit(PreguntaState(preguntas: preguntas))
    });
  }

}