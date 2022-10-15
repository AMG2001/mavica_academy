import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/config/application_configs/pages_names/pages_names.dart';
import 'package:mavica_academy/pages/about_us/about_us_page_controller.dart';
import 'package:mavica_academy/pages/home_page/home_page_components/drawer/drawer_cubit/drawer_cubit_cubit.dart';
import 'package:mavica_academy/pages/home_page/home_page_components/drawer/drawer_item.dart';
import 'package:mavica_academy/pages/home_page/home_page_components/student_info_container.dart';
import 'package:mavica_academy/services/auth/google_auth_controller.dart';

class HomePageDrawerWidget extends StatelessWidget {
  final aboutUsController = Get.put(aboutUsPageController());
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
                      itemText: "Home",
                      itemIcon: Icons.home_outlined,
                      itemIndex: 0,
                      itemNavigationPageName: PagesNames.homePageScreenName,
                      function: () {
                        BlocProvider.of<DrawerCubit>(context)
                            .changeSelectedDraerItem(0);
                        Get.back();
                        Get.toNamed(PagesNames.homePageScreenName);
                      }),
                  HomePageDrawerItem(
                      itemText: "Courses",
                      itemIcon: Icons.local_library_outlined,
                      itemIndex: 1,
                      itemNavigationPageName: PagesNames.coursesPage,
                      function: () {
                        {
                          BlocProvider.of<DrawerCubit>(context)
                              .changeSelectedDraerItem(1);
                          Get.back();
                          Get.toNamed(PagesNames.coursesPage);
                        }
                      }),
                  HomePageDrawerItem(
                      itemText: "Posts",
                      itemIcon: Icons.post_add_outlined,
                      itemIndex: 2,
                      itemNavigationPageName: PagesNames.postsPage,
                      function: () {
                        BlocProvider.of<DrawerCubit>(context)
                            .changeSelectedDraerItem(2);
                        Get.back();
                        Get.toNamed(PagesNames.postsPage);
                      }),
                  HomePageDrawerItem(
                      itemText: "Notifications",
                      itemIcon: Icons.notification_add_outlined,
                      itemIndex: 3,
                      itemNavigationPageName: PagesNames.notificationsPage,
                      function: () {
                        BlocProvider.of<DrawerCubit>(context)
                            .changeSelectedDraerItem(3);
                        Get.back();
                        Get.toNamed(PagesNames.notificationsPage);
                      }),
                  HomePageDrawerItem(
                      itemText: "Tasks",
                      itemIcon: Icons.add_task_sharp,
                      itemIndex: 4,
                      itemNavigationPageName: PagesNames.notificationsPage,
                      function: () {
                        BlocProvider.of<DrawerCubit>(context)
                            .changeSelectedDraerItem(4);
                        Get.back();
                        Get.toNamed(PagesNames.todoPage);
                      }),
                  HomePageDrawerItem(
                      itemText: "Settings",
                      itemIcon: Icons.info_outlined,
                      itemIndex: 5,
                      itemNavigationPageName: PagesNames.settingsPage,
                      function: () {
                        BlocProvider.of<DrawerCubit>(context)
                            .changeSelectedDraerItem(5);
                        Get.toNamed(PagesNames.settingsPage);
                      }),
                  Divider(height: 0, thickness: 1),
                  // Spacer(),
                  HomePageDrawerItem(
                      itemText: "Account",
                      itemIcon: Icons.person_outline_outlined,
                      itemIndex: 6,
                      itemNavigationPageName: PagesNames.accountPage,
                      function: () {
                        BlocProvider.of<DrawerCubit>(context)
                            .changeSelectedDraerItem(6);
                        Get.back();
                        Get.toNamed(PagesNames.accountPage);
                      }),

                  HomePageDrawerItem(
                      itemText: "Logout",
                      itemIcon: Icons.logout_outlined,
                      itemIndex: 7,
                      itemNavigationPageName: PagesNames.loginScreenName,
                      function: () async {
                        await GoogleAuthController().signOut().then((value) {
                          Get.back();
                          Get.offNamed(PagesNames.loginScreenName);
                        });
                      }),
                  HomePageDrawerItem(
                      itemText: "About Us",
                      itemIcon: Icons.info_outlined,
                      itemIndex: 8,
                      itemNavigationPageName: PagesNames.aboutUsPage,
                      function: () {
                        BlocProvider.of<DrawerCubit>(context)
                            .changeSelectedDraerItem(7);
                        Get.back();
                        Get.toNamed(PagesNames.aboutUsPage);
                      }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
