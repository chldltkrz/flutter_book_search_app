class Book {
  String title;
  String link;
  String image;
  String author;
  String discount;
  String publisher;
  String pubdate;
  String isbn;
  String description;

  Book({
    required this.title,
    required this.link,
    required this.image,
    required this.author,
    required this.discount,
    required this.publisher,
    required this.pubdate,
    required this.isbn,
    required this.description,
  });

  // fromJson() 메서드를 추가합니다.
  Book.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title'],
          link: json['link'],
          image: json['image'],
          author: json['author'],
          discount: json['discount'],
          publisher: json['publisher'],
          pubdate: json['pubdate'],
          isbn: json['isbn'],
          description: json['description'],
        );
  // toJson() 메서드 만들기
  Map<String, dynamic> toJson() => {
        'title': title,
        'link': link,
        'image': image,
        'author': author,
        'discount': discount,
        'publisher': publisher,
        'pubdate': pubdate,
        'isbn': isbn,
        'description': description,
      };
}
