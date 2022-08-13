import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mavica_academy/pages/posts_page/posts_page.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_components/posts_container/post_container_reactions_cubit/reactions_cubit.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_components/posts_container/post_container_reactions_cubit/reactions_state.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_servies/fire_store.dart';

class PostContainer extends StatelessWidget {
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
  int postIndex;
  /**
   * documentId value come from firestore
   */
  String postDocumentId;
  PostContainer({
    required this.postTitle,
    required this.postDescription,
    this.userImageLink = "",
    this.like = 0,
    this.love = 0,
    this.disLike = 0,
    this.postIndex = 0,
    required this.postDocumentId,
  });

  @override
  Widget build(BuildContext context) {
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
            Row(
              children: [
                /**
                       * Post User
                       */
                CircleAvatar(
                  backgroundImage: NetworkImage(userImageLink),
                  radius: 45,
                ),
                SizedBox(width: 16),
                /**
                       * Post Title
                       */
                Text(
                  postTitle,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              ],
            ),
            /**
                   * Post Description
                   */
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(postDescription),
            ),
            /**
                   * Row Of Reactions
                   */
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        PostsPageFireStore()
                            .postsCollection
                            .doc(postDocumentId)
                            .update({'like': like + 1});
                      },
                      icon: FaIcon(FontAwesomeIcons.thumbsUp,
                          color: Colors.blueAccent),
                    ),
                    Text(
                      (PostsPageFireStore()
                              .postsCollection
                              .doc(postDocumentId)
                              .get() as Map)['like']
                          .toString(),
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        PostsPageFireStore()
                            .postsCollection
                            .doc(postDocumentId)
                            .update({'love': love + 1});
                      },
                      icon: FaIcon(FontAwesomeIcons.heartCirclePlus,
                          color: Colors.red),
                    ),
                    Text(
                      (PostsPageFireStore()
                              .postsCollection
                              .doc(postDocumentId)
                              .get() as Map)['love']
                          .toString(),
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        PostsPageFireStore()
                            .postsCollection
                            .doc(postDocumentId)
                            .update({'dislike': disLike + 1});
                      },
                      icon: FaIcon(FontAwesomeIcons.thumbsDown,
                          color: Colors.black),
                    ),
                    Text(
                      (PostsPageFireStore()
                              .postsCollection
                              .doc(postDocumentId)
                              .get() as Map)['dislike']
                          .toString(),
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
//  "it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
         