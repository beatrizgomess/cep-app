import 'package:cep_app/model/cep_model.dart';

class CepBack4appModel {
  List<CepModel> cepModel = [];

  CepBack4appModel(this.cepModel);

  CepBack4appModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      cepModel = <CepModel>[];
      json['results'].forEach((v) {
        cepModel.add(CepModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = cepModel.map((v) => v.toJson()).toList();
    return data;
  }
}
