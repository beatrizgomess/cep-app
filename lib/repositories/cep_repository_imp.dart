import 'dart:convert';
import 'package:cep_app/model/cep_back4app_model.dart';
import 'package:cep_app/repositories/cep_repository.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

class CepRepositoryImp implements CepRepository {
  @override
  Future<CepBack4appModel> getAddress() async {
    var dio = Dio();
    dio.options.headers["X-Parse-Application-Id"] =
        "jh9SJESFmkFluBepivPk6yxxuv4via0xC15YAPAq";
    dio.options.headers["X-Parse-REST-API-Key"] =
        "txasY03gBvNuem7zeUT47xsm8kLV760X0TQGUfcn";

    var result = await dio.get("https://parseapi.back4app.com/classes/cep");
    print(result.statusCode);
    print(result.data);
    return CepBack4appModel.fromJson(result.data);
  }
}
