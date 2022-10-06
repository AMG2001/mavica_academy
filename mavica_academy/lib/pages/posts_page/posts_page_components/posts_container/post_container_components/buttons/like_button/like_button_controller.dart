import 'package:get/get.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_servies/fire_store.dart';

class LikeButtonController  {
  Future<void> likeButtonClicked(
      {required String postId,
      required int like,
      required bool isLiked}) async {
    if (isLiked == false) {
      await PostsPageFireStore()
          .postsCollection
          .doc(postId)
          .update({'like': like + 1, "isLiked": true});
      isLiked = !isLiked;
      like = like + 1;
    
    } else {
      await PostsPageFireStore()
          .postsCollection
          .doc(postId)
          .update({'like': like - 1, "isLiked": false});
      isLiked = !isLiked;
      like = like - 1;
    
    }
  }
}
