import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_servies/fire_store.dart';

class DislikeButton extends StatefulWidget {
  bool isDisliked;
  int disLike;
  String postId;
  DislikeButton(
      {required this.postId, required this.isDisliked, required this.disLike});

  @override
  State<DislikeButton> createState() => _DislikeButtonState();
}

class _DislikeButtonState extends State<DislikeButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () async {
            if (widget.isDisliked == false) {
              await PostsPageFireStore()
                  .postsCollection
                  .doc(widget.postId)
                  .update({'dislike': widget.disLike + 1, "isDisliked": true});
              widget.isDisliked = !widget.isDisliked;
              widget.disLike = widget.disLike + 1;
            } else {
              await PostsPageFireStore()
                  .postsCollection
                  .doc(widget.postId)
                  .update({'dislike': widget.disLike - 1, "isDisliked": false});
              widget.isDisliked = !widget.isDisliked;
              widget.disLike = widget.disLike - 1;
            }
            setState(() {});
          },
          icon: widget.isDisliked
              ? const FaIcon(FontAwesomeIcons.solidThumbsDown, color: Colors.black)
              : const FaIcon(FontAwesomeIcons.thumbsDown, color: Colors.black),
        ),
        Text(
          widget.disLike.toString(),
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
