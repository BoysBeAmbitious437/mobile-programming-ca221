import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/animal.dart';
import '../providers/animal_provider.dart';

class AnimalFormScreen extends StatefulWidget {
  final Animal? animal;
  final int? index;

  AnimalFormScreen({this.animal, this.index});

  @override
  _AnimalFormScreenState createState() => _AnimalFormScreenState();
}

class _AnimalFormScreenState extends State<AnimalFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _namaSpesies;
  late String _namaIndonesia;
  late String _deskripsi;
  late String _imageUrl;

  @override
  void initState() {
    super.initState();
    _namaSpesies = widget.animal?.namaSpesies ?? '';
    _namaIndonesia = widget.animal?.namaIndonesia ?? '';
    _deskripsi = widget.animal?.deskripsi ?? '';
    _imageUrl = widget.animal?.imageUrl ?? '';
  }

  void _saveForm() {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();
    final newAnimal = Animal(
      namaSpesies: _namaSpesies,
      namaIndonesia: _namaIndonesia,
      deskripsi: _deskripsi,
      imageUrl: _imageUrl,
    );

    final animalProvider = Provider.of<AnimalProvider>(context, listen: false);

    if (widget.index != null) {
      animalProvider.updateAnimal(widget.index!, newAnimal);
    } else {
      animalProvider.addAnimal(newAnimal);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.animal == null ? 'Tambah Hewan' : 'Edit Hewan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _namaSpesies,
                decoration: InputDecoration(labelText: 'Nama Spesies'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Nama Spesies wajib diisi';
                  return null;
                },
                onSaved: (value) => _namaSpesies = value!,
              ),
              TextFormField(
                initialValue: _namaIndonesia,
                decoration: InputDecoration(labelText: 'Nama Indonesia'),
                onSaved: (value) => _namaIndonesia = value!,
              ),
              TextFormField(
                initialValue: _deskripsi,
                decoration: InputDecoration(labelText: 'Deskripsi'),
                onSaved: (value) => _deskripsi = value!,
              ),
              TextFormField(
                initialValue: _imageUrl,
                decoration: InputDecoration(labelText: 'URL Gambar'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'URL Gambar wajib diisi';
                  return null;
                },
                onSaved: (value) => _imageUrl = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Simpan'),
                onPressed: _saveForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
