import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_likndin_website/view_model/Profile_bloc/profile_event.dart';
import 'package:my_likndin_website/view_model/Profile_bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<ProfileLoadedEvent>((event, emit) {
      //create your profile model here
      String abouse =
          ''' I am a passionate Flutter Developer focused on building high-quality, scalable, and user-friendly mobile applications. I specialize in developing cross-platform apps using Flutter and Dart, with a strong understanding of clean architecture and modern development practices.

I have hands-on experience with Firebase services including Authentication, Firestore, and Push Notifications, along with building real-time applications and implementing state management using Provider.

I enjoy transforming ideas into real-world solutions, from chat applications with real-time features to enterprise-level systems involving barcode generation, scanning, and maintenance tracking.

I am committed to continuous learning, improving my skills, and exploring new technologies to grow as a professional developer''';

      emit(ProfieLoadedState(aboutUs: abouse));
    });
  }
}
