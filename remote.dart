import 'package:flutter_application_1/employee.dart';
import 'package:http/http.dart' as http;

class remote{
  Future<List<Employee>?> getemployeee() async
  {
   var client = http.Client();

   var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return employeeFromJson(json);
    }
    return null;
  }
}