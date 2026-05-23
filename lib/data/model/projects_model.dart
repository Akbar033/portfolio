class ProjectsModel {
  String projectName;
  String projectDesc;
  List<String> projectsImages;

  ProjectsModel({
    required this.projectDesc,
    required this.projectName,
    required this.projectsImages,
  });
}

class Projetcs {
  List<ProjectsModel> projectsLis = [
    ProjectsModel(
      projectDesc:
          'A real-time chat application built with Flutter and Firebase. The user can create an account and login to app and search user for chat by email ',
      projectName: 'Chat App',
      projectsImages: [
        'assets/images/chatapp2.jpg',
        'assets/images/chatapp.jpg',
        'assets/images/chatapp.jpg',
      ],
    ),
    ProjectsModel(
      projectDesc:
          'A movie discorvery app project built with flutter and rest api to discover movies and tv shows with rating and reviews',
      projectName: 'MovieQuest App',
      projectsImages: [
        'assets/images/movieQuest.jpg',
        'assets/images/movieQuest2.jpg',
        'assets/images/movieQuest3.jpg',
      ],
    ),
    ProjectsModel(
      projectDesc:
          'Catalog app built with flutter and root rest api to fetch product data and display on UI',
      projectName: 'Catalog APP',
      projectsImages: [
        'assets/images/catalog3.jpg',
        'assets/images/catalog2.jpg',
        'assets/images/catalog1.jpg',
      ],
    ),
    ProjectsModel(
      projectDesc:
          'This app can manage the whole company data othe description you can see in images of projects',
      projectName: 'Management System APP',
      projectsImages: [
        'assets/images/qpi (1).jpg',
        'assets/images/qpi (2).jpg',
        'assets/images/qpi (3).jpg',
        'assets/images/qpi (4).jpg',
        'assets/images/qpi (5).jpg',
        'assets/images/qpi (6).jpg',
      ],
    ),
  ];
}
