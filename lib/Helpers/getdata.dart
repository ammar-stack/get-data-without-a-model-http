import 'dart:convert';
import 'package:http/http.dart' as http;

class Getdata {
  Future<dynamic> getDataWithoutModel() async{
    try{
      var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        return data;
      }
    }
    catch(e){
      print(e);
    }
  }
}