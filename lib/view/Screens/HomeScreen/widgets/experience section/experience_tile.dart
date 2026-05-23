import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_likndin_website/core/Utils/responsive.dart';
import 'package:my_likndin_website/data/model/experience_model.dart';

class ExperienceTile extends StatefulWidget {
  final ExperienceModel experienceModel;
  final bool isLast;

  const ExperienceTile({
    super.key,
    required this.experienceModel,
    required this.isLast,
  });

  @override
  State<ExperienceTile> createState() => _ExperienceTileState();
}

class _ExperienceTileState extends State<ExperienceTile> {
  double x = 0;
  double y = 0;

  bool isHover = false;

  void updateEffect(PointerEvent details, BuildContext context) {
    final size = context.size;

    if (size == null) return;

    final dx = details.localPosition.dx;
    final dy = details.localPosition.dy;

    setState(() {
      y = ((dx - size.width / 2) / size.width) * 0.25;
      x = -((dy - size.height / 2) / size.height) * 0.25;
    });
  }

  void resetEffect() {
    setState(() {
      x = 0;
      y = 0;
      isHover = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;

    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1100;

    final titleSize = isMobile
        ? 22.0
        : isTablet
        ? 28.0
        : 34.0;

    final companySize = isMobile
        ? 16.0
        : isTablet
        ? 18.0
        : 20.0;

    final pointSize = isMobile
        ? 14.0
        : isTablet
        ? 15.5
        : 17.0;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHover = true;
        });
      },
      onHover: (event) {
        updateEffect(event, context);
      },
      onExit: (_) {
        resetEffect();
      },
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(x)
          ..rotateY(y),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: isHover
                    ? Colors.blue.withOpacity(0.35)
                    : Colors.black.withOpacity(0.2),
                blurRadius: isHover ? 35 : 15,
                spreadRadius: isHover ? 5 : 1,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                padding: EdgeInsets.all(isMobile ? 20 : 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.15),
                      Colors.white.withOpacity(0.04),
                    ],
                  ),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.15),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TITLE + DURATION
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.experienceModel.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: titleSize,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                          ),
                        ),

                        SizedBox(width: 14),

                        Text(
                          widget.experienceModel.duration,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: isMobile ? 12 : 14,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: isMobile ? 12 : 16),

                    /// COMPANY
                    Text(
                      widget.experienceModel.company,
                      style: TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: companySize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: isMobile ? 20 : 30),

                    /// POINTS
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.experienceModel.points.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      color: Colors.cyanAccent,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 14),

                                Expanded(
                                  child: Text(
                                    widget.experienceModel.points[index],
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: pointSize,
                                      height: 1.7,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
