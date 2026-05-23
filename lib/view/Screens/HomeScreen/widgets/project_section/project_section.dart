import 'package:flutter/material.dart';
import 'package:my_likndin_website/core/Utils/responsive.dart';
import 'package:my_likndin_website/data/model/projects_model.dart';

class ProjectSection extends StatelessWidget {
  ProjectSection({super.key});

  final Projetcs projects = Projetcs();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.9,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Projects",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),

          /// 🔥 LOOP ALL PROJECTS
          Column(
            children: projects.projectsLis.map((project) {
              return _projectCard(context, project);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _projectCard(BuildContext context, ProjectsModel project) {
    final width = context.screenWidth;
    final height = context.screenHeight;

    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: height * 0.4,
      child: Stack(
        children: [
          /// 🖼 MAIN IMAGE (first image)
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              project.projectsImages.isNotEmpty
                  ? project.projectsImages.first
                  : 'assets/images/chatapp.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// 🌑 GRADIENT OVERLAY
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          /// 📝 TEXT
          Positioned(
            left: 20,
            bottom: 20,
            right: width * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.projectName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  project.projectDesc,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),

          /// 🖼 PREVIEW IMAGES (dynamic)
          if (project.projectsImages.length > 1)
            Positioned(
              right: 10,
              bottom: 10,
              child: SizedBox(
                width: width * 0.28,
                height: height * 0.22,
                child: SingleChildScrollView(
                  child: Column(
                    //below is responsive spacing for the preview images
                    spacing: height * 0.02,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: project.projectsImages
                        .skip(1) // 🔥 skip first image
                        .map((img) => _smallImage(img))
                        .toList(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Widget _smallImage(String path) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Image.asset(
      path,
      height: 60,
      width: 60,
      fit: BoxFit.cover,
      colorBlendMode: BlendMode.difference,
    ),
  );
}
