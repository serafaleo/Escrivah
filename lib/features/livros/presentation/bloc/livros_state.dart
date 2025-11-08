part of 'livros_bloc.dart';

@immutable
sealed class LivrosState {
  const LivrosState();
}

final class LivrosInitial extends LivrosState {}

final class LivrosLoadingState extends LivrosState {}

final class LivrosFailedState extends LivrosState {
  final Failure failure;

  const LivrosFailedState({required this.failure});
}

final class ListaDeLivrosCarregadaState extends LivrosState {
  final List<Livro> livros;

  const ListaDeLivrosCarregadaState({required this.livros});
}

final class InformacoesDoLivroCarregadasState extends LivrosState {
  final Livro livro;

  const InformacoesDoLivroCarregadasState({required this.livro});
}
