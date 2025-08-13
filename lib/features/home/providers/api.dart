// features/home/providers/api.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api
{
  Future getapi ( url) async
  {
    final urlfinsh = Uri.parse(url);
    var responsebody = null;
    final response = await http.get(
      urlfinsh,
      headers: {
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      responsebody = jsonDecode(response.body);

    } else if(response.statusCode == 504){
      responsebody = {
        "status" : false,
        "message" : "sirver not connect"
      };
    }else{
      responsebody = {
      "status": false,
      "message": "Error: ${response.statusCode}"
    };
    }
    return responsebody;
  }

}