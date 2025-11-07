import 'package:escrivah/core/errors/failure.dart';
import 'package:escrivah/features/livros/domain/entities/livro.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class LivrosRepository {
  Future<Either<Failure, List<Livro>>> carregarListaDeLivros();
}
