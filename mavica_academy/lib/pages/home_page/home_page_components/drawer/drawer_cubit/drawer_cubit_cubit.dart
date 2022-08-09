import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'drawer_cubit_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitialState());
  int drawerItemIndex = 0;
  bool dontShowDrawer = false;
  /**
   * Changes Selected Item in Drawer
   */
  void changeSelectedDraerItem(int itemIndex) {
    drawerItemIndex = itemIndex;
    print("Changing item color sent with index => $itemIndex");
    emit(SelectedDrawerItemChanged());
  }

}
