import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:faker/faker.dart' as faker;
import 'package:nanoid2/nanoid2.dart';

import '../models/comment.dart';
import '../resources/colors.dart';
import 'commment_entry_page.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key, required this.momentId}) : super(key: key);

  final String momentId;

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final List<Comment> _comments = [];
  final faker.Faker _faker = faker.Faker();
  final DateFormat _formatter = DateFormat('dd MMM yyyy');

  @override
  void initState() {
    super.initState();
    _initializeComments();
  }

  void _initializeComments() {
    final generatedComments = List<Comment>.generate(
      5,
      (_) => Comment(
        id: nanoid(),
        creator: _faker.person.name(),
        content: _faker.lorem.sentence(),
        createdAt: _faker.date.dateTime(),
        momentId: widget.momentId,
      ),
    );
    setState(() => _comments.addAll(generatedComments));
  }

  void _navigateToCommentEditor({Comment? comment}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CommentEntryPage(
          selectedComment: comment,
          onSaved: (savedComment) {
            setState(() {
              if (comment != null) {
                final index = _comments.indexWhere((c) => c.id == comment.id);
                if (index != -1) {
                  _comments[index] = savedComment;
                }
              } else {
                _comments.add(savedComment);
              }
            });
          },
        ),
      ),
    );
  }

  void _confirmDelete(Comment comment) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete Comment'),
        content: const Text('Are you sure you want to delete this comment?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _comments.removeWhere((c) => c.id == comment.id);
              });
              Navigator.pop(context);
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentCard(Comment comment) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
      ),
      title: Text(comment.creator),
      subtitle: Text(comment.content),
      trailing: PopupMenuButton<String>(
        onSelected: (action) {
          if (action == 'edit') {
            _navigateToCommentEditor(comment: comment);
          } else if (action == 'delete') {
            _confirmDelete(comment);
          }
        },
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 'edit',
            child: Text('Edit'),
          ),
          const PopupMenuItem(
            value: 'delete',
            child: Text('Delete'),
          ),
        ],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_formatter.format(comment.createdAt)),
            const Icon(Icons.more_vert, color: primaryColor),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comments')),
      body: SingleChildScrollView(
        child: Column(
          children: _comments.map(_buildCommentCard).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToCommentEditor(),
        child: const Icon(Icons.comment),
      ),
    );
  }
}
