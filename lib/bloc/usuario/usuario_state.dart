 part of 'usuario_bloc.dart';

 class UsuarioState {

  final bool existeUsuario;
  final Usuario usuario;

  UsuarioState({Usuario usuario}):
    usuario = usuario ?? null,
    existeUsuario = (usuario != null) ? true : false;

  UsuarioState copyWith({Usuario usuario}) => UsuarioState(
    usuario: usuario ?? this.usuario
  );

  UsuarioState estadoInicial() => UsuarioState(usuario: null);

 }