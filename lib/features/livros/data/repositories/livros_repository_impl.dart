import 'package:escrivah/core/errors/failure.dart';
import 'package:escrivah/core/service_locator.dart';
import 'package:escrivah/features/livros/data/datasources/escriva_portal_datasource.dart';
import 'package:escrivah/features/livros/domain/entities/livro.dart';
import 'package:escrivah/features/livros/domain/repositories/livros_repository.dart';
import 'package:fpdart/fpdart.dart';

final class LivrosRepositoryImpl implements LivrosRepository {
  @override
  Future<Either<Failure, List<Livro>>> carregarListaDeLivros() async {
    try {
      final List<Livro> livros = await sl<EscrivaPortalDataSource>().carregarListaDeLivros();
      if (livros.isEmpty) {
        return Left<Failure, List<Livro>>(Failure('Nenhum livro encontrado.'));
      }
      return Right<Failure, List<Livro>>(livros);
    } catch (e) {
      return Left<Failure, List<Livro>>(Failure('Erro ao carregar a lista de livros: $e'));
    }
  }
}
