class GenreModel {
  GenreModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
