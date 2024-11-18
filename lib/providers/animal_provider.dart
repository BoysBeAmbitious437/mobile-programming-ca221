import 'package:flutter/material.dart';
import '../models/animal.dart';

class AnimalProvider with ChangeNotifier {
  final List<Animal> _animals = [];

  List<Animal> get animals => [..._animals];

  void addAnimal(Animal animal) {
    _animals.add(animal);
    notifyListeners();
  }

  void updateAnimal(int index, Animal updatedAnimal) {
    _animals[index] = updatedAnimal;
    notifyListeners();
  }

  void deleteAnimal(int index) {
    _animals.removeAt(index);
    notifyListeners();
  }
}
