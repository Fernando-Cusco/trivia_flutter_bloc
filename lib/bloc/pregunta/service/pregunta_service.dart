
import 'package:bloc_patron/bloc/pregunta/modelo/pregunta_model.dart';
import 'package:dio/dio.dart';
class PreguntaService {

  final Dio _dio = Dio();

  Future<List<Pregunta>> obtenerPreguntas() async {
    List<Pregunta> preguntas = [];
    Response res = await _dio.get('https://opentdb.com/api.php?amount=10&category=21');
    for (var item in res.data['results']) {
      Pregunta pregunta = Pregunta.fromJson(item);
      preguntas.add(pregunta);
    }
    return preguntas;
  }

}