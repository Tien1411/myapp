import 'package:flutter/material.dart';
import 'package:myapp/services/profile_api.dart';

class GetMethodWithoutModel extends StatefulWidget {
  const GetMethodWithoutModel({super.key});

  @override
  State<GetMethodWithoutModel> createState() => _GetMethodWithoutModelState();
}

class _GetMethodWithoutModelState extends State<GetMethodWithoutModel> {
  dynamic postModelData = [];
  bool isLoading = false;
  getPost() {
    ApiProfileService().getRequestWithoutModel().then((value) {
      setState(() {
        postModelData = value;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
@override
void initState() {
    getPost();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Get Method Without Model'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: postModelData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    userInfo(index,"Name : ",postModelData[index]["name"].toString()),
                    userInfo(index,"Eamil : ",postModelData[index]["name"].toString()),
                  ],
                );
              }),
    );
  }

  Row userInfo(int index,name,value) {
    return Row(
                    children: [
                      Text(name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Text(value),
                    ],
                  );
  }
}
