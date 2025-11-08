import 'package:escrivah/features/livros/domain/entities/livro.dart';
import 'package:escrivah/features/livros/presentation/bloc/livros_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LivroPage extends StatelessWidget {
  final Livro livro;

  const LivroPage({super.key, required this.livro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(livro.titulo),
      ),
      body: BlocProvider<LivrosBloc>(
        create: (BuildContext context) => LivrosBloc()..add(CarregarInformacoesDoLivroEvent(livro: livro)),
        child: BlocConsumer<LivrosBloc, LivrosState>(
          listener: (BuildContext context, LivrosState state) {
            if (state is LivrosFailedState) {
              state.failure.show(context);
            }
          },
          builder: (BuildContext context, LivrosState state) {
            if (state is InformacoesDoLivroCarregadasState) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Descrição Completa',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        addNewlinesAfterPeriod(livro.descricaoCompleta!),
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  String addNewlinesAfterPeriod(String text) {
    final RegExp regex = RegExp(r'\.(?![\s\d])');
    return text.replaceAll(regex, '.\n\n');
  }
}
