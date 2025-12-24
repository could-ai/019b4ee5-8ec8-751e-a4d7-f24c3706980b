import 'package:flutter/material.dart';

class ArtistListScreen extends StatelessWidget {
  const ArtistListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои Артисты'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navigate to create artist
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.deepPurple.shade200,
                child: Text('A${index + 1}'),
              ),
              title: Text(
                'Artist Name ${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text('${(index + 1) * 5} релизов • ${(index + 1) * 1200} слушателей'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Navigate to artist details
              },
            ),
          );
        },
      ),
    );
  }
}
