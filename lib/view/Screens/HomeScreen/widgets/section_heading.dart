import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_likndin_website/core/resources/app_fontsize.dart';
import 'package:my_likndin_website/core/resources/colors.dart';
import 'package:my_likndin_website/data/profile_heading_Text/heading_text.dart';
import 'package:my_likndin_website/view_model/blocs/home_profile_bloc/bloc.dart';
import 'package:my_likndin_website/view_model/blocs/home_profile_bloc/event.dart';
import 'package:my_likndin_website/view_model/blocs/home_profile_bloc/state.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileTextBloc, ProfileTextState>(
      builder: (context, state) {
        return Card(
          elevation: 0,
          color: AppColors.secondaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(HeadingSectionText.profileText.length, (
              index,
            ) {
              return InkWell(
                onTap: () {
                  context.read<ProfileTextBloc>().add(
                    ProfileEvent(index: index),
                  );
                },
                child: Text(
                  HeadingSectionText.profileText[index],
                  style: TextStyle(
                    color: state.selectedIndex == index
                        ? AppColors.changableColor
                        : AppColors.whiteTextColor,
                    fontSize: state.selectedIndex == index
                        ? AppFontsize.mainHeading
                        : AppFontsize.headingFont,

                    fontFamily: state.selectedIndex == index
                        ? 'Cardo'
                        : 'normal',
                    fontWeight: state.selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
