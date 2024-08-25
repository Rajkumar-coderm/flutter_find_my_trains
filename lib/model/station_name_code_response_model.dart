import 'dart:convert';

List<StationDataModel> stationDataModelFromJson(String str) =>
    List<StationDataModel>.from((json.decode(str) as List).map(
      (e) => StationDataModel.fromJson(e as Map<String, dynamic>),
    ));

String stationDataModelToJson(List<StationDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StationDataModel {
  StationDataModel({
    this.data,
  });

  factory StationDataModel.fromJson(Map<String, dynamic> json) =>
      StationDataModel(
        data: (json['data'] as List).isEmpty || json['data'] == null
            ? []
            : List<StationData>.from(
                (json['data'] as List).map(
                  (e) => StationData.fromJson(e as Map<String, dynamic>),
                ),
              ),
      );

  List<StationData>? data;

  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(
          data?.map((x) => x.toJson()) ?? [],
        ),
      };
}

class StationData {
  StationData({
    this.name,
    this.code,
  });

  factory StationData.fromJson(Map<String, dynamic> json) => StationData(
        name: json['name'] as String? ?? '',
        code: json['code'] as String? ?? '',
      );

  String? name;
  String? code;

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
      };
}
