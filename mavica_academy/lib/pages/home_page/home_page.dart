import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mavica_academy/pages/about_us/about_us_page_controller.dart';
import 'package:mavica_academy/pages/home_page/home_page_components/drawer/drawer_cubit/drawer_cubit_cubit.dart';
import 'package:mavica_academy/pages/home_page/home_page_components/home_page_drawer_widget.dart';

import '../about_us/about_us_page_controller.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: BlocProvider<DrawerCubit>(
        create: (context) => DrawerCubit(),
        child: BlocBuilder<DrawerCubit, DrawerState>(
          builder: (context, state) {
            return HomePageDrawerWidget();
          },
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _key.currentState!.openDrawer();
            },
            icon: Icon(Icons.menu)),
        title: Text('GoLearn'),
      ),
    );
  }
}
