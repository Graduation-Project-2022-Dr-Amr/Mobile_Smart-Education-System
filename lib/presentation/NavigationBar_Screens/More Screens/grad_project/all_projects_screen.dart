import 'package:flutter/material.dart';
import 'package:smart_education/API/Models/project.dart';

import '../../../../presentation/NavigationBar_Screens/More Screens/grad_project/project_details_screen.dart';

class AllProjectsScreen extends StatefulWidget {
  const AllProjectsScreen({Key? key}) : super(key: key);

  @override
  _AllProjectsScreenState createState() => _AllProjectsScreenState();
}

class _AllProjectsScreenState extends State<AllProjectsScreen> {
  List<Project> allProjects = [
    Project(
        id: "id1",
        title: "SMARTEDU",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        department: "CSE",
        doctor: "doctor",
        students: [
          "student1",
          "student2",
          "student3",
          "student4",
        ],
        languages: [
          "Dart",
          "Java",
          "C#",
        ],
        frameworks: ["Flutter", "Native android"],
        tools: ["Android studio", "VsCode"],
        fields: ["Mobile development, web development, AI"],
        others: ["Education systems for universities"],
        year: 2020,
        grade: 190,
        driveLink:"sa"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Old graduation project"),
      ),
      body: ListView.builder(
        itemCount: allProjects.length,
        itemBuilder: (innerContext, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => ProjectDetailsScreen()));
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            allProjects[index].title,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            allProjects[index].year.toString(),
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      allProjects[index].description,
                      style: TextStyle(fontSize: 16),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
