import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_components/posts_container/post_container_components/dislike_button.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_components/posts_container/post_container_components/buttons/like_button/like_button.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_components/posts_container/post_container_components/love_button.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_components/posts_container/post_container_controller.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_controller.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_servies/fire_store.dart';

class PostContainer extends StatefulWidget {
  /**
   * post title taken from bottom sheet
   */
  String postTitle;
  /**
   * post description taken from bottom sheet
   */
  String postDescription;
  /**
   * image link taken from  user login data
   */
  String userImageLink;
  /**
   * likes value come from firestore
   */
  int like;
  /**
   * love value come from firestore
   */
  int love;
  /**
   * disLike value come from firestore
   */
  int disLike;
  /**
   * postIndex value come from firestore
   */
  String postId;
  bool isLiked;
  bool isLoved;
  bool isDisliked;
  late Timestamp postingTime;
  PostContainer({
    /**
     * postTitle from bottom sheet
     */
    this.postTitle = "",
    /**
     * postDescription from bottom sheet
     */
    this.postDescription = "",
    /**
     * userImage from login user Data
     */
    this.userImageLink = "",
    this.like = 0,
    this.love = 0,
    this.disLike = 0,
    this.isDisliked = false,
    this.isLiked = false,
    this.isLoved = false,
    required this.postingTime,
    /**
     * Post Index fotm lastPostIndex Collection
     */
    required this.postId,
  });

  Map<String, dynamic> postContainerToJson() {
    Map<String, dynamic> map = {
      'userImageLink': userImageLink,
      'postTitle': postTitle,
      'postDescription': postDescription,
      'like': like,
      'love': love,
      'dislike': disLike,
      'postId': postId,
      'isLiked': isLiked,
      'isLoved': isLoved,
      'isDisliked': isDisliked,
      "postingTime": postingTime
    };
    return map;
  }

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  @override
  Widget build(BuildContext context) {
    final postPageController = Get.put(PostsPageController());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(children: [
            /**
               * Row of user image and post Title
               */
            Row(
              children: [
                /**
                         * Post User
                         */
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.userImageLink),
                  radius: 45,
                ),
                SizedBox(width: 16),
                /**
                         * Post Title
                         */
                Flexible(
                  child: Text(
                    widget.postTitle,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            /**
                     * Post Description
                     */
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.postDescription),
            ),
            /**
                     * Row Of Reaction buttons -> 
                     */
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  DateFormat.yMd().add_jm().format(widget.postingTime.toDate()),
                  style: TextStyle(color: Colors.grey),
                ),
                Row(
                  children: [
                    /**
                   * 
                   * Column if like icon and number of reactions
                   */
                    LikeButton(
                      postId: widget.postId,
                      like: widget.like,
                      isLiked: widget.isLiked,
                    ),
                    /**
                   * Column of love shape and number of love reactions .
                   */
                    LoveButton(
                        postId: widget.postId,
                        love: widget.love,
                        isLoved: widget.isLoved),
                    /**
                   * column of dislike shape and number of reactions .
                   */
                    DislikeButton(
                        postId: widget.postId,
                        isDisliked: widget.isDisliked,
                        disLike: widget.disLike)
                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
//  "it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
