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
          );
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
            if (snapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text("Loading"));
            }

             return ListView.builder(itemBuilder: (context,index){
              return PostContainer(
                postTitle: snapshot.data.documents[index]['post_title'],
              );
             }, itemCount: snapshot.data.docs.length);
             //
             // ListView(
            //   children: snapshot.data!.docs.map((DocumentSnapshot document) {
            //     Map<String, dynamic> postInfo =
            //         document.data()! as Map<String, dynamic>;

            //     return PostContainer(
            //         postTitle: postInfo['post_title'],
            //         postDescription: postInfo['post_description'],
            //         postIndex: postInfo['post_index'],
            //         postDocumentId: document.id);
            //     print("adding posts done ##");
            //   }).toList(growable: true),
            // );
          },
        ),
      ),
    );
  }
}
