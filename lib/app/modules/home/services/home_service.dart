import '../../core/_export_core.dart';
import '../interfaces/_export_interfaces.dart';
import '../models/_export_models.dart';
import '_export_services.dart';

class HomeService implements HomeServiceInterface {
  @override
  Future<List<HomePeopleListModel?>> getPeople() async {
    String url = "https://653bfbebd5d6790f5ec7b79a.mockapi.io/api/v1/people";
    try {
      final response = await Network.internal().get(
        url: url,
        headers: HomeModelHeader.getHomeModelHeader(),
      );
      print(response);
      return response
          .map<HomePeopleListModel>((home) => HomePeopleListModel.fromMap(home))
          .toList();
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
