import '../../core/_export_core.dart';
import '../interfaces/_export_interfaces.dart';
import '../models/_export_models.dart';
import '_export_services.dart';

class HomeService implements HomeServiceInterface {
  @override
  Future<List<HomePeopleListModel?>> getPeople() async {
    String url = AppConstant.homeURL;
    try {
      final response = await Network.internal().get(
        url: url,
        headers: HomeModelHeader.getHomeModelHeader(),
      );
      return response
          .map<HomePeopleListModel>((home) => HomePeopleListModel.fromMap(home))
          .toList();
    } catch (error) {
      rethrow;
    }
  }
}
