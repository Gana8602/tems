// ignore_for_file: file_names

import 'package:get/get.dart';

import '../model/report_model.dart';

class ReportController extends GetxController {
  final List<User> userList = [
    User(
      id: 1,
      firstName: "Johnaiakdjfiou",
      lastName: "Doe",
      maidenName: "Smith",
      age: 30,
      gender: "Male",
      email: "john.doe@example.com",
    ),
    User(
      id: 2,
      firstName: "Jane",
      lastName: "Doe",
      maidenName: "Johnson",
      age: 28,
      gender: "Female",
      email: "jane.doe@example.com",
    ),
    // Add more users here as needed
  ];
}
