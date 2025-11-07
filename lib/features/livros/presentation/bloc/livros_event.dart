part of 'livros_bloc.dart';

@immutable
sealed class LivrosEvent {}

final class CarregarListaDeLivrosEvent extends LivrosEvent {}
