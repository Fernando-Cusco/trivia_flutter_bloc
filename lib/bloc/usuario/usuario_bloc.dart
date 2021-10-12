import 'package:bloc/bloc.dart';
import 'package:bloc_patron/models/usuario.dart';
import 'package:meta/meta.dart';
part 'usuario_state.dart';

part 'usuario_event.dart';
 
class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  
  UsuarioBloc() : super(UsuarioState()) {
    on<ActivarUsuario>((event, emit) => {
      emit(state.copyWith(usuario: event.usuario)),
    });

    on<CambiarEdad>((event, emit) => {
      emit(state.copyWith(usuario: state.usuario.copyWith(edad: event.edad))),
    });

    on<AgregarProfesion>((event, emit) => {
      emit(state.copyWith(usuario: state.usuario.copyWith(profesiones: [event.profesion,...state.usuario.profesiones])))
    });

    on<BorrarUsuario>((event, emit) => {
      emit(state.estadoInicial())
    });

  }
  
}