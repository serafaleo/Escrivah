part of 'livros_bloc.dart';

@immutable
sealed class LivrosEvent {
  const LivrosEvent();
}

final class CarregarListaDeLivrosEvent extends LivrosEvent {}

final class CarregarInformacoesDoLivroEvent extends LivrosEvent {
  final Livro livro;

  const CarregarInformacoesDoLivroEvent({required this.livro});
}
