part of 'drawer_cubit_cubit.dart';

@immutable
abstract class DrawerState {}

class DrawerInitialState extends DrawerState {}

class SelectedDrawerItemChanged extends DrawerState {}

class FirstTimeDrawerOpen extends DrawerState {}
