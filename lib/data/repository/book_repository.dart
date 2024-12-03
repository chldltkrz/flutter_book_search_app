import 'dart:convert';

import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:http/http.dart';

class BookRepository {
  Future<List<Book>> searchBooks(String query) async {
    final client = Client();
    final response = await client.get(
        Uri.parse(
            'https://openapi.naver.com/v1/search/book.json?query=${query}'),
        headers: {
          'X-Naver-Client-Id': 'EMRhL1DQlOMYgt5zIhe3',
          'X-Naver-Client-Secret': 'I9Xfobcca5',
        });
    // Get 요청 성공시 200 반환
    // 응답코드가 200일때
    // body데이터를 jsonDecode함수 사용해서 map으로 변환해서 List<Book>으로 변환
    // 200이 아닐때는 빈 리스트 반환
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      final items = List.from(map['items']);
      return items.map((e) {
        return Book.fromJson(e);
      }).toList();
    }
    return [];
  }
}
