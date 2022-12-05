import 'package:http/http.dart' as http;
import 'package:canwe/models/donasi.dart';
import 'dart:convert';

Future<List<Donasi>> fetchDonasi() async {
  var url = Uri.parse('https://canwe.pythonanywhere.com/donasi/get-data-donasi/');
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object WatchList
  List<Donasi> listDonasi = [];
  for (var d in data) {
    if (d != null) {
      listDonasi.add(Donasi.fromJson(d));
    }
  }

  return listDonasi;
}