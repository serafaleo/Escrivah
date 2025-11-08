import 'package:escrivah/features/livros/domain/entities/livro.dart';
import 'package:escrivah/features/livros/presentation/bloc/livros_bloc.dart';
import 'package:escrivah/features/livros/presentation/widgets/livro_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListaLivrosPage extends StatelessWidget {
  const ListaLivrosPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double paddingValue = 16.0;
    return BlocProvider<LivrosBloc>(
      create: (BuildContext context) => LivrosBloc()..add(CarregarListaDeLivrosEvent()),
      child: BlocConsumer<LivrosBloc, LivrosState>(
        listener: (BuildContext context, LivrosState state) {
          if (state is LivrosFailedState) {
            state.failure.show(context);
          }
        },
        builder: (BuildContext context, LivrosState state) {
          if (state is ListaDeLivrosCarregadaState) {
            return Padding(
              padding: const EdgeInsets.only(left: paddingValue, right: paddingValue, top: paddingValue),
              child: ListView.builder(
                itemCount: state.livros.length,
                itemBuilder: (BuildContext context, int index) {
                  final Livro livro = state.livros[index];
                  return LivroListTile(livro: livro);
                },
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
