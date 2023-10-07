import 'dart:convert';

import 'package:cep_app/constants/constants.dart';
import 'package:cep_app/model/viacep_model.dart';
import 'package:cep_app/repositories/viaCep_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddressController implements ViaCepRepository {
  @override
  List<ViaCepModel> ceps = [];
  var viaCepModel = ViaCepModel();
  String _snackbarMessage = '';

  @override
  Future<List<ViaCepModel>> getAddress() async {
    try {
      var response = await http.get(Uri.parse(Constants.urlBack4app),
          headers: Constants.headers);
      debugPrint(response.body);
      if (response.statusCode == 200) {
        var body = response.body;
        var json = jsonDecode(body);

        return (json['results'] as List)
            .map((e) => ViaCepModel.fromJson(e))
            .toList();
      } else {
        throw Exception('Erro na solicitação HTTP: ${response.statusCode}');
      }
    } catch (e) {
      // Lida com exceções gerais, como erro de conexão
      throw Exception('Erro ao obter CEPs: $e');
    }
  }

  Future<ViaCepModel> cepConsult(String cep) async {
    var response =
        await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
    debugPrint(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      getCep(cep);
      return ViaCepModel.fromJson(jsonResponse);
    } else {
      return ViaCepModel();
    }
  }

  bool getCep(String cep) {
    for (var element in ceps) {
      if (element.cep == viaCepModel.cep) {
        print("Achou");
        _snackbarMessage = "O CEP já consta na sua lista";

        return true;
      }
    }
    return false;
  }

  @override
  Future<void> createAddress(ViaCepModel cep) async {
    try {
      var responde = await http.post(
        Uri.parse("https://parseapi.back4app.com/classes/viacep"),
        headers: Constants.headers,
        body: jsonEncode(cep.toJson()),
      );
      if (responde.statusCode == 200) {
        print(responde.body);
      }
    } catch (e) {
      throw Exception('Erro ao salvar CEP: $e');
    }
  }

  @override
  Future<void> deleteAddress(String id) async {
    try {
      var response = await http.delete(
          Uri.parse(Constants.urlBack4app + '/${id}'),
          headers: Constants.headers);
    } catch (e) {
      throw Exception('Erro ao deletar CEP: $e');
    }
  }

  @override
  Future<ViaCepModel> updateAddress(ViaCepModel viaCepModel) async {
    try {
      await http.put(
        Uri.parse('${Constants.urlBack4app}/${viaCepModel.objectId}'),
        headers: Constants.headers,
        body: jsonEncode(viaCepModel.toJson()),
      );
    } catch (e) {
      throw Exception('Erro ao atualizar CEP: $e');
    }
    return viaCepModel;
  }
}
