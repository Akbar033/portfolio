import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {}

// ignore: must_be_immutable
class ProfileTextState extends BaseState {
  int? selectedIndex = 0;

  ProfileTextState({required this.selectedIndex});

  @override
  List<Object?> get props => [selectedIndex];
}
