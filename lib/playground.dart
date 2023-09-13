// https://pub.dev/packages/http

import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // Uri: authority:path:paramaters
  var url = Uri.http('hn.algolia.com', 'api/v1/search', {'query': 'dart'});

  var response = await http.get(url);

  // decode response
  var parsedJson = json.decode(response.body);

  var result = parsedJson['hits'][0];
  var title = result['title'];
  var link = result['url'];
  print('$title : $link');
}

// Dart language : http://www.dartlang.org/
