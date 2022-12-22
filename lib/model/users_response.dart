import 'dart:convert';

class UsersResponse {
  final int totalCount;
  final bool incompleteResults;
  final List<User> items;
  UsersResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'total_count': totalCount,
      'incomplete_results': incompleteResults,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory UsersResponse.fromMap(Map<String, dynamic> map) {
    return UsersResponse(
      totalCount: map['total_count'] ?? 0,
      incompleteResults: map['incomplete_results'] ?? false,
      items: map['items'] == null
          ? []
          : List<User>.from(
              (map['items']).map<User>(
                (x) => User.fromMap(x),
              ),
            ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UsersResponse.fromJson(String source) =>
      UsersResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'UsersResponse(total_count: $totalCount, incomplete_results: $incompleteResults, items: $items)';
}

class User {
  String? name;
  String? displayName;
  String? shortDescription;
  String? description;
  String? createdBy;
  String? released;
  String? createdAt;
  String? updatedAt;
  bool? featured;
  bool? curated;
  double? score;
  User({
    required this.name,
    required this.displayName,
    required this.shortDescription,
    required this.description,
    required this.createdBy,
    required this.released,
    required this.createdAt,
    required this.updatedAt,
    required this.featured,
    required this.curated,
    required this.score,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'displayName': displayName,
      'shortDescription': shortDescription,
      'description': description,
      'createdBy': createdBy,
      'released': released,
      'updatedAt': updatedAt,
      'featured': featured,
      'curated': curated,
      'score': score
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      displayName: map['displayName'] ?? '',
      shortDescription: map['shortDescription'] ?? '',
      description: map['description'] ?? '',
      createdBy: map['createdBy'] ?? '',
      createdAt:map['createdAt'] ?? '',
      released: map['released'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      featured: map['featured'] ?? '',
      curated: map['curated'] ?? '',
      score: map['score'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);


}
