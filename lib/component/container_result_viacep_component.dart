import 'package:cep_app/model/viacep_model.dart';
import 'package:flutter/material.dart';

class ContainerResultViaCepComponent extends StatelessWidget {
  const ContainerResultViaCepComponent({
    super.key,
    required this.viacepModel,
  });

  final ViaCepModel viacepModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Rua: ${viacepModel.logradouro ?? ""}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Bairro: ${viacepModel.bairro ?? ""}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Cidade: ${viacepModel.localidade ?? ""}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Estado: ${viacepModel.uf ?? ""}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("CEP: ${viacepModel.cep ?? ""}"),
          ),
        ],
      ),
    );
  }
}
