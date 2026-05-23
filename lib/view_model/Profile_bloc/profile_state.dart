import 'package:equatable/equatable.dart';
import 'package:my_likndin_website/data/model/experience_model.dart';

abstract class ProfileState extends Equatable {}

class ProfileInitialState extends ProfileState {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class ProfieLoadedState extends ProfileState {
  String aboutUs;

  ProfieLoadedState({required this.aboutUs});
  @override
  List<Object?> get props => [aboutUs];
}
