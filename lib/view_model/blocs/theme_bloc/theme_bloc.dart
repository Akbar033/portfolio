import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_likndin_website/view_model/blocs/theme_bloc/theme_event.dart';
import 'package:my_likndin_website/view_model/blocs/theme_bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightThemeState()) {
    on<ToggleThemeEvent>((event, emit) {
      if (state is LightThemeState) {
        emit(DarkThemeState());
      } else {
        emit(LightThemeState());
      }
    });
  }
}
