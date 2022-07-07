import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea6_app/pages/digimons_page.dart';
import 'package:tarea6_app/pages/hire_me_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = Provider.of<BottomBarStateManagement>(context).currentIndex;
    const children = [
      DigimonsPage(),
      HireMePage(),
    ];
    return Scaffold(
      appBar: currentIndex == 0 ? null : AppBar(
        centerTitle: true,
        title: Text(
          _getTitle(currentIndex),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        child: children[currentIndex],
      ),
      bottomNavigationBar: const _CustomBottomBar(),
    );
  }

  String _getTitle(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return 'Digimons';
      case 1:
        return 'Contrátame';
      default:
        return '';
    }
  }
}

class _CustomBottomBar extends StatelessWidget {
  const _CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomBarModel = Provider.of<BottomBarStateManagement>(context);
    return NavigationBar(
      selectedIndex: bottomBarModel.currentIndex,
      height: 60,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Portada',
        ),
        NavigationDestination(
          icon: Icon(Icons.attach_money_outlined),
          selectedIcon: Icon(Icons.attach_money),
          label: 'Contrátame',
        ),
      ],
      onDestinationSelected: (int index) {
        bottomBarModel.currentIndex = index;
      },
    );
  }
}

class BottomBarStateManagement with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }
}
