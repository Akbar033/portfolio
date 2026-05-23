import 'package:equatable/equatable.dart';

abstract class BaseEvent extends Equatable {}

// ignore: must_be_immutable
class ProfileEvent extends BaseEvent {
  int? index;
  ProfileEvent({required this.index});
  @override
  List<Object?> get props => [index];
}
