import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_components/posts_container/post_container.dart';

class PostsPageFireStore {
  /**
   * collection to retrieve all data about posts and used when adding new post
   */
  CollectionReference postsCollection =
      FirebaseFirestore.instance.collection('posts');
  /**
       * collection used to store last post index and increament with adding new post
       */
  CollectionReference lastPostIndexCollection =
      FirebaseFirestore.instance.collection('posts_index');
  /**
       * Add new Post to firestore
       */
  Future<void> addPost(
      {required String postTitle,
      required String postDescription,
      required String userImage}) async {
    late int lastPostIndex;
    /**
         * 1- get lastPosttIndex from firestore
         */

    await lastPostIndexCollection
        .doc("J9Me7P4rSDwHKNVRRDak")
        .get()
        .then((value) => lastPostIndex = value["last_post_index"]);

    /**
         * After getting lastPostId .. start adding new post with its data :
         */
    try {
      DocumentReference postDocumentReference = postsCollection.doc();
      await postsCollection.doc().set({
        "post_title": postTitle,
        "post_description": postDescription,
        "user_image": userImage,
        "like": 0,
        "love": 0,
        "dislike": 0,
        "post_index": lastPostIndex
      }).then((value) => print('Post added Successfully'));
    } catch (e) {
      print("error in adding new post method");
    }
  }

  Future<void> increamentLastPostIndex() async {
    late int lastIndexValue;
    try {
      (await lastPostIndexCollection
          .doc("J9Me7P4rSDwHKNVRRDak")
          .get()
          .then((value) => lastIndexValue = value["last_post_index"]));
    } catch (e) {
      print("error while getting last post index");
    }
    try {
      lastPostIndexCollection
          .doc("J9Me7P4rSDwHKNVRRDak")
          .update({"last_post_index": lastIndexValue + 1});
    } catch (e) {
      print("error while increamenting last post index");
    }
  }

  Future<void> increamentLike(PostContainer postContainer) async {
    /**
     * get PostContainer documentid .. then update value in .
     */
    // await postsCollection
    //     .doc(postContainer.postDocumentId)
    //     .update({"like": FieldValue.increment(1)})
    //     .then((value) => print('Like incremented Successfully'))
    //     .catchError((error) => print(error));
  }
}
