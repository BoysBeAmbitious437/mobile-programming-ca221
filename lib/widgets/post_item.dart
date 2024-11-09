import 'package:flutter/material.dart';
import 'package:tugaspertemuan03/pages/comment_create_page.dart';
import 'package:tugaspertemuan03/resources/dimentions.dart';
import 'package:tugaspertemuan03/widgets/post_action.dart';
import 'package:tugaspertemuan03/widgets/post_title.dart';

import '../models/moment.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
    required this.moment,
  });

  final Moment moment;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(extraLargeSize),
          image: DecorationImage(
            image: NetworkImage(moment.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: largeSize,
          vertical: mediumSize,
        ),
        child: Column(
          children: [
            PostTitle(
              creator: moment.creator,
              location: moment.location,
            ),
            Padding(
              padding: const EdgeInsets.all(smallSize),
              child: Column(
                children: [
                  Row(
                    children: [
                      PostAction(
                        icon: 'assets/icons/fi-br-heart.svg',
                        label: moment.likeCount.toString(),
                      ),
                      PostAction(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentCreatePage(
                                onSaved: (Moment newMoment) {},
                              ),
                            ),
                          );
                        },
                        icon: 'assets/icons/fi-br-comment.svg',
                        label: moment.commentCount.toString(),
                      ),
                      PostAction(
                        label: moment.bookmarkCount.toString(),
                        icon: 'assets/icons/fi-br-bookmark.svg',
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: largeSize,
                      bottom: mediumSize,
                    ),
                    child: Text(
                      moment.caption,
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}
