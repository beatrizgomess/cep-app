import 'package:cep_app/model/cep_back4app_model.dart';
import 'package:cep_app/repositories/cep_repository_imp.dart';
import 'package:flutter/material.dart';

class ContainerResultViaCepComponent extends StatefulWidget {
  ContainerResultViaCepComponent({
    super.key,
  });

  @override
  State<ContainerResultViaCepComponent> createState() =>
      _ContainerResultViaCepComponentState();
}

class _ContainerResultViaCepComponentState
    extends State<ContainerResultViaCepComponent> {
  var cepBack4appModel = CepBack4appModel([]);
  final CepRepositoryImp cepRepositoryImp = CepRepositoryImp();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getInfo() async {
    cepBack4appModel = await cepRepositoryImp.getAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: cepBack4appModel.cepModel.length,
          itemBuilder: (context, index) {
            var cep = cepBack4appModel.cepModel[index];

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Rua: ${cep.rua ?? ""}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Bairro: ${cep.bairro ?? ""}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Cidade: ${cep.cidade ?? ""}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Estado: ${cep.estado ?? ""}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("CEP: ${cep.cep ?? ""}"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
