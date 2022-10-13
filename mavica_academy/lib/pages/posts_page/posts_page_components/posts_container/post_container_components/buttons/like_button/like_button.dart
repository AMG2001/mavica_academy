import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_servies/fire_store.dart';

class LikeButton extends StatefulWidget {
  bool isLiked;
  int like;
  String postId;
  LikeButton({required this.postId, required this.isLiked, required this.like});

  Future<void> likeButtonClicked() async {
    if (isLiked == false) {
      await PostsPageFireStore()
          .postsCollection
          .doc(postId)
          .update({'like': like + 1, "isLiked": true});
      isLiked = !isLiked;
      like = like + 1;
    } else {
      await PostsPageFireStore()
          .postsCollection
          .doc(postId)
          .update({'like': like - 1, "isLiked": false});
      isLiked = !isLiked;
      like = like - 1;
    }
  }

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [   

        IconButton(
          onPressed: () async {
            await widget.likeButtonClicked();
            setState(() {});
          },
          icon: widget.isLiked
              ? const FaIcon(FontAwesomeIcons.solidThumbsUp,
                  color: Colors.blueAccent)
              : const FaIcon(FontAwesomeIcons.thumbsUp,
                  color: Colors.blueAccent),
        ),
        Text(
          widget.like.toString(),
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
