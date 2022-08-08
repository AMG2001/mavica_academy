import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'about_us_page_state.dart';

class CoursesPageCubit extends Cubit<CoursesPageState> {
  CoursesPageCubit() : super(CoursesPageInitial());
}
