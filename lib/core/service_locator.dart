import 'package:escrivah/core/managers/router_manager.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<RouterManager>(() => RouterManagerImpl());
}
