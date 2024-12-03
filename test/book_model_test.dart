import 'dart:convert';

import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Book Model Test', () {
    String dummyData = """
    {
      "title": "Harry! (Gedichte)",
      "link": "https://search.shopping.naver.com/book/catalog/32524001879",
      "image": "https://shopping-phinf.pstatic.net/main_3252400/32524001879.20220522144716.jpg",
      "author": "",
      "discount": "21590",
      "publisher": "Books on Demand",
      "pubdate": "20210519",
      "isbn": "9783753499949",
      "description": ""
    }
""";
    // 1. Map으로 변환
    Map<String, dynamic> json = jsonDecode(dummyData);
    // 2. 객체로 변환
    Book book = Book.fromJson(json);
    expect(book.discount, '21590');
  });
}
