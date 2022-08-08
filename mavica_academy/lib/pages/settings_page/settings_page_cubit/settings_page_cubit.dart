import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_page_state.dart';

class CoursesPageCubit extends Cubit<CoursesPageState> {
  CoursesPageCubit() : super(CoursesPageInitial());
}
