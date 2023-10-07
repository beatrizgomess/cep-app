import 'package:cep_app/controller/addressController.dart';
import 'package:cep_app/model/viacep_model.dart';
import 'package:flutter/material.dart';

class ContainerResultViaCepComponent extends StatefulWidget {
  ContainerResultViaCepComponent({
    super.key,
    required this.viacepModel,
  });
  var viacepModel = ViaCepModel();
  @override
  State<ContainerResultViaCepComponent> createState() =>
      _ContainerResultViaCepComponentState();
}

class _ContainerResultViaCepComponentState
    extends State<ContainerResultViaCepComponent> {
  var viaCepController = AddressController();
  String _snackbarMessage = '';

  @override
  void initState() {
    viaCepController.getAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Rua: ${widget.viacepModel.logradouro ?? ""}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Bairro: ${widget.viacepModel.bairro ?? ""}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Cidade: ${widget.viacepModel.localidade ?? ""}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Estado: ${widget.viacepModel.uf ?? ""}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("CEP: ${widget.viacepModel.cep ?? ""}"),
            ),
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    await viaCepController.createAddress(widget.viacepModel);
                    print("Deu certo");
                    print(viaCepController.ceps.length);
                  },
                  icon: Icon(Icons.add_box_rounded),
                  color: Colors.purple,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
