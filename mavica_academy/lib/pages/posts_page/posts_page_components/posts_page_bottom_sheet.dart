import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_servies/fire_store.dart';
Future<void> showPostsPageBottomSheet({context,formGlobalKey,postTitleController,postDescriptionController,last_index}) async {
 showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    child: Form(
                      key: formGlobalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey,
                            ),
                            width: MediaQuery.of(context).size.width * .1,
                            height: MediaQuery.of(context).size.height * .005,
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .8,
                            child: TextFormField(
                              controller: postTitleController,
                              validator: (data) {
                                if (data == null || data == "") {
                                  return "you can't leave this field empty !!";
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                labelText: 'Post Title',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .8,
                            child: TextFormField(
                              controller: postDescriptionController,
                              validator: (data) {
                                if (data == null || data == "") {
                                  return "you can't leave this field empty !!";
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                labelText: 'Post Description',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                /**
                                 * Steps of Adding post is :
                                 * 1- get last post index from FireStore 
                                 * 2- Add New Post to fire Store with that new index
                                 * 3- Generate new index and update it in fireStore 
                                 */
                                try {
                                  /**
                                   * Get last post index From Firestore
                                   */
                                  DocumentSnapshot docSnapShotObj =
                                      await PostsPageFireStore()
                                          .lastPostIndexCollection
                                          .doc("J9Me7P4rSDwHKNVRRDak")
                                          .get();

                                  last_index = (docSnapShotObj.data()
                                      as Map)["last_post_index"];
                                  print(
                                      "*************************************************\n \t\t\t\t\t\t last index fetched successfully\n********************************************");
                                } catch (e) {
                                  print("problem is in last_index line !!");
                                  print(e);
                                }
                                if (formGlobalKey.currentState!.validate()) {
                                  try {
                                    /**
                                     * Add new Post with new Index to FireStore
                                     */
                                    await PostsPageFireStore().addPost(
                                        postTitle: postTitleController.text,
                                        postDescription:
                                            postDescriptionController.text,
                                        userImageUrl:
                                            "https://drive.google.com/file/d/1tMfqzaw9trqLvFZbhhC9ZmYy9tgAkxnb/view?usp=sharing",
                                        postsIndex: last_index);
                                    print(
                                        "*************************************************\n \t\t\t\t\t\t Post Added successfully\n********************************************");
                                  } catch (e) {
                                    print(
                                        "error is while uploading post to fireStore");
                                    print(e);
                                  }
                                  try {
                                    /**
                                     * Generate new Index and update it in FireStore
                                     */
                                    await PostsPageFireStore()
                                        .lastPostIndexCollection
                                        .doc("J9Me7P4rSDwHKNVRRDak")
                                        .update({
                                      'last_post_index': last_index + 1
                                    });
                                    print(
                                        "*************************************************\n \t\t\t\t\t\t last index Updated successfully\n********************************************");
                                  } catch (e) {
                                    print(
                                        "error is while reAssign last index value !!");
                                    print(e);
                                  }
                                }
                              },
                              child: Text("Add Post +"))
                        ],
                      ),
                    ),
                  ),
                );
              });
      
}
