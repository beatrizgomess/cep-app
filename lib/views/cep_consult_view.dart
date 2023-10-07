import 'dart:convert';

import 'package:cep_app/component/container_result_viacep_component.dart';
import 'package:cep_app/component/list_address_component.dart';
import 'package:cep_app/constants/constants.dart';
import 'package:cep_app/controller/addressController.dart';
import 'package:cep_app/model/viacep_model.dart';
import 'package:cep_app/services/viaCep_service.dart';
import 'package:flutter/material.dart';

class CepConsultView extends StatefulWidget {
  const CepConsultView({super.key});

  @override
  State<CepConsultView> createState() => _CepConsultViewState();
}

class _CepConsultViewState extends State<CepConsultView> {
  var cepController = TextEditingController(text: "");
  var ruaController = TextEditingController(text: "");
  var bairroControlelr = TextEditingController(text: "");
  var cidadeController = TextEditingController(text: "");
  var estadoController = TextEditingController(text: "");

  var cep = "";
  bool loading = false;
  ViaCepModel viacepModel = ViaCepModel();
  var viaCepController = AddressController();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      var positionPagination = _scrollController.position.maxScrollExtent * 0.7;
      if (_scrollController.position.pixels > positionPagination) {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
      ),
      body: ListView(scrollDirection: Axis.vertical, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                maxLength: 8,
                keyboardType: TextInputType.number,
                controller: cepController,
                onChanged: (String value) async {
                  cep = value.replaceAll(Constants.regex, '');
                  if (cep.length == 8) {
                    setState(() {
                      loading = true;
                    });
                    viacepModel = await viaCepController.cepConsult(cep);
                  }
                  setState(() {
                    loading = false;
                  });
                },
                decoration: InputDecoration(
                    hintText: "CEP",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(height: 20),
              const Divider(height: 3),
              const SizedBox(height: 20),
              ContainerResultViaCepComponent(viacepModel: viacepModel),
              ListAddressComponent()
            ],
          ),
        ),
      ]),
    );
  }
}
