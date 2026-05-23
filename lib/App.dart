import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_likndin_website/view/Screens/HomeScreen/home_screen.dart';
import 'package:my_likndin_website/view/Screens/HomeScreen/widgets/about_us_section/widgets/contac_us.dart';
import 'package:my_likndin_website/view_model/Profile_bloc/profile_bloc.dart';
import 'package:my_likndin_website/view_model/Profile_bloc/profile_event.dart';
import 'package:my_likndin_website/view_model/blocs/home_profile_bloc/bloc.dart';
import 'package:my_likndin_website/view_model/blocs/theme_bloc/theme_bloc.dart';
import 'package:my_likndin_website/view_model/blocs/theme_bloc/theme_state.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // base design size (iPhone X example)
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
            BlocProvider<ProfileTextBloc>(create: (_) => ProfileTextBloc()),
            BlocProvider(
              create: (_) => ProfileBloc()..add(ProfileLoadedEvent()),
            ),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                title: 'porfolio',

                //here i want to acces the bloc which change the theme state below
                theme: state is DarkThemeState
                    ? ThemeData.dark()
                    : ThemeData.light(),
                home: HomeScreen(),
              );
            },
          ),
        );
      },
    );
  }
}
