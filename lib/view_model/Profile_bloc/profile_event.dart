import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {}

class ProfileLoadedEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}
