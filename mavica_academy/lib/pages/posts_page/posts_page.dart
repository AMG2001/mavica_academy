import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/config/application_configs/colors/defaultColors.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_components/posts_page_bottom_sheet.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_components/posts_container/post_container.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_controller.dart';
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

  final controller = Get.put(PostsPageController(), permanent: true);

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
        child: GetBuilder<PostsPageController>(
          builder: (z) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: Get.height,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("posts")
                    .orderBy("postingTime")
                    .snapshots(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                          color: DefaultColors.defaultRed),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("There is some thing wrong"),
                    );
                  }

                  /**
                         * snapshot : 
                         */
                  var querySnapshot = snapshot.data!.docs;
                  /**
                       * get every document alone from the whole snapshot: 
                       */

                  controller.fetchedPostsList.clear();
                  querySnapshot.forEach((document) {
                    controller.fetchedPostsList.add(
                      PostContainer(
                        postingTime: document.get('postingTime'),
                        postTitle: document.get('postTitle'),
                        postDescription: document.get('postDescription'),
                        postId: document.get('postId'),
                        disLike: document.get('dislike'),
                        isDisliked: document.get('isDisliked'),
                        isLiked: document.get('isLiked'),
                        isLoved: document.get('isLoved'),
                        like: document.get('like'),
                        love: document.get('love'),
                        userImageLink: document.get('userImageLink'),
                      ),
                    );
                  });

                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                        reverse: snapshot.data!.docs.length > 4 ? true : false,
                        children: controller.fetchedPostsList),
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}
