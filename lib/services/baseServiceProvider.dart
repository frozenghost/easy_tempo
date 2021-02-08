import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BaseServiceProvider {
  BaseServiceProvider({
    @required this.dio,
    this.errorCallBack,
  }) : assert(dio != null);

  final Dio dio;
  final Function errorCallBack;

  void processHeaders(Map<String, String> headers) {
    if (headers != null) {
      dio.options.headers.addAll(headers);
    }
  }

  void handleExceptions(DioError error) {
    Response errorResponse;
    if (error.response != null) {
      errorResponse = error.response;
    } else {
      errorResponse = new Response(statusCode: 666);
    }
    errorCallBack(errorResponse);
  }

  Future<Response> get(String url, Map<String, String> headers) async {
    Response response;

    processHeaders(headers);
    try {
      response = await dio.get(url);
    } on DioError catch (error) {
      handleExceptions(error);
    } catch (exception) {
      handleExceptions(exception);
    }

    return response;
  }

  Future<Response> post(
      String url, Map<String, String> headers, dynamic formData) async {
    Response response;

    processHeaders(headers);
    try {
      response = await dio.post(url, data: formData);
    } on DioError catch (error) {
      handleExceptions(error);
    } catch (exception) {
      handleExceptions(exception);
    }

    return response;
  }

  Future<Response> delete(
      String url, Map<String, String> headers, dynamic formData) async {
    Response response;

    processHeaders(headers);
    try {
      response = await dio.delete(url, data: formData);
    } on DioError catch (error) {
      handleExceptions(error);
    } catch (exception) {
      handleExceptions(exception);
    }

    return response;
  }
}
