import 'dart:convert';

class GenresModels {
  final int id;
  final  String name;
  
  GenresModels({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
  
    return result;
  }

  factory GenresModels.fromMap(Map<String, dynamic> map) {
    return GenresModels(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GenresModels.fromJson(String source) => GenresModels.fromMap(json.decode(source));

  @override
  String toString() => 'GenresModels(id: $id, name: $name)';
}
