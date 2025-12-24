import 'package:flutter/material.dart';

class CreateReleaseScreen extends StatefulWidget {
  const CreateReleaseScreen({super.key});

  @override
  State<CreateReleaseScreen> createState() => _CreateReleaseScreenState();
}

class _CreateReleaseScreenState extends State<CreateReleaseScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новый Релиз'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 2) {
            setState(() {
              _currentStep += 1;
            });
          } else {
            // Submit
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Релиз отправлен на модерацию')),
            );
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          } else {
            Navigator.pop(context);
          }
        },
        steps: [
          Step(
            title: const Text('Инфо'),
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Название релиза'),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Тип релиза'),
                  items: const [
                    DropdownMenuItem(value: 'single', child: Text('Сингл')),
                    DropdownMenuItem(value: 'ep', child: Text('EP')),
                    DropdownMenuItem(value: 'album', child: Text('Альбом')),
                  ],
                  onChanged: (value) {},
                ),
              ],
            ),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('Треки'),
            content: Column(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.upload_file, size: 40),
                        Text('Загрузить аудио файлы (WAV, FLAC)'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('Обложка'),
            content: Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(Icons.image, size: 50),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Выбрать изображение'),
                ),
              ],
            ),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }
}
