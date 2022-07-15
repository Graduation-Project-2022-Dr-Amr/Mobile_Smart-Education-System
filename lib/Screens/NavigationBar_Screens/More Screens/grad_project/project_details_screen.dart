import 'package:flutter/material.dart';
import 'package:smart_education/API/Models/project.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({Key? key}) : super(key: key);

  @override
  _ProjectDetailsScreenState createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  final Project _project = Project(
      id: "id1",
      title: "SMARTEDU",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      department: "CSE",
      doctor: "dr/ Amr el zamel",
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
      fields: ["Mobile development", "web development", "AI"],
      others: ["Education systems for universities"],
      year: 2020,
      grade: 190,
      driveLink:"sa"
  );

  @override
  Widget build(BuildContext context) {
    TextStyle style1 = TextStyle(fontSize: 20);
    TextStyle style2 = TextStyle(fontSize: 16);
    return Scaffold(
      appBar: AppBar(
        title: Text(_project.title),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          Text(
            "Description:",
            style: style1,
          ),
          SizedBox(height: 5),
          Text(
            _project.description,
            style: style2,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Department:          ",
                style: style1,
              ),
              Text(
                _project.department,
                style: style2,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Graduation year:          ",
                style: style1,
              ),
              Text(
                _project.year.toString(),
                style: style2,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Doctor:          ",
                style: style1,
              ),
              Text(
                _project.doctor,
                style: style2,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Grade:          ",
                style: style1,
              ),
              Text(
                _project.grade.toString(),
                style: style2,
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Students:",
            style: style1,
          ),
          SizedBox(height: 5),
          Wrap(
            children: List.generate(_project.students.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  _project.students[index].toString(),
                  style: style2,
                ),
              );
            }),
          ),
          SizedBox(height: 10),
          Text(
            "Languages:",
            style: style1,
          ),
          SizedBox(height: 5),
          Wrap(
            children: List.generate(_project.languages.length, (index) {
              return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Chip(
                  label: Text(
                    _project.languages[index].toString(),
                    style: style2,
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 10),
          Text(
            "Fields:",
            style: style1,
          ),
          SizedBox(height: 5),
          Wrap(
            children: List.generate(_project.fields.length, (index) {
              return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Chip(
                  label: Text(
                    _project.fields[index].toString(),
                    style: style2,
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 10),
          Text(
            "Frameworks:",
            style: style1,
          ),
          SizedBox(height: 5),
          Wrap(
            children: List.generate(_project.frameworks.length, (index) {
              return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child:Chip(
                  label:  Text(
                    _project.frameworks[index].toString(),
                    style: style2,
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 10),
          Text(
            "Others:",
            style: style1,
          ),
          SizedBox(height: 5),
          Wrap(
            children: List.generate(_project.others.length, (index) {
              return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Chip(
                  label: Text(
                    _project.others[index].toString(),
                    style: style2,
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 10),
          Text(
            "Tools:",
            style: style1,
          ),
          SizedBox(height: 5),
          Wrap(
            children: List.generate(_project.tools.length, (index) {
              return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child:Chip(
                  label:  Text(
                    _project.tools[index].toString(),
                    style: style2,
                  ),
                ),
              );
            }),
          ),

          ElevatedButton(onPressed: (){}, child: Text("Project Data"))
        ],
      ),
    );
  }
}
