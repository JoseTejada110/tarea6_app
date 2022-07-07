import 'package:http/http.dart' as http;
import 'package:tarea6_app/models/digimon_model.dart';

Future<List<Digimon>> getDigimons() async{
  final url = Uri.parse('https://digimon-api.herokuapp.com/api/digimon');
  final resp = await http.get(url);
  if (resp.statusCode == 200) {
    return digimonsFromJson(resp.body);
  } else {
    return <Digimon>[];
  }
}