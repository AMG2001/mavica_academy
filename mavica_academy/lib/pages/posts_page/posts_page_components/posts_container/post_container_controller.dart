import 'package:get/get.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_servies/fire_store.dart';

class PostCintainerController extends GetxController {
 
  Future<void> loveButtonClicked(
      {required String postId,
      required bool isLoved,
      required int love}) async{}

  Future<void> disLikeButtonClicked(
      {required String postId,
      required bool isDisliked,
      required int disLike}) async {}
}
