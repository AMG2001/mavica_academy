import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_components/posts_page_bottom_sheet.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_components/posts_container/post_container.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_servies/fire_store.dart';

class PostsPage extends StatelessWidget {
  /**
   * to check data entered in bottomModalSheet in postsPage 
   */
  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();
  /**
   * post title controller .. take input and send it to firestore
   */
  TextEditingController postTitleController = TextEditingController();
  /**
   * post description controller .. take input and send it to firestore
   */
  TextEditingController postDescriptionController = TextEditingController();
  /**
   * stream on firestore posts .. any new post add on firestore will appear for all users using stream
   */
  final Stream<QuerySnapshot> _postsStream =
      FirebaseFirestore.instance.collection('posts').snapshots();
  /**
       * posts page constructor
       */
  PostsPage({Key? key}) : super(key: key);
/**
 * last postIndex variable :
 */
  late int last_index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          /**
           * bottom sheet Functionallity imported from postsPageComponets
           */
          showPostsPageBottomSheet(
              context: context,
              formGlobalKey: formGlobalKey,
              postTitleController: postTitleController,
              postDescriptionController: postDescriptionController,
              last_index: last_index);
        },
        child:
            /**
         * Add New Post Button
         */
            Row(
          mainAxisSize: MainAxisSize.min,
          children: [Text("Add New Post"), Icon(Icons.add)],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: SafeArea(
        /**
         * Stream Builder to retrieve and Build Posts ->
         */
        child: StreamBuilder<QuerySnapshot>(
          stream: _postsStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            /**
                 * if Error .. show error State
                 */
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            /**
               * in loading .. show loading indicator
               */
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            /**
             * Success data retrieved .. show posts
             */
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                /**
                 * All posts data are stored in this data variable :
                 */
                late String postTitle;
                late String postDescription;
                late String userImageUrl;
                late int like=0;
                late int love=0;
                late int dislike=0;
                late int postsIndex;
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                try {
                  postTitle = data['post_title'];
                } catch (e) {
                  print("probelm in post title");
                }
                try {
                  postDescription = data['post_description'];
                } catch (e) {
                  print("probelm in post description");
                }
                try {
                  userImageUrl = data['user_image'];
                } catch (e) {
                  print("probelm in user image");
                }
                try {
                  like = data['like'];
                } catch (e) {
                  print("probelm in like");
                }
                try {
                  love = data['love'];
                } catch (e) {
                  print("probelm in  love");
                }
                try {
                  dislike = data['dislike'];
                } catch (e) {
                  print("probelm in  dislike");
                }
                try {
                  postsIndex = data['posts_index'];
                } catch (e) {
                  print("probelm in  post_index");
                }

                return PostContainer(
                    postTitle: postTitle,
                    postDescription: postDescription,
                    userImageLink: userImageUrl,
                    like: like,
                    love: love,
                    disLike: dislike,
                    postIndex: postsIndex,
                    postDocumentId: document.id);
              }).toList(growable: true),
            );
          },
        ),
      ),
    );
  }
}
