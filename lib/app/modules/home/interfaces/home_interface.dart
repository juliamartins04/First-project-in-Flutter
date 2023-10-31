import '../models/_export_models.dart';

abstract interface class HomeServiceInterface {
  Future<List<HomePeopleListModel?>> getPeople();
}
