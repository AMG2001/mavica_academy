import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mavica_academy/pages/posts_page/posts_page_components/posts_container/post_container_reactions_cubit/reactions_state.dart';

class ReactionsCubit extends Cubit<ReactionsState> {
  ReactionsCubit() : super(ReactionsInitialState());

  int likes = 0;
  int love = 0;
  int disLike = 0;

  void incrementLikes() {
    likes++;
    emit(ReactionsLikeState());
  }

  void incrementLove() {
    love++;
    emit(ReactionsLoveState());
  }

  void incrementDisLike() {
    disLike++;
    emit(ReactionsDisLikeState());
  }
}
