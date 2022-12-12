import 'package:http/http.dart' as http;
import 'package:canwe/models/user_detail.dart';
import 'dart:convert';

Future<List<UserDetail>> fetchUserDetail() async {
  var url = Uri.parse('https://canwe.pythonanywhere.com/galang-dana/get-user-count/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<UserDetail> listUserDetail = [];
  for (var d in data) {
    if (d != null) {
      final UserDetail userDetail = UserDetail.fromJson(d);
      listUserDetail.add(userDetail);
    }
  }

  return listUserDetail;
}
