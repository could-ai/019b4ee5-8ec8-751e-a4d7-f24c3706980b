import 'package:flutter/material.dart';
import 'package:couldai_user_app/features/dashboard/dashboard_screen.dart';
import 'package:couldai_user_app/features/artists/artist_list_screen.dart';
import 'package:couldai_user_app/features/labels/label_list_screen.dart';
import 'package:couldai_user_app/features/social/social_screen.dart';
import 'package:couldai_user_app/features/distribution/create_release_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const ArtistListScreen(),
    const LabelListScreen(),
    const SocialScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Дашборд',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Артисты',
          ),
          NavigationDestination(
            icon: Icon(Icons.label_outline),
            selectedIcon: Icon(Icons.label),
            label: 'Лейблы',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            selectedIcon: Icon(Icons.chat_bubble),
            label: 'Сообщество',
          ),
        ],
      ),
      floatingActionButton: _selectedIndex == 0 // Show only on dashboard
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateReleaseScreen()),
                );
              },
              icon: const Icon(Icons.upload),
              label: const Text('Релиз'),
            )
          : null,
    );
  }
}
