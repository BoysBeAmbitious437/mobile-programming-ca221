import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/animal_provider.dart';
import '../models/animal.dart';
import './animal_form_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final animalProvider = Provider.of<AnimalProvider>(context);
    final animals = animalProvider.animals;

    return Scaffold(
      appBar: AppBar(
        title: Text('Manajemen Data Hewan'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => AnimalFormScreen()),
              );
            },
          ),
        ],
      ),
      body: animals.isEmpty
          ? Center(child: Text('Belum ada data hewan.'))
          : ListView.builder(
              itemCount: animals.length,
              itemBuilder: (ctx, index) {
                final animal = animals[index];
                return ListTile(
                  leading: Image.network(animal.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(animal.namaSpesies),
                  subtitle: Text(animal.namaIndonesia),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => AnimalFormScreen(
                          animal: animal,
                          index: index,
                        ),
                      ),
                    );
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      animalProvider.deleteAnimal(index);
                    },
                  ),
                );
              },
            ),
    );
  }
}
