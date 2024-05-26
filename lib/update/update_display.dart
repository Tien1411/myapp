import 'package:flutter/material.dart';
import 'package:myapp/models/update_model.dart';

class UpdateDisplay extends StatelessWidget {
  final String? name, job, updatedAt;
  final UpdateModel updateModel;
  const UpdateDisplay(
      {super.key,
      this.name,
      this.job,
      this.updatedAt,
      required this.updateModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Update API"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            children: [
              Text("Name : {$name}"),
              Text("Job : {$job}"),
              Text("Thong tin cap nhat : {$updatedAt}")
            ],
          ),),
      ),
    );
  }
}
