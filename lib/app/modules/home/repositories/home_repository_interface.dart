//ignore: public_member_api_docs, one_member_abstracts
abstract class IHomeRepositoryInterface {
  /// Searches all cities in a Brazilian state
  /// based on the ibge id [idIbgeState].
  Future<List<String>> fetchStateCities(String idIbgeState);
}
