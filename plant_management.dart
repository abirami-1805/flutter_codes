import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Plant {
  final String name;
  final String type;
  final DateTime lastWatered;

  Plant({required this.name, required this.type, required this.lastWatered});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Manager',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const PlantHomePage(),
    );
  }
}

class PlantHomePage extends StatefulWidget {
  const PlantHomePage({super.key});

  @override
  State<PlantHomePage> createState() => _PlantHomePageState();
}

class _PlantHomePageState extends State<PlantHomePage> {
  final List<Plant> _plants = [];

  final nameController = TextEditingController();
  final typeController = TextEditingController();

  void _addPlant() {
    if (nameController.text.isEmpty || typeController.text.isEmpty) return;

    final plant = Plant(
      name: nameController.text,
      type: typeController.text,
      lastWatered: DateTime.now(),
    );

    setState(() {
      _plants.add(plant);
    });

    nameController.clear();
    typeController.clear();
  }

  String _daysSinceWatered(DateTime lastWatered) {
    final difference = DateTime.now().difference(lastWatered).inDays;
    return '$difference day(s) ago';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plant Manager')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Plant Name'),
            ),
            TextField(
              controller: typeController,
              decoration: const InputDecoration(labelText: 'Plant Type'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addPlant,
              child: const Text('Add Plant'),
            ),
            const SizedBox(height: 20),
            const Text('Your Plants', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Expanded(
              child: _plants.isEmpty
                  ? const Center(child: Text('No plants added yet.'))
                  : ListView.builder(
                      itemCount: _plants.length,
                      itemBuilder: (context, index) {
                        final plant = _plants[index];
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.local_florist),
                            title: Text(plant.name),
                            subtitle: Text('${plant.type}\nLast watered: ${_daysSinceWatered(plant.lastWatered)}'),
                            isThreeLine: true,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
