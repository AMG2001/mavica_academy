import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mavica_academy/models/constants/pages_names.dart';
import 'package:mavica_academy/pages/home_page/home_page_components/drawer/drawer_cubit/drawer_cubit_cubit.dart';

class HomePageDrawerItem extends StatelessWidget {
  String pageName;
  String itemText;
  IconData itemIcon;
  String itemNavigationPageName;
  int itemIndex;
  bool selected = false;

  HomePageDrawerItem({
    required this.pageName,
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
            onTap: () {
              if (pageName == ConstantPagesName.homePageScreenName) {
              } else {
                Navigator.pop(context);
                BlocProvider.of<DrawerCubit>(context)
                    .changeSelectedDraerItem(itemIndex);
                Navigator.pushNamed(context, itemNavigationPageName);
              }
            });
      },
    );
  }
}
