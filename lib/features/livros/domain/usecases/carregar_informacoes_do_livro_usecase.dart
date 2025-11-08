import 'package:escrivah/core/errors/failure.dart';
import 'package:escrivah/core/service_locator.dart';
import 'package:escrivah/core/usecase/usecase.dart';
import 'package:escrivah/features/livros/domain/entities/livro.dart';
import 'package:escrivah/features/livros/domain/repositories/livros_repository.dart';
import 'package:fpdart/fpdart.dart';

final class CarregarInformacoesDoLivroUseCase implements UseCase<Livro, Livro> {
  @override
  Future<Either<Failure, Livro>> call(Livro livro) async {
    return await sl<LivrosRepository>().carregarInformacoesDoLivro(livro);
  }
}
