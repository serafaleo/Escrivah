import 'dart:async';

import 'package:escrivah/core/errors/failure.dart';
import 'package:escrivah/core/service_locator.dart';
import 'package:escrivah/features/livros/domain/entities/livro.dart';
import 'package:escrivah/features/livros/domain/usecases/carregar_informacoes_do_livro_usecase.dart';
import 'package:escrivah/features/livros/domain/usecases/carregar_lista_livros_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

part 'livros_event.dart';
part 'livros_state.dart';

class LivrosBloc extends Bloc<LivrosEvent, LivrosState> {
  LivrosBloc() : super(LivrosInitial()) {
    on<LivrosEvent>((LivrosEvent event, Emitter<LivrosState> emit) => emit(LivrosLoadingState()));
    on<CarregarListaDeLivrosEvent>(_onCarregarListaDeLivros);
    on<CarregarInformacoesDoLivroEvent>(_onCarregarInformacoesDoLivro);
  }

  FutureOr<void> _onCarregarListaDeLivros(CarregarListaDeLivrosEvent event, Emitter<LivrosState> emit) async {
    final Either<Failure, List<Livro>> result = await sl<CarregarListaLivrosUseCase>().call(unit);
    result.fold(
      (Failure failure) => emit(LivrosFailedState(failure: failure)),
      (List<Livro> livros) => emit(ListaDeLivrosCarregadaState(livros: livros)),
    );
  }

  FutureOr<void> _onCarregarInformacoesDoLivro(CarregarInformacoesDoLivroEvent event, Emitter<LivrosState> emit) async {
    final Either<Failure, Livro> result = await sl<CarregarInformacoesDoLivroUseCase>().call(event.livro);
    result.fold(
      (Failure failure) => emit(LivrosFailedState(failure: failure)),
      (Livro livro) => emit(InformacoesDoLivroCarregadasState(livro: livro)),
    );
  }
}
