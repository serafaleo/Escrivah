import 'package:escrivah/core/constants/routes.dart';
import 'package:escrivah/core/widgets/main_scaffold.dart';
import 'package:escrivah/features/busca/presentation/pages/busca_page.dart';
import 'package:escrivah/features/favoritos/presentation/pages/favoritos_page.dart';
import 'package:escrivah/features/livros/domain/entities/livro.dart';
import 'package:escrivah/features/livros/presentation/pages/lista_livros_page.dart';
import 'package:escrivah/features/livros/presentation/pages/livro_page.dart';
import 'package:escrivah/features/ponto/presentation/pages/ponto_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract interface class RouterManager {
  GoRouter get router;
  void initRouter();
}

final class RouterManagerImpl implements RouterManager {
  late final GoRouter _router;

  @override
  GoRouter get router => _router;

  final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

  @override
  void initRouter() {
    _router = GoRouter(
      initialLocation: Routes.listaLivros,
      navigatorKey: _rootNavigatorKey,
      routes: <RouteBase>[
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (BuildContext context, GoRouterState state, Widget child) => MainScaffold(child: child),
          routes: <RouteBase>[
            GoRoute(
              path: Routes.listaLivros,
              builder: (BuildContext context, GoRouterState state) => const ListaLivrosPage(),
            ),
            GoRoute(
              path: Routes.busca,
              builder: (BuildContext context, GoRouterState state) => const BuscaPage(),
            ),
            GoRoute(
              path: Routes.favoritos,
              builder: (BuildContext context, GoRouterState state) => const FavoritosPage(),
            ),
            GoRoute(
              path: Routes.ponto,
              builder: (BuildContext context, GoRouterState state) => const PontoPage(),
            ),
          ],
        ),
        GoRoute(
          path: Routes.livro,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            final Livro livro = state.extra as Livro;
            return LivroPage(livro: livro);
          },
        ),
      ],
    );
  }
}
