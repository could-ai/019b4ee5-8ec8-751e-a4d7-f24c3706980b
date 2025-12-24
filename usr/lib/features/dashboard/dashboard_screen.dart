import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Синтез'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/auth');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Обзор',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            // Stats Cards
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context,
                    'Стримы',
                    '124.5K',
                    Icons.graphic_eq,
                    Colors.purpleAccent,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatCard(
                    context,
                    'Доход',
                    '₽ 45,200',
                    Icons.attach_money,
                    Colors.greenAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Последние релизы',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildReleaseItem(context, 'Neon Nights', 'Synthwave Boy', 'В обработке'),
            _buildReleaseItem(context, 'Summer Vibes', 'DJ Cool', 'Опубликовано'),
            _buildReleaseItem(context, 'Deep Thoughts', 'Lofi Girl', 'Отклонено'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 16),
            Text(title, style: Theme.of(context).textTheme.bodyMedium),
            Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildReleaseItem(BuildContext context, String title, String artist, String status) {
    Color statusColor;
    switch (status) {
      case 'Опубликовано':
        statusColor = Colors.green;
        break;
      case 'В обработке':
        statusColor = Colors.orange;
        break;
      case 'Отклонено':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          color: Colors.grey[800],
          child: const Icon(Icons.music_note),
        ),
        title: Text(title),
        subtitle: Text(artist),
        trailing: Chip(
          label: Text(
            status,
            style: const TextStyle(fontSize: 12),
          ),
          backgroundColor: statusColor.withOpacity(0.2),
          labelStyle: TextStyle(color: statusColor),
        ),
      ),
    );
  }
}
