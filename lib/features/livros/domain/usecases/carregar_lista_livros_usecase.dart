import 'package:escrivah/core/errors/failure.dart';
import 'package:escrivah/core/service_locator.dart';
import 'package:escrivah/core/usecase/usecase.dart';
import 'package:escrivah/features/livros/domain/entities/livro.dart';
import 'package:escrivah/features/livros/domain/repositories/livros_repository.dart';
import 'package:fpdart/fpdart.dart';

final class CarregarListaLivrosUseCase implements UseCase<List<Livro>, Unit> {
  @override
  Future<Either<Failure, List<Livro>>> call(Unit params) async {
    return await sl<LivrosRepository>().carregarListaDeLivros();
  }
}
