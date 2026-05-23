import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_likndin_website/view_model/blocs/home_profile_bloc/event.dart';
import 'package:my_likndin_website/view_model/blocs/home_profile_bloc/state.dart';

class ProfileTextBloc extends Bloc<ProfileEvent, ProfileTextState> {
  ProfileTextBloc() : super(ProfileTextState(selectedIndex: 0)) {
    on<ProfileEvent>((event, emit) {
      emit(ProfileTextState(selectedIndex: event.index));
    });
  }
}
