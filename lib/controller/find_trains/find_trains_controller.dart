import 'package:flutter/material.dart';
import 'package:flutter_find_my_train/lib.dart';
import 'package:get/get.dart';

class FindTrainsController extends GetxController {
  DayFilters selectedDayFiltersValue = DayFilters.today;

  DateTime selectedFilterDate = DateTime.now();

  void onChangeDayFilter(
    DayFilters value,
    String updateId,
    BuildContext context,
  ) async {
    selectedDayFiltersValue = value;
    if (value == DayFilters.custom) {
      await Utility.customDatePicker(
        context: context,
        selectedDate: (dateTime) {
          selectedFilterDate = dateTime;
        },
        initialDate: selectedFilterDate,
        firstDate: DateTime.now(),
      );
    }
    Get.back<void>();
    update([updateId]);
  }

  List<FindTrainResponse> trainsResponseDataList = [
    FindTrainResponse(
      trainNumber: '22221',
      trainName: 'MUMBAI CSMT - HAZRAT NIZAMUDDIN Rajdhani Express',
      runDays: ['Mon', 'Tue', 'Wed'],
      trainSrc: 'Mumbai',
      trainDstn: 'Delhi',
      fromStd: '17:55',
      fromSta: 'Mumbai CSMT',
      localTrainFromSta: 1,
      toSta: 'Hazrat Nizamuddin',
      toStd: '06:55',
      fromDay: 1,
      toDay: 2,
      dDay: 1,
      from: 'Mumbai',
      to: 'Delhi',
      fromStationName: 'Mumbai CSMT',
      toStationName: 'Hazrat Nizamuddin',
      duration: '17:55',
      specialTrain: true,
      trainType: 'Rajdhani Express',
      trainDate: '2022-01-01',
      classType: ['1A', '2A', '3A'],
    ),
    FindTrainResponse(
      trainNumber: '22222',
      trainName: 'DELHI - MUMBAI CSMT Rajdhani Express',
      runDays: ['Thu', 'Fri', 'Sat'],
      trainSrc: 'Delhi',
      trainDstn: 'Mumbai',
      fromStd: '18:00',
      fromSta: 'Hazrat Nizamuddin',
      localTrainFromSta: 2,
      toSta: 'Mumbai CSMT',
      toStd: '07:00',
      fromDay: 2,
      toDay: 3,
      dDay: 1,
      from: 'Delhi',
      to: 'Mumbai',
      fromStationName: 'Hazrat Nizamuddin',
      toStationName: 'Mumbai CSMT',
      duration: '18:00',
      specialTrain: false,
      trainType: 'Rajdhani Express',
      trainDate: '2022-01-02',
      classType: ['SL', '1A', '2A', '3A'],
    ),
  ];
}
