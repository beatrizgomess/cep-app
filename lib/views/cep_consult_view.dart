import 'dart:convert';

import 'package:cep_app/component/container_result_cep_component.dart';
import 'package:cep_app/constants/constants.dart';
import 'package:cep_app/model/cep_back4app_model.dart';

import 'package:cep_app/repositories/cep_repository_imp.dart';
import 'package:flutter/material.dart';

class CepConsultView extends StatefulWidget {
  const CepConsultView({super.key});

  @override
  State<CepConsultView> createState() => _CepConsultViewState();
}

class _CepConsultViewState extends State<CepConsultView> {
  var cepController = TextEditingController(text: "");

  var cep = "";
  bool loading = false;
  var cepBak4appModel = CepBack4appModel([]);
  var cepRepositoryImp = CepRepositoryImp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade700,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20, left: 5),
                child: Text("Consulte seu CEP",
                    style: TextStyle(color: Colors.white, fontSize: 25)),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(50),
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
                            cepBak4appModel =
                                await cepRepositoryImp.getAddress();
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
                      ContainerResultViaCepComponent(),
                      if (loading) const CircularProgressIndicator()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
