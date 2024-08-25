// coverage:ignore-file

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_find_my_train/lib.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

/// API WRAPPER to call all the APIs and handle the error status codes
class ApiWrapper {
  /// Method to make all the requests inside the app like GET, POST, PUT, Delete
  Future<ResponseModel> makeRequest(String apiUrl, Request request,
      dynamic data, bool isLoading, Map<String, String> headers) async {
    Future<ResponseModel> _responseModel;
    if (kIsWeb) {
      _responseModel = makeFinalRequest(
        apiUrl,
        request,
        data,
        isLoading,
        headers,
      );
      return _responseModel;
    } else {
      /// To see whether the network is available or not
      if (await Utility.isNetworkAvailable()) {
        _responseModel = makeFinalRequest(
          apiUrl,
          request,
          data,
          isLoading,
          headers,
        );

        return _responseModel;
      }

      /// If there is no network available then instead of print can show the no internet widget too
      else {
        return ResponseModel(
          data:
              '{"message":"No internet, please enable mobile data or wi-fi in your phone settings and try again"}',
          hasError: true,
          errorCode: 1000,
        );
      }
    }
  }

  /// Method to make all the requests inside the app like GET, POST, PUT, Delete
  Future<ResponseModel> makeFinalRequest(String apiUrl, Request request,
      dynamic data, bool isLoading, Map<String, String> headers) async {
    Utility.printILog(
      'request $request body ${jsonEncode(data)}  url $apiUrl  headers $headers ',
    );
    switch (request) {
      /// Method to make the Get type request
      case Request.get:
        {
          //var uri = _baseUrl + url;

          if (isLoading && !Get.testMode) Utility.showLoadingDialog();

          try {
            final response = await http
                .get(
                  Uri.parse(apiUrl),
                  headers: headers,
                )
                .timeout(const Duration(seconds: 60));
            if (isLoading && !Get.testMode) Utility.closeDialog();

            Utility.printILog(apiUrl);
            return _returnResponse(response);
          } on TimeoutException catch (_) {
            Utility.closeDialog();
            return ResponseModel(
                data: '{"message":"Request timed out"}', hasError: true);
          }
        }
      case Request.post:

        /// Method to make the Post type request
        {
          try {
            if (isLoading && !Get.testMode) Utility.showLoadingDialog();
            final response = await http
                .post(
                  Uri.parse(apiUrl),
                  body: jsonEncode(data),
                  headers: headers,
                )
                .timeout(const Duration(seconds: 60));

            if (isLoading && !Get.testMode) Utility.closeDialog();

            Utility.printILog(apiUrl);
            return _returnResponse(response);
          } on TimeoutException catch (_) {
            Utility.closeDialog();
            return ResponseModel(
                data: '{"message":"Request timed out"}', hasError: true);
          }
        }
      case Request.put:

        /// Method to make the Put type request
        {
          try {
            if (isLoading && !Get.testMode) Utility.showLoadingDialog();
            final response = await http
                .put(
                  Uri.parse(apiUrl),
                  body: jsonEncode(data),
                  headers: headers,
                )
                .timeout(const Duration(seconds: 60));

            if (isLoading && !Get.testMode) Utility.closeDialog();

            Utility.printILog(apiUrl);
            return _returnResponse(response);
          } on TimeoutException catch (_) {
            Utility.closeDialog();
            return ResponseModel(
                data: '{"message":"Request timed out"}', hasError: true);
          }
        }

      case Request.patch:

        /// Method to make the Patch type request
        {
          try {
            if (isLoading && !Get.testMode) Utility.showLoadingDialog();
            final response = await http
                .patch(
                  Uri.parse(apiUrl),
                  body: jsonEncode(data),
                  headers: headers,
                )
                .timeout(const Duration(seconds: 60));

            if (isLoading && !Get.testMode) Utility.closeDialog();

            Utility.printILog(apiUrl);
            return _returnResponse(response);
          } on TimeoutException catch (_) {
            Utility.closeDialog();
            return ResponseModel(
                data: '{"message":"Request timed out"}',
                hasError: true,
                errorCode: 1000);
          }
        }
      case Request.delete:

        /// Method to make the Delete type request
        {
          try {
            if (isLoading && !Get.testMode) Utility.showLoadingDialog();
            final response = await http
                .delete(
                  Uri.parse(apiUrl),
                  body: jsonEncode(data),
                  headers: headers,
                )
                .timeout(const Duration(seconds: 60));

            if (isLoading && !Get.testMode) Utility.closeDialog();

            Utility.printILog(apiUrl);
            Utility.printILog(response.body);

            return _returnResponse(response);
          } on TimeoutException catch (_) {
            if (isLoading && !Get.testMode) Utility.closeDialog();
            return ResponseModel(
                data: '{"message":"Request timed out"}', hasError: true);
          }
        }
    }
  }
}

/// Method to return the API response based upon the status code of the server
ResponseModel _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
    case 202:
    case 203:
    case 205:
    case 208:
      return ResponseModel(
        data: response.body,
        hasError: false,
        errorCode: response.statusCode,
      );

    case 204:
      {
        Utility.printILog(response.statusCode.toString());
        return ResponseModel(
          data: '{}',
          hasError: false,
          errorCode: response.statusCode,
        );
      }
    case 400:
      return ResponseModel(
        data: response.body,
        hasError: true,
        errorCode: response.statusCode,
      );
    case 401:
    case 406:
    case 409:
    case 500:
      return ResponseModel(
        data: response.body,
        hasError: true,
        errorCode: response.statusCode,
      );
    case 502:
      return ResponseModel(
        data: response.body,
        hasError: true,
        errorCode: response.statusCode,
      );
    case 522:
      return ResponseModel(
        data: response.body,
        hasError: true,
        errorCode: response.statusCode,
      );

    default:
      return ResponseModel(
          data: response.body, hasError: true, errorCode: response.statusCode);
  }
}
