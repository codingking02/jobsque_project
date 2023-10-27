import 'dart:convert';

class PortfoliosModel {
  Data data;

  PortfoliosModel({
    required this.data,
  });

  factory PortfoliosModel.fromJson(Map<String, dynamic> json) =>
      PortfoliosModel(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  List<PortfolioModel> portfolio;

  Data({
    required this.portfolio,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        portfolio: List<PortfolioModel>.from(
            json["portfolio"].map((x) => PortfolioModel.fromJson(x))),
      );
}

class PortfolioModel {
  int id;
  String cvFile;
  String name;
  String image;
  int userId;

  PortfolioModel({
    required this.id,
    required this.cvFile,
    required this.name,
    required this.image,
    required this.userId,
  });

  factory PortfolioModel.fromJson(Map<String, dynamic> json) => PortfolioModel(
        id: json["id"],
        cvFile: json["cv_file"],
        name: json["name"],
        image: json["image"],
        userId: json["user_id"],
      );
}
