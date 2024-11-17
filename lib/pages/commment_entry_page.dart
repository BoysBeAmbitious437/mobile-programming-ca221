import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nanoid2/nanoid2.dart';

import '../models/comment.dart';
import '../resources/colors.dart';
import '../resources/dimentions.dart';

class CommentEntryPage extends StatefulWidget {
  const CommentEntryPage({
    Key? key,
    required this.onSaved,
    this.selectedComment,
  }) : super(key: key);

  final Function(Comment newComment) onSaved;
  final Comment? selectedComment;

  @override
  State<CommentEntryPage> createState() => _CommentEntryPageState();
}

class _CommentEntryPageState extends State<CommentEntryPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _commentData = {};

  final TextEditingController _createdAtController = TextEditingController();
  final TextEditingController _creatorController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    if (widget.selectedComment != null) {
      final selectedComment = widget.selectedComment!;
      _createdAtController.text = _dateFormat.format(selectedComment.createdAt);
      _creatorController.text = selectedComment.creator;
      _contentController.text = selectedComment.content;
    }
  }

  void _saveComment() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      final newComment = Comment(
        id: widget.selectedComment?.id ?? nanoid(),
        momentId: _commentData['momentId'] ?? 'default_moment_id',
        creator: _commentData['creator'],
        content: _commentData['content'],
        createdAt: DateTime.now(),
      );

      widget.onSaved(newComment);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.selectedComment == null ? 'Create Comment' : 'Edit Comment',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(largeSize),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Creator'),
                TextFormField(
                  controller: _creatorController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    hintText: 'Enter creator name',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Creator name is required';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _commentData['creator'] = newValue!,
                ),
                const SizedBox(height: mediumSize),
                const Text('Comment'),
                TextFormField(
                  controller: _contentController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    hintText: 'Write your comment here',
                    prefixIcon: const Icon(Icons.note),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Comment cannot be empty';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _commentData['content'] = newValue!,
                ),
                const SizedBox(height: largeSize),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _saveComment,
                  child: const Text('Save'),
                ),
                const SizedBox(height: mediumSize),
                OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
