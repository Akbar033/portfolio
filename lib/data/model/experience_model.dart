// ignore: file_names
class ExperienceModel {
  final String title;
  final String company;
  final String duration;
  final List<String> points;

  ExperienceModel({
    required this.title,
    required this.company,
    required this.duration,
    required this.points,
  });
}

class ExperienData {
  static List<ExperienceModel> experienceList = [
    ExperienceModel(
      title: 'Flutter Developer',
      company: 'Uzair Technology',
      duration: 'Apl 2022 - July 2023',
      points: [
        "Developed cross-platform mobile applications using Flutter (Dart)",
        "Implemented MVVM architecture for clean and scalable code structure",
        "Integrated REST APIs for dynamic data handling and backend communication",
        "Worked with Firebase services (Authentication, Firestore, Notifications)",
        "Managed application state using Provider for efficient UI updates",
        "Built reusable components and ensured responsive UI design",
        "Debugged and optimized application performance",
      ],
    ),
    ExperienceModel(
      title: 'Flutter Developer',
      company: 'Arfa Tech',
      duration: 'Oct 2023 - Sept 2024',
      points: [
        'Developed cross-platform mobile applications using Flutter (Dart)',
        "Implemented MVVM architecture for clean and scalable code structure",
        "Integrated REST APIs for dynamic data handling and backend communication",
        "Worked with Firebase services (Authentication, Firestore, Notifications)",
        "Managed application state using Provider for efficient UI updates",
        "Built reusable components and ensured responsive UI design",
        'Debugged and optimized application performance',
      ],
    ),
    ExperienceModel(
      title: 'Flutter Developer Teacher',
      company: 'MR wali Tv online',
      duration: 'Oct 2024 - June 2025',
      points: [
        "Delivered training sessions on Flutter and Dart for beginners and intermediate learners",
        "Explained core concepts including widgets, layouts, and navigation",
        "Taught state management using Provider and basic MVVM architecture",
        "Guided students in building real-world projects like chat applications",
        "Provided hands-on coding exercises and debugging support",
        "Assisted students in understanding API integration and Firebase basics",
        "Mentored learners to improve problem-solving and coding skills",
      ],
    ),
    ExperienceModel(
      title: 'Flutter Developer and IT engineer',
      company: 'Qpi Industry',
      duration: 'Sept 2025 - Preset',
      points: [
        "Managed IT infrastructure including network systems, devices, and technical support",
        "Installed, configured, and maintained hardware, software, and surveillance systems",
        "Monitored system performance and resolved technical issues efficiently",
        "Developed cross-platform mobile applications using Flutter (Dart)",
        "Integrated APIs and Firebase services for real-time data and authentication",
        "Implemented state management using Provider and followed MVVM architecture",
        "Collaborated with teams to improve digital systems and operational workflows",
        "Provided technical support and training to staff for software and system usage",
      ],
    ),
  ];
}
