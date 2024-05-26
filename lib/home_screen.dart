import 'package:flutter/material.dart';
import 'package:myapp/models/get_model.dart';
import 'package:myapp/services/get_services.dart';

//https://jsonplaceholder.typicode.com/
//https://quicktype.io/
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CommandsModel> commandsModel = [];
  getComments() {
    GetApiServices().getCommentsModel().then((value) {
      setState(() {
        commandsModel = value!;
      });
    });
  }

  @override
  void initState() {
    getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Get Api",
            style: TextStyle(fontSize: 20),
          )),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: commandsModel.length,
          itemBuilder: (context, index) {
            final apidata = commandsModel[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.blue[100],
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      child: Text(
                        apidata.id.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width/1.175,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                       
                         Text(
                          apidata.name.toString(),
                          maxLines: 1,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        Text(
                          apidata.email.toString(),
                          
                              
                        ),
                        Text(
                          apidata.body.toString(),
                         
                        ),
                      
                      ],),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
