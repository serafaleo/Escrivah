import 'package:escrivah/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class NavItem {
  final String label;
  final IconData icon;
  final String path;

  const NavItem({
    required this.label,
    required this.icon,
    required this.path,
  });
}

final List<NavItem> _navItems = <NavItem>[
  const NavItem(label: 'Livros', icon: Icons.book, path: Routes.livros),
  const NavItem(label: 'Busca', icon: Icons.search, path: Routes.busca),
  const NavItem(label: 'Favoritos', icon: Icons.favorite, path: Routes.favoritos),
  const NavItem(label: 'Ponto', icon: Icons.casino, path: Routes.ponto),
];

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escrivah'),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateCurrentIndex(context),
        type: BottomNavigationBarType.fixed,
        items: _navItems.map((NavItem item) {
          return BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.label,
          );
        }).toList(),
        onTap: (int index) => _onTap(index, context),
      ),
    );
  }

  int _calculateCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    final int index = _navItems.indexWhere((NavItem item) => location.startsWith(item.path));
    return index < 0 ? 0 : index;
  }

  void _onTap(int index, BuildContext context) {
    context.go(_navItems[index].path);
  }
}
