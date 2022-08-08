import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mavica_academy/models/constants/pages_names.dart';
import 'package:mavica_academy/pages/home_page/home_page_components/drawer/drawer_cubit/drawer_cubit_cubit.dart';
import 'package:mavica_academy/pages/home_page/home_page_components/drawer/drawer_item.dart';
import 'package:mavica_academy/pages/home_page/home_page_components/student_info_container.dart';

class HomePageDrawerWidget extends StatelessWidget {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height,
          child: BlocBuilder<DrawerCubit, DrawerState>(
            builder: (context, state) {
              return Column(
                children: [
                  StudentInfoContainer(),
                  HomePageDrawerItem(
                      pageName: ConstantPagesName.homePageScreenName,
                      itemText: "Home",
                      itemIcon: Icons.home_outlined,
                      itemIndex: 0,
                      itemNavigationPageName:
                          ConstantPagesName.homePageScreenName),
                  HomePageDrawerItem(
                      pageName: ConstantPagesName.coursesPage,
                      itemText: "Courses",
                      itemIcon: Icons.local_library_outlined,
                      itemIndex: 1,
                      itemNavigationPageName: ConstantPagesName.coursesPage),
                  HomePageDrawerItem(
                      pageName: ConstantPagesName.postsPage,
                      itemText: "Posts",
                      itemIcon: Icons.post_add_outlined,
                      itemIndex: 2,
                      itemNavigationPageName: ConstantPagesName.postsPage),
                  HomePageDrawerItem(
                      pageName: ConstantPagesName.notificationsPage,
                      itemText: "Notifications",
                      itemIcon: Icons.notification_add_outlined,
                      itemIndex: 3,
                      itemNavigationPageName:
                          ConstantPagesName.notificationsPage),
                  HomePageDrawerItem(
                      pageName: ConstantPagesName.settingsPage,
                      itemText: "Settings",
                      itemIcon: Icons.info_outlined,
                      itemIndex: 4,
                      itemNavigationPageName: ConstantPagesName.settingsPage),
                  Divider(height: 0, thickness: 1),
                  // Spacer(),
                  HomePageDrawerItem(
                      pageName: ConstantPagesName.accountPage,
                      itemText: "Account",
                      itemIcon: Icons.person_outline_outlined,
                      itemIndex: 5,
                      itemNavigationPageName: ConstantPagesName.accountPage),
                  HomePageDrawerItem(
                      pageName: ConstantPagesName.loginScreenName,
                      itemText: "Logout",
                      itemIcon: Icons.logout_outlined,
                      itemIndex: 6,
                      itemNavigationPageName:
                          ConstantPagesName.loginScreenName),
                  HomePageDrawerItem(
                      pageName: ConstantPagesName.aboutUsPage,
                      itemText: "About Us",
                      itemIcon: Icons.info_outlined,
                      itemIndex: 7,
                      itemNavigationPageName: ConstantPagesName.aboutUsPage),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
