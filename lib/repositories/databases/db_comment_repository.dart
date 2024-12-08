import 'dart:developer';

import 'package:tugaspertemuan03/models/comment.dart';

import '../../core/helpers/database_helper.dart';
import '../contracts/abs_comment_repository.dart';

class DbCommentRepository extends AbsCommentRepository {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Future<void> addComment(Comment comment) async {
    try {
      // Akses database
      final db = await databaseHelper.database;
      // Melakukan operasi insert
      await db.insert(
        DatabaseHelper.tableMoments,
        comment.toMap(),
      );
    } catch (e) {
      log(e.toString(), name: 'db_moment_repository:addMoment');
    }
  }

  @override
  Future<void> deleteComment(String momentId) async {
    try {
      // Akses database
      final db = await databaseHelper.database;
      // Melakukan operasi delete
      await db.delete(
        DatabaseHelper.tableMoments,
        where: 'id = ?',
        whereArgs: [momentId],
      );
    } catch (e) {
      log(e.toString(), name: 'db_moment_repository:deleteMoment');
    }
  }

  @override
  Future<List<Comment>> get getCommentsByMomentId async {
    try {
      // Akses database
      final db = await databaseHelper.database;
      // Melakukan operasi select
      final result = await db.query(DatabaseHelper.tableMoments);
      // Mengembalikan hasil
      return result.map((e) => Comment.fromMap(e)).toList();
    } catch (e) {
      log(e.toString(), name: 'db_moment_repository:getCommentsById');
      return [];
    }
  }

  @override
  Future<Comment?> getCommentById(String momentId) async {
    try {
      // Akses database
      final db = await databaseHelper.database;
      // Melakukan operasi select
      final result = await db.query(
        DatabaseHelper.tableMoments,
        where: 'id = ?',
        whereArgs: [momentId],
      );
      if (result.isEmpty) {
        return null;
      } else {
        return Comment.fromMap(result.first);
      }
    } catch (e) {
      log(e.toString(), name: 'db_moment_repository:getCommentById');
      return null;
    }
  }

  @override
  Future<void> updateComment(Comment comment) async {
    try {
      // Akses database
      final db = await databaseHelper.database;
      // Melakukan operasi update
      await db.update(
        DatabaseHelper.tableMoments,
        comment.toMap(),
        where: 'id = ?',
        whereArgs: [comment.id],
      );
    } catch (e) {
      log(e.toString(), name: 'db_moment_repository:updateComment');
    }
  }
}
