import 'dart:convert';

FindTrainResponseModel findTrainResponseModelFromJson(String str) =>
    FindTrainResponseModel.fromJson(json.decode(str));

String findTrainResponseModelToJson(FindTrainResponseModel data) =>
    json.encode(data.toJson());

class FindTrainResponseModel {
  FindTrainResponseModel({
    required this.timestamp,
    required this.data,
  });

  factory FindTrainResponseModel.fromJson(Map<String, dynamic> json) =>
      FindTrainResponseModel(
        timestamp: json['timestamp'] as int? ?? 0,
        data: List<FindTrainResponse>.from(
          (json['data'] as List).map(
            (e) => FindTrainResponse.fromJson(e as Map<String, dynamic>),
          ),
        ),
      );
  int timestamp;
  List<FindTrainResponse> data;

  Map<String, dynamic> toJson() => {
        'timestamp': timestamp,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FindTrainResponse {
  FindTrainResponse({
    this.trainNumber,
    this.trainName,
    this.runDays,
    this.trainSrc,
    this.trainDstn,
    this.fromStd,
    this.fromSta,
    this.localTrainFromSta,
    this.toSta,
    this.toStd,
    this.fromDay,
    this.toDay,
    this.dDay,
    this.from,
    this.to,
    this.fromStationName,
    this.toStationName,
    this.duration,
    this.specialTrain,
    this.trainType,
    this.trainDate,
    this.classType,
  });

  factory FindTrainResponse.fromJson(Map<String, dynamic> json) =>
      FindTrainResponse(
        trainNumber: json['train_number'] as String? ?? '',
        trainName: json['train_name'] as String? ?? '',
        runDays: json['run_days'] == null
            ? []
            : List<String>.from((json['run_days'] as List).map((x) => x)),
        trainSrc: json['train_src'] as String? ?? '',
        trainDstn: json['train_dstn'] as String? ?? '',
        fromStd: json['from_std'] as String? ?? '',
        fromSta: json['from_sta'] as String? ?? '',
        localTrainFromSta: json['local_train_from_sta'] as int? ?? 0,
        toSta: json['to_sta'] as String? ?? '',
        toStd: json['to_std'] as String? ?? '',
        fromDay: json['from_day'] as int? ?? 0,
        toDay: json['to_day'] as int? ?? 0,
        dDay: json['d_day'] as int? ?? 0,
        from: json['from'] as String? ?? '',
        to: json['to'] as String? ?? '',
        fromStationName: json['from_station_name'] as String? ?? '',
        toStationName: json['to_station_name'] as String? ?? '',
        duration: json['duration'] as String? ?? '',
        specialTrain: json['special_train'] as bool? ?? false,
        trainType: json['train_type'] as String? ?? '',
        trainDate: json['train_date'] as String? ?? '',
        classType: json['class_type'] == null
            ? []
            : List<String>.from((json['class_type'] as List).map((x) => x)),
      );
  String? trainNumber;
  String? trainName;
  List<String>? runDays;
  String? trainSrc;
  String? trainDstn;
  String? fromStd;
  String? fromSta;
  int? localTrainFromSta;
  String? toSta;
  String? toStd;
  int? fromDay;
  int? toDay;
  int? dDay;
  String? from;
  String? to;
  String? fromStationName;
  String? toStationName;
  String? duration;
  bool? specialTrain;
  String? trainType;
  String? trainDate;
  List<String>? classType;

  Map<String, dynamic> toJson() => {
        'train_number': trainNumber,
        'train_name': trainName,
        'run_days': List<dynamic>.from(runDays?.map((x) => x) ?? []),
        'train_src': trainSrc,
        'train_dstn': trainDstn,
        'from_std': fromStd,
        'from_sta': fromSta,
        'local_train_from_sta': localTrainFromSta,
        'to_sta': toSta,
        'to_std': toStd,
        'from_day': fromDay,
        'to_day': toDay,
        'd_day': dDay,
        'from': from,
        'to': to,
        'from_station_name': fromStationName,
        'to_station_name': toStationName,
        'duration': duration,
        'special_train': specialTrain,
        'train_type': trainType,
        'train_date': trainDate,
        'class_type': List<dynamic>.from(classType?.map((x) => x) ?? []),
      };
}
