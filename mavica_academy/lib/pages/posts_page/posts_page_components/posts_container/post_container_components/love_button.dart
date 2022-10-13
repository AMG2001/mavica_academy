import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_servies/fire_store.dart';

class LoveButton extends StatefulWidget {
  String postId;
  int love;
  bool isLoved;
  LoveButton({required this.postId, required this.love, required this.isLoved});

  Future<void> loveButtonClicked() async {
    if (isLoved == false) {
      await PostsPageFireStore()
          .postsCollection
          .doc(postId)
          .update({'love': love + 1, "isLoved": true});
      isLoved = !isLoved;
      love = love + 1;
    } else {
      await PostsPageFireStore()
          .postsCollection
          .doc(postId)
          .update({'love': love - 1, "isLoved": false});
      isLoved = !isLoved;
      love = love - 1;
    }
  }

  @override
  State<LoveButton> createState() => _LoveButtonState();
}

class _LoveButtonState extends State<LoveButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () async {
                await widget.loveButtonClicked();
                setState(() {});
              },
              icon: widget.isLoved
                  ? FaIcon(FontAwesomeIcons.heartCircleCheck, color: Colors.red)
                  : FaIcon(FontAwesomeIcons.heart, color: Colors.red),
            ),
            Text(
              widget.love.toString(),
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
