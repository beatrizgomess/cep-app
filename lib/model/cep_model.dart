class CepModel {
  String? objectId;
  String? createdAt;
  String? updatedAt;
  String? cep;
  String? rua;
  String? bairro;
  String? estado;
  String? cidade;

  CepModel(
      {this.objectId,
      this.createdAt,
      this.updatedAt,
      this.cep,
      this.rua,
      this.bairro,
      this.estado,
      this.cidade});

  CepModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    cep = json['cep'];
    rua = json['rua'];
    bairro = json['bairro'];
    estado = json['estado'];
    cidade = json['cidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['cep'] = this.cep;
    data['rua'] = this.rua;
    data['bairro'] = this.bairro;
    data['estado'] = this.estado;
    data['cidade'] = this.cidade;
    return data;
  }
}
