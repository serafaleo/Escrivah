import 'package:escrivah/core/managers/dio_manager.dart';
import 'package:escrivah/core/managers/router_manager.dart';
import 'package:escrivah/features/livros/data/datasources/escriva_portal_datasource.dart';
import 'package:escrivah/features/livros/data/repositories/livros_repository_impl.dart';
import 'package:escrivah/features/livros/domain/repositories/livros_repository.dart';
import 'package:escrivah/features/livros/domain/usecases/carregar_informacoes_do_livro_usecase.dart';
import 'package:escrivah/features/livros/domain/usecases/carregar_lista_livros_usecase.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<DioManager>(() => DioManagerImpl());
  sl.registerLazySingleton<RouterManager>(() => RouterManagerImpl());

  _setupLivros();
}

void _setupLivros() {
  // Data Sources
  sl.registerLazySingleton<EscrivaPortalDataSource>(() => EscrivaPortalDataSourceImpl());

  // Repositories
  sl.registerLazySingleton<LivrosRepository>(() => LivrosRepositoryImpl());

  // UseCases
  sl.registerLazySingleton<CarregarListaLivrosUseCase>(() => CarregarListaLivrosUseCase());
  sl.registerLazySingleton<CarregarInformacoesDoLivroUseCase>(() => CarregarInformacoesDoLivroUseCase());
}
