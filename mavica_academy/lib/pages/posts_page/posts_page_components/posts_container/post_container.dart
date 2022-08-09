import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_components/posts_container/post_container_reactions_cubit/reactions_cubit.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_components/posts_container/post_container_reactions_cubit/reactions_state.dart';

class PostContainer extends StatelessWidget {
  String postTitle;
  String postDescription;
  PostContainer({
    required this.postTitle,
    required this.postDescription,
  });
  late var blocProviderObj;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReactionsCubit>(
      create: (context) => ReactionsCubit(),
      child: Padding(
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
                    backgroundImage: AssetImage("assets/application/ana.png"),
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
              BlocBuilder<ReactionsCubit, ReactionsState>(
                builder: (context, state) {
                  blocProviderObj = BlocProvider.of<ReactionsCubit>(context);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              blocProviderObj.incrementLikes();
                            },
                            icon: FaIcon(FontAwesomeIcons.thumbsUp,
                                color: Colors.blueAccent),
                          ),
                          Text(
                            blocProviderObj.likes.toString(),
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
                              blocProviderObj.incrementLove();
                            },
                            icon: FaIcon(FontAwesomeIcons.heartCirclePlus,
                                color: Colors.red),
                          ),
                          Text(
                            blocProviderObj.love.toString(),
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
                              blocProviderObj.incrementDisLike();
                            },
                            icon: FaIcon(FontAwesomeIcons.thumbsDown,
                                color: Colors.black),
                          ),
                          Text(
                            blocProviderObj.disLike.toString(),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  );
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
//  "it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
         