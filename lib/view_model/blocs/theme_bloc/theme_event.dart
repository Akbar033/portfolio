import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {}

class ToggleThemeEvent extends ThemeEvent {
  @override
  List<Object?> get props => [];
}
