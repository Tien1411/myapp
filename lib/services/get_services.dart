import 'package:myapp/models/get_model.dart';
import 'package:http/http.dart' as http;
class GetApiServices{
  Future<List<CommandsModel>?>getCommentsModel() async {
    // value reponse 
    var data = http.Client();

    var uri = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    var response = await data.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return commandsModelFromJson(json);
    }
    return null;
  }
}