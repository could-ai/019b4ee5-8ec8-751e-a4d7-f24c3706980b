import 'package:flutter/material.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сообщество'),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Chip(label: Text('Все')),
                    SizedBox(width: 8),
                    Chip(label: Text('Новости')),
                    SizedBox(width: 8),
                    Chip(label: Text('Обсуждения')),
                    SizedBox(width: 8),
                    Chip(label: Text('Коллаборации')),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(radius: 20, child: Icon(Icons.person)),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('User ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text('2 часа назад', style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Ищу вокалиста для нового трека в стиле Synthwave. Пишите в личку!',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
                      const Text('12'),
                      const SizedBox(width: 16),
                      IconButton(icon: const Icon(Icons.comment_outlined), onPressed: () {}),
                      const Text('4'),
                      const Spacer(),
                      IconButton(icon: const Icon(Icons.share_outlined), onPressed: () {}),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
