import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // create a Regex pattern
  RegExp string = RegExp(r'(\w+)');

  // data
  String data = "Dart is awesome!";

  // first match
  RegExpMatch? match = string.firstMatch(data);
  print(match![0]);

  // all matches
  Iterable<RegExpMatch> matches = string.allMatches(data);
  for (final m in matches) {
    print(m[0]);
  }

  // has match
  print(string.hasMatch(data));
}
