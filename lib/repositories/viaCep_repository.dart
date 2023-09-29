import 'package:cep_app/model/viacep_model.dart';

abstract class ViaCepRepository {
  Future<ViaCepModel> getAddress(String cep);
}
