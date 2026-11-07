import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'memory_status_screen.dart';
import 'placeholder_screen.dart';

/// Five-tab bottom navigation from the Stitch design: Home, Diary,
/// Companion, Studio, Vault.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: const [
          HomeScreen(),
          PlaceholderScreen(
            title: 'Diary',
            icon: Icons.auto_stories_outlined,
            phase: 'Phase 2',
          ),
          PlaceholderScreen(
            title: 'Companion',
            icon: Icons.forum_outlined,
            phase: 'Phase 4',
          ),
          PlaceholderScreen(
            title: 'Studio',
            icon: Icons.palette_outlined,
            phase: 'Phase 3',
          ),
          MemoryStatusScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.shield_outlined),
            selectedIcon: Icon(Icons.shield),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.auto_stories_outlined),
            selectedIcon: Icon(Icons.auto_stories),
            label: 'Diary',
          ),
          NavigationDestination(
            icon: Icon(Icons.forum_outlined),
            selectedIcon: Icon(Icons.forum),
            label: 'Companion',
          ),
          NavigationDestination(
            icon: Icon(Icons.palette_outlined),
            selectedIcon: Icon(Icons.palette),
            label: 'Studio',
          ),
          NavigationDestination(
            icon: Icon(Icons.key_outlined),
            selectedIcon: Icon(Icons.key),
            label: 'Vault',
          ),
        ],
      ),
    );
  }
}
