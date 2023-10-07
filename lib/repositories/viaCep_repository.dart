import 'package:cep_app/model/viacep_model.dart';

abstract class ViaCepRepository {
  Future<List<ViaCepModel>> getAddress();
  Future<ViaCepModel> cepConsult(String cep);
  Future<void> createAddress(ViaCepModel viaCepModel);
  Future<void> deleteAddress(String id);
  Future<ViaCepModel> updateAddress(ViaCepModel viaCepModel);
}
