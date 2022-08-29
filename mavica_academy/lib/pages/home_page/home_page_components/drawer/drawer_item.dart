import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/config/application_configs/pages_names/pages_names.dart';
import 'package:mavica_academy/pages/home_page/home_page_components/drawer/drawer_cubit/drawer_cubit_cubit.dart';
import 'package:mavica_academy/services/auth/google_auth_controller.dart';

class HomePageDrawerItem extends StatelessWidget {
  String itemText;
  IconData itemIcon;
  String itemNavigationPageName;
  int itemIndex;
  bool selected = false;

  HomePageDrawerItem({
    required this.itemText,
    required this.itemIcon,
    required this.itemIndex,
    required this.itemNavigationPageName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, DrawerState>(
      builder: (context, state) {
        if (BlocProvider.of<DrawerCubit>(context).drawerItemIndex ==
            itemIndex) {
          selected = true;
        } else {
          selected = false;
        }
        return ListTile(
            tileColor: selected ? Colors.black : Colors.white,
            selected: selected,
            selectedTileColor: Colors.black,
            title: Text(
              itemText,
              style: TextStyle(color: selected ? Colors.white : Colors.black),
            ),
            leading:
                Icon(itemIcon, color: selected ? Colors.white : Colors.black),
            onTap: () async {
              await GoogleAuthController().signOut().then((value) {
                Get.offNamed(ConstantPagesName.loginScreenName);
              });
            });
      },
    );
  }
}
