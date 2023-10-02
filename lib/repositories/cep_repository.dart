import 'package:cep_app/model/cep_back4app_model.dart';

abstract class CepRepository {
  Future<CepBack4appModel> getAddress();
}
