import 'dart:convert';

class ProductDto {
  final String id;
  final String title;

 const ProductDto({required this.id, required this.title});

  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory ProductDto.fromMap(Map<String, dynamic> map) {
    return ProductDto(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDto.fromJson(String source) => ProductDto.fromMap(json.decode(source));

  @override
  String toString() => 'ProductDto(id: $id, title: $title)';
}
