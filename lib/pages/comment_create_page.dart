import 'package:flutter/material.dart';
import 'package:tugaspertemuan03/resources/dimentions.dart';
import 'package:nanoid2/nanoid2.dart';

import '../models/moment.dart';
import '../resources/colors.dart';

class CommentCreatePage extends StatefulWidget {
  const CommentCreatePage({super.key, required this.onSaved});

  final Function(Moment newMoment) onSaved;

  @override
  State<CommentCreatePage> createState() => _CommentCreatePageState();
}

class _CommentCreatePageState extends State<CommentCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _dataMoment = {};

  Widget _buildTextField({
    required String label,
    required String hintText,
    required Icon prefixIcon,
    int maxLines = 1,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
  }) {
    return TextFormField(
      maxLines: maxLines,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon,
        border: const OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }

  void _saveMoment() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSaved(Moment(
        id: nanoid(),
        creator: _dataMoment['creator'],
        location: _dataMoment['location'],
        imageUrl: _dataMoment['imageUrl'],
        momentDate: _dataMoment['momentDate'] ?? DateTime.now().toIso8601String(),
        caption: _dataMoment['caption'],
      ));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Comment')),
      body: Padding(
        padding: const EdgeInsets.all(largeSize),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTextField(
                  label: 'Creator',
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'Moment creator',
                  validator: (value) =>
                      (value == null || value.isEmpty) ? 'Please enter moment creator' : null,
                  onSaved: (newValue) => _dataMoment['creator'] = newValue,
                ),
                const SizedBox(height: mediumSize),
                _buildTextField(
                  label: 'Comment',
                  prefixIcon: const Icon(Icons.note),
                  hintText: 'Comment description',
                  maxLines: 5,
                  validator: (value) =>
                      (value == null || value.isEmpty) ? 'Please enter comment description' : null,
                  onSaved: (newValue) => _dataMoment['caption'] = newValue,
                ),
                const SizedBox(height: largeSize),
                ElevatedButton(
                  onPressed: _saveMoment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Save'),
                ),
                const SizedBox(height: mediumSize),
                OutlinedButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
