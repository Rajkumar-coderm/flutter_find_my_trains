import 'dart:developer' as log;

import 'package:flutter/material.dart';
import 'package:flutter_find_my_train/lib.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';

abstract class Utility {
  /// Returns true if the internet connection is available.
  static Future<bool> isNetworkAvailable() async =>
      await InternetConnectionChecker().hasConnection;

  /// Close any open dialog.
  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }

  /// Show a loading progress indicator
  /// on top of the screen.
  static void showLoadingDialog() async {
    if (Get.isDialogOpen == true) {
      Utility.closeDialog();
    }
    await Get.dialog<void>(
      PopScope(
        canPop: false,
        onPopInvoked: (didPop) {},
        child: Align(
          alignment: Alignment.center,
          child: Container(),
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// [message] : The message which needed to be print.
  static void printILog(String message) {
    log.log('${'train-tracker'} $message');
  }

  /// [customDatePicker] (to pick the date from the calendar)  to use it as datePicker when ever we requried when can modifed the date picker at one place.. (universal)
  static Future<void> customDatePicker({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    required Function(DateTime dateTime) selectedDate,
    bool showFeatureDate = true,
  }) async {
    var date = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(4000),
      builder: (context, child) => Theme(
        data: calenderThemeData(),
        child: child!,
      ),
    );
    if (date != null) {
      selectedDate(date.toLocal());
    }
  }

  static String returnFormatedDate(DateTime dateTime) {
    var dateFormat = DateFormat('dd-MMM');
    var formattedDate = dateFormat.format(dateTime);
    return formattedDate;
  }

  static String return12HourseFormat(String timeString) {
    var inputFormat = DateFormat('HH:mm');
    var dateTime = inputFormat.parse(timeString);
    var outputFormat = DateFormat('hh:mm a');
    var formattedTime = outputFormat.format(dateTime);
    return formattedTime;
  }
}

ThemeData calenderThemeData() => ThemeData(
      useMaterial3: false,
      datePickerTheme: const DatePickerThemeData(
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
      colorScheme: ColorScheme.light(
        primary: ColorsValue.primaryColor,
        onSurface: Colors.black,
        onPrimary: Colors.black,
      ),
    );
