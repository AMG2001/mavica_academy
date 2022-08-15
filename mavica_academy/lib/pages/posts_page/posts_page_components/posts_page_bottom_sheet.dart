import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_servies/fire_store.dart';

Future<void> showPostsPageBottomSheet(
    {context,
    formGlobalKey,
    postTitleController,
    postDescriptionController}) async {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                        if (formGlobalKey.currentState!.validate()) {
                          try {
                            /**
                                     * Add new Post with new Index to FireStore
                                     */
                            await PostsPageFireStore().addPost(
                                postTitle: postTitleController.text,
                                postDescription: postDescriptionController.text,
                                userImage:
                                    "https://drive.google.com/file/d/1tMfqzaw9trqLvFZbhhC9ZmYy9tgAkxnb/view?usp=sharing");
                            print(
                                "*************************************************\n \t\t\t\t\t\t Post Added successfully\n********************************************");
                            await PostsPageFireStore()
                                .increamentLastPostIndex();
                          } catch (e) {
                            print("error is while uploading post to fireStore");
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
