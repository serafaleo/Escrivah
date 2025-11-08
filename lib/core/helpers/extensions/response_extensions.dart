import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;

extension ResponseExtensions on Response<Object> {
  Document toDocument() {
    final String htmlString = data.toString();
    return parser.parse(htmlString);
  }
}
