import 'package:dio/dio.dart';
import 'home_repository_interface.dart';

//ignore: public_member_api_docs
class HomeRepository implements IHomeRepositoryInterface {
  //ignore: public_member_api_docs
  final Dio client;
  //ignore: public_member_api_docs
  HomeRepository(this.client);

  @override
  Future<List<String>> fetchStateCities(String idIbgeState) async {
    final response = await client.get(
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$idIbgeState/municipios');
    return (response.data as List)
        .map((city) => ((city as Map)['nome']) as String)
        .toList();
  }
}
