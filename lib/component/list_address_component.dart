import 'package:cep_app/component/textFormField_component.dart';
import 'package:cep_app/controller/addressController.dart';
import 'package:cep_app/model/viacep_model.dart';
import 'package:cep_app/services/viaCep_service.dart';
import 'package:flutter/material.dart';

class ListAddressComponent extends StatefulWidget {
  const ListAddressComponent({super.key});

  @override
  State<ListAddressComponent> createState() => _ListAddressComponentState();
}

class _ListAddressComponentState extends State<ListAddressComponent> {
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
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<List<ViaCepModel>>(
        future: viaCepController.getAddress(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Text("Nenhum Cep");
          else {
            List<ViaCepModel>? list = snapshot.data;
            return ListView.builder(
              itemCount: list!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Card(
                    child: Column(
                      children: [
                        Text(list[index].logradouro!),
                        Text(list[index].bairro!),
                        Text(list[index].localidade!),
                        Text(list[index].uf!),
                        Text(list[index].cep!),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                viaCepController.updateAddress(list[index]);
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              TextFormFieldComponent(
                                                  controllerText:
                                                      list[index].logradouro!,
                                                  value:
                                                      list[index].logradouro!),
                                              SizedBox(height: 20),
                                              TextFormFieldComponent(
                                                  controllerText:
                                                      list[index].bairro!,
                                                  value: list[index].bairro!),
                                              const SizedBox(height: 20),
                                              TextFormFieldComponent(
                                                  controllerText:
                                                      list[index].localidade!,
                                                  value:
                                                      list[index].localidade!),
                                              const SizedBox(height: 20),
                                              TextFormFieldComponent(
                                                  controllerText:
                                                      list[index].uf!,
                                                  value: list[index].uf!),
                                              const SizedBox(height: 20),
                                              TextFormFieldComponent(
                                                  controllerText:
                                                      list[index].cep!,
                                                  value: list[index].cep!),
                                              ElevatedButton(
                                                onPressed: () {
                                                  viaCepController
                                                      .updateAddress(
                                                          list[index]);
                                                  setState(() {});
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Atualizar"),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.edit_note_outlined),
                              color: Colors.purple,
                            ),
                            IconButton(
                              onPressed: () {
                                viaCepController
                                    .deleteAddress(list[index].objectId!);
                                setState(() {});
                              },
                              icon: const Icon(Icons.delete_forever_rounded),
                              color: Colors.purple,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
