import 'package:http/http.dart' as http;
import 'package:canwe/models/contact.dart';
import 'dart:convert';

Future<List<Contact>> fetchFAQ() async {
  var url = Uri.parse('https://canwe.pythonanywhere.com/json/');
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object WatchList
  List<Contact> listFAQ = [];
  for (var d in data) {
    if (d != null) {
      listFAQ.add(Contact.fromJson(d));
    }
  }

  return listFAQ;
}

void join(request, nama, email, pertanyaan) async {
  await request.post(
    'https://canwe.pythonanywhere.com/question-page/',
    {"name": nama, "email": email, "question": pertanyaan});
}