class BackdropModel {
  BackdropModel({
    required this.aspectRatio,
    required this.height,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  double aspectRatio;
  int height;
  String filePath;
  double voteAverage;
  int voteCount;
  int width;

  factory BackdropModel.fromJson(Map<String, dynamic> json) => BackdropModel(
        aspectRatio: json["aspect_ratio"]?.toDouble(),
        height: json["height"],
        filePath: json["file_path"],
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "aspect_ratio": aspectRatio,
        "height": height,
        "file_path": filePath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "width": width,
      };
}
