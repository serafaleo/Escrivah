part of 'livros_bloc.dart';

@immutable
sealed class LivrosState {
  const LivrosState();
}

final class LivrosInitial extends LivrosState {}

final class LivrosLoadingState extends LivrosState {}

final class ListaDeLivrosCarregadaState extends LivrosState {
  final List<Livro> livros;

  const ListaDeLivrosCarregadaState({required this.livros});
}

final class ErroAoCarregarListaDeLivrosState extends LivrosState {
  final Failure failure;

  const ErroAoCarregarListaDeLivrosState({required this.failure});
}
