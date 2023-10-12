import 'package:cep_app/component/textFormField_component.dart';
import 'package:cep_app/controller/addressController.dart';
import 'package:cep_app/model/viacep_model.dart';
import 'package:flutter/material.dart';

class ListAddressComponent extends StatefulWidget {
  const ListAddressComponent({super.key});

  @override
  State<ListAddressComponent> createState() => _ListAddressComponentState();
}

class _ListAddressComponentState extends State<ListAddressComponent> {
  var cep = "";
  bool loading = false;
  ViaCepModel viacepModel = ViaCepModel();
  var viaCepController = AddressController();
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
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
                  var cepUsed = list[index];
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
                                      var cepController = TextEditingController(
                                          text: cepUsed.cep);
                                      var ruaController = TextEditingController(
                                          text: cepUsed.logradouro);
                                      var bairroControlelr =
                                          TextEditingController(
                                              text: cepUsed.bairro);
                                      var cidadeController =
                                          TextEditingController(
                                              text: cepUsed.localidade);
                                      var estadoController =
                                          TextEditingController(
                                              text: cepUsed.uf);
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Column(
                                                children: [
                                                  TextFormField(
                                                    controller:
                                                        TextEditingController(
                                                      text: list[index]
                                                          .logradouro,
                                                    ),
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      labelText: 'Rua',
                                                    ),
                                                    onChanged: (value) {
                                                      list[index].logradouro =
                                                          value;
                                                    },
                                                  ),
                                                  SizedBox(height: 20),
                                                  TextFormField(
                                                    controller:
                                                        TextEditingController(
                                                      text: list[index].bairro,
                                                    ),
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      labelText: 'Bairro',
                                                    ),
                                                    onChanged: (value) {
                                                      list[index].bairro =
                                                          value;
                                                    },
                                                  ),
                                                  SizedBox(height: 20),
                                                  TextFormField(
                                                    controller:
                                                        TextEditingController(
                                                      text: list[index]
                                                          .localidade,
                                                    ),
                                                    decoration: InputDecoration(
                                                        labelText: 'Cidade',
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20))),
                                                    onChanged: (value) {
                                                      list[index].localidade =
                                                          value;
                                                    },
                                                  ),
                                                  SizedBox(height: 20),
                                                  TextFormField(
                                                    controller:
                                                        TextEditingController(
                                                      text: list[index].uf,
                                                    ),
                                                    decoration: InputDecoration(
                                                        labelText: 'Estado',
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20))),
                                                    onChanged: (value) {
                                                      list[index].uf = value;
                                                    },
                                                  ),
                                                  SizedBox(height: 20),
                                                  TextFormField(
                                                    controller:
                                                        TextEditingController(
                                                      text: list[index].cep,
                                                    ),
                                                    decoration: InputDecoration(
                                                        labelText: 'CEP',
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20))),
                                                    onChanged: (value) {
                                                      list[index].cep = value;
                                                    },
                                                  ),
                                                  SizedBox(height: 20),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: ElevatedButton(
                                                          style: const ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStatePropertyAll(
                                                                      Colors
                                                                          .amber)),
                                                          onPressed: () {
                                                            viaCepController
                                                                .updateAddress(
                                                                    list[
                                                                        index]);
                                                            setState(() {});
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child:
                                                              Text("Editar")),
                                                    ),
                                                  )
                                                ],
                                              ),
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
      ),
    );
  }
}
