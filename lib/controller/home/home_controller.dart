import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_find_my_train/lib.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController fromStationController = TextEditingController();
  TextEditingController toStationController = TextEditingController();

  FocusNode fromStationNode = FocusNode();
  FocusNode toStationNode = FocusNode();

  void onValidateFindTrainsButton(BuildContext context) {
    if (selectedFromStation == null || selectedToStation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xffC7253E),
          content: Text(
            'Please Select a proper Source Station.',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }

  void swipeStationValue(String updateId) {
    final _fromLocalValue = fromStationController.text;
    final _toLocalValue = toStationController.text;
    fromStationController.text = _toLocalValue;
    toStationController.text = _fromLocalValue;
    update([updateId]);
  }

  List<StationData> stationCodeNameDataList = [];

  StationData? selectedFromStation;
  StationData? selectedToStation;

  void onSelectFormStation(StationData data, String updateId) {
    selectedFromStation = data;
    fromStationController.text = data.name ?? '';
    update([updateId]);
  }

  void onSelectToStation(StationData data, String updateId) {
    selectedToStation = data;
    toStationController.text = data.name ?? '';
    update([updateId]);
  }

  Future<void> onGetAllStationNameAndCode(String updateId) async {
    final response = await rootBundle.loadString(
      'assets/json/indian_railway_station_code_name.json',
    );
    if (response.trim().isNotEmpty) {
      final res = stationDataModelFromJson(response);
      if (res.isNotEmpty) {
        stationCodeNameDataList.clear();
        stationCodeNameDataList
            .addAll(List<StationData>.from(res.first.data ?? []));
        Get.log('Station Code Name Response: ${res.map(
          (e) => e.toJson(),
        )}');
      }
    }
    update([updateId]);
  }

  Future<List<StationData>> onStationSearch(String query) async {
    final _dataList = List<StationData>.from(stationCodeNameDataList);
    var _returnDataList = <StationData>[];
    _returnDataList = List<StationData>.from(
      _dataList.where(
        (el) =>
            (el.name ?? '').toLowerCase().contains(query.trim().toLowerCase()),
      ),
    ).toList();
    return _returnDataList;
  }

  void onChangeFromStation(String value, String updateId) {
    if (value.trim().isEmpty) {
      selectedFromStation = null;
    }
    update([updateId]);
  }

  void onChangeToStation(String value, String updateId) {
    if (value.trim().isEmpty) {
      selectedToStation = null;
    }
    update([updateId]);
  }

  void onClearFromStationField(String updateId) {
    selectedFromStation = null;
    fromStationController.clear();
    update([updateId]);
  }

  void onClearToStationField(String updateId) {
    selectedToStation = null;
    toStationController.clear();
    update([updateId]);
  }

  @override
  void onInit() async {
    super.onInit();
    await onGetAllStationNameAndCode(HomePageView.updateId);
  }
}
