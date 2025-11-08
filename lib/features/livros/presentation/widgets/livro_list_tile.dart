import 'package:escrivah/core/constants/routes.dart';
import 'package:escrivah/features/livros/domain/entities/livro.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LivroListTile extends StatelessWidget {
  final Livro livro;

  const LivroListTile({super.key, required this.livro});

  @override
  Widget build(BuildContext context) {
    const double paddingValue = 16.0;
    return Padding(
      padding: const EdgeInsets.only(bottom: paddingValue),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 3,
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              livro.titulo,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          subtitle: Text(
            livro.descricao,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic, color: Colors.grey[700]),
          ),
          onTap: () {
            context.push(Routes.livro, extra: livro);
          },
        ),
      ),
    );
  }
}
