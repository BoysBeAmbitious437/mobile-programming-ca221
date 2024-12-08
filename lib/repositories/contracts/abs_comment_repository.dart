import '../../models/comment.dart';

abstract class AbsCommentRepository {
  Future<void> addComment(Comment comment);

  Future<void> updateComment(Comment comment);

  Future<void> deleteComment(String commentId);

  Future<List<Comment>> get getCommentsByMomentId;

  Future<Comment?> getCommentById(String commentId);
}
