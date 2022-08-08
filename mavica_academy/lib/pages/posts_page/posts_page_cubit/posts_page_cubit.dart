import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'posts_page_state.dart';

class PostsPageCubit extends Cubit<PostsPageState> {
  PostsPageCubit() : super(PostsPageInitialState());
}
