
import 'package:http/http.dart' as http;

class NetworkHandler{

  static Future<http.Response?> getApiCall({String? url, Map<String,String>? headers})async{

    try{
      final response = await http.get(Uri.tryParse(url!)!,headers: headers!);


      return response;
    }catch(e){
      print("Got error $e");
    }
}


}