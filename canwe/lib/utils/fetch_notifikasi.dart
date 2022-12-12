
import 'package:canwe/models/notifikasi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Notifikasi>> fetchNotifikasi() async {
  var url = Uri.parse('https://canwe.pythonanywhere.com/notifikasi/json/');
  var response = await http.get(
    url,
    headers: {
      // "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Notifikasi> listNotifikasi = [];
  for (var d in data) {
    if (d != null) {
      listNotifikasi.add(Notifikasi.fromJson(d));
    }
  }
  return listNotifikasi;
}
// https://canwe.pythonanywhere.com/notifikasi/delete_flutter/49/
Future<List<Notifikasi>> deleteAlbum(String id) async {
  var url = Uri.parse('https://canwe.pythonanywhere.com/notifikasi/delete/$id/');
  var response = await http.delete(
    url,
    headers: {
      // "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
  
  List<Notifikasi> listNotifikasi = [];
  
  return listNotifikasi;
}