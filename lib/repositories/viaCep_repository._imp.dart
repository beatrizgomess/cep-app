import 'dart:convert';

import 'package:cep_app/model/viacep_model.dart';
import 'package:cep_app/repositories/viaCep_repository.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class ViaCepRepositoryImp implements ViaCepRepository {
  @override
  Future<ViaCepModel> getAddress(String cep) async {
    var response =
        await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
    debugPrint(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return ViaCepModel.fromJson(jsonResponse);
    } else {
      return ViaCepModel();
    }
  }
}
