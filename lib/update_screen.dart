import 'package:flutter/material.dart';
import 'package:myapp/models/update_model.dart';
import 'package:myapp/services/update_api.dart';
import 'package:myapp/update/update_display.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  UpdateModel updateModel = UpdateModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Name"),
            ),
            TextField(
              controller: jobController,
              decoration: const InputDecoration(hintText: "Job"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[200],
                ),
                onPressed: () {
                  ApiUpdateServices()
                      .updateData(nameController.text.toString(),
                          jobController.text.toString())
                      .then((value) {
                    setState(() {
                      updateModel = value!;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateDisplay(
                                    updateModel: updateModel,
                                    name: updateModel.name.toString(),
                                    job: updateModel.job.toString(),
                                    updatedAt: updateModel.updatedAt.toString(),
                                  )));
                    });
                  });
                },
                child: const Text("Update"))
          ],
        ),
      ),
    );
  }
}
