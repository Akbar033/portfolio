import 'package:flutter/material.dart';
import 'package:my_likndin_website/core/Utils/responsive.dart';
import 'package:my_likndin_website/core/resources/colors.dart';
import 'package:my_likndin_website/data/model/experience_model.dart';
import 'package:my_likndin_website/view/Screens/HomeScreen/widgets/experience%20section/experience_tile.dart';

class ExperienSection extends StatefulWidget {
  const ExperienSection({super.key});

  @override
  State<ExperienSection> createState() => _ExperienSectionState();
}

class _ExperienSectionState extends State<ExperienSection> {
  late final PageController _controller;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    _controller = PageController(viewportFraction: 0.88);

    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page?.round() ?? 0;
      });
    });

    autoSlide();
  }

  void autoSlide() async {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 4));

      if (!_controller.hasClients) return false;

      currentPage++;

      _controller.animateToPage(
        currentPage % ExperienData.experienceList.length,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );

      return true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    final height = context.screenHeight;

    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1100;

    final titleSize = isMobile
        ? 30.0
        : isTablet
        ? 42.0
        : 56.0;

    return Container(
      width: width,
      constraints: BoxConstraints(minHeight: height),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: isMobile ? 40 : 60,
      ),
      child: Stack(
        children: [
          /// DARK OVERLAY
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromARGB(255, 117, 99, 99).withOpacity(0.2),
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
            ),
          ),

          /// CONTENT
          Column(
            children: [
              SizedBox(height: isMobile ? 20 : 40),

              /// TITLE
              Text(
                "EXPERIENCE",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.w900,
                  color: AppColors.appYellowColor,
                  letterSpacing: 5,
                ),
              ),

              SizedBox(height: isMobile ? 30 : 50),

              /// PAGE VIEW
              SizedBox(
                height: isMobile ? 450 : 520,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: ExperienData.experienceList.length,
                  itemBuilder: (context, index) {
                    double scale = 1.0;

                    final diff = (_controller.page ?? currentPage) - index;

                    scale = (1 - diff.abs() * 0.12).clamp(0.88, 1.0);

                    return TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 350),
                      tween: Tween<double>(begin: scale, end: scale),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 8 : 18,
                              vertical: isMobile ? 10 : 24,
                            ),
                            child: ExperienceTile(
                              experienceModel:
                                  ExperienData.experienceList[index],
                              isLast:
                                  index ==
                                  ExperienData.experienceList.length - 1,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: isMobile ? 20 : 30),

              /// INDICATOR
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(ExperienData.experienceList.length, (
                  index,
                ) {
                  final isActive = currentPage == index;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: isActive ? 30 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppColors.appYellowColor
                          : Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
