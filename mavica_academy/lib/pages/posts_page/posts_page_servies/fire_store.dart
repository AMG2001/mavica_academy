import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_components/posts_container/post_container.dart';

class PostsPageFireStore {
  /**
   * collection to retrieve all data about posts and used when adding new post
   */
  CollectionReference postsCollection =
      FirebaseFirestore.instance.collection('posts');
  /**
       * Add new Post to firestore
       */
  Future<void> addPost(
      {required String postTitle,
      required String postDescription,
      required String userImage}) async {
    /**
         * After getting lastPostId .. start adding new post with its data :
         */
    try {
      FirebaseFirestore.instance
          .collection("posts")
          .add(PostContainer(
            userImageLink:  FirebaseAuth.instance.currentUser!.photoURL!,
            postTitle: postTitle,
            postDescription: postDescription,
            postId: "none",
            postingTime:Timestamp.fromDate(DateTime.now()),
          ).postContainerToJson())
          .then((value) => FirebaseFirestore.instance
              .collection("posts")
              .doc(value.id)
              .update({"postId": value.id}));
    } catch (e) {
      print("error in adding new post method");
    }
  }
}
