
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:jobswire/models/newmodel.dart';

class GetNewsService {

  int arrSize = 0;

  getNews()async{

    String url = "https://api.collectapi.com/news/getNews?country=tr&tag=general";

    var response = await http.get(Uri.parse(url),   headers: {
      'content-type': 'application/json',
      'authorization': 'apikey 3lIJHHGCspaRvxicgit1VA:6lBhw02oiptWV4YUyeNqWa'
    }
    );

    Map<String, dynamic> responseJson = json.decode(response.body);

    var newArr = responseJson['result'];
    //return await parseJSON(responseJson);



    return newArr;
  }
}

parseJSON(var responseJson)async{


  NewModel model = new NewModel(responseJson["key"],responseJson["url"],responseJson["description"],responseJson["image"],responseJson["name"],responseJson["source"]);


  return model;

}