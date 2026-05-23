import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_likndin_website/core/Utils/responsive.dart';
import 'package:my_likndin_website/core/resources/colors.dart';
import 'package:my_likndin_website/core/resources/dimension.dart';
import 'package:my_likndin_website/view/Screens/HomeScreen/widgets/Education%20section/education_section.dart';
import 'package:my_likndin_website/view/Screens/HomeScreen/widgets/experience section/experience_section.dart';
import 'package:my_likndin_website/view/Screens/HomeScreen/widgets/about_us_section/about_us_section.dart';
import 'package:my_likndin_website/view/Screens/HomeScreen/widgets/project_section/project_section.dart';
import 'package:my_likndin_website/view/Screens/HomeScreen/widgets/section_heading.dart';
import 'package:my_likndin_website/view_model/blocs/home_profile_bloc/bloc.dart';
import 'package:my_likndin_website/view_model/blocs/home_profile_bloc/state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  final aboutKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectKey = GlobalKey();
  final educationKey = GlobalKey();

  void scrollTo(int index) {
    GlobalKey? key;

    if (index == 0) key = aboutKey;
    if (index == 1) key = experienceKey;
    if (index == 2) key = projectKey;
    if (index == 3) key = educationKey;

    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = context.screenWidth;
    double height = context.screenHeight;

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(backgroundColor: AppColors.secondaryColor),

      body: SafeArea(
        child: BlocListener<ProfileTextBloc, ProfileTextState>(
          listener: (context, state) {
            scrollTo(state.selectedIndex!); // 🔥 scroll trigger
          },
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                const SectionHeading(),

                SizedBox(height: height * 0.1),

                Padding(
                  padding: EdgeInsets.all(AppDimension.smallPaddng),
                  child: Column(
                    children: [
                      /// 🔥 About Section (scroll target)
                      AboutUs(key: aboutKey),

                      SizedBox(height: 40.h),
                    ],
                  ),
                ),

                const Divider(thickness: 2),

                /// 🔥 Experience Section
                ExperienSection(key: experienceKey),

                const Divider(thickness: 2),

                /// 🔥 Project Section
                ProjectSection(key: projectKey),

                const Divider(thickness: 2),

                EducationSection(key: educationKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
