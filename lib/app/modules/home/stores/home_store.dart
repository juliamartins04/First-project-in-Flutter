import 'package:mobx/mobx.dart';
import 'package:my_first_project/app/modules/home/models/home_about_person.dart';
import '../_export_home_module.dart';
part 'home_store.g.dart';

class HomeStore = BaseHomeStore with _$HomeStore;

abstract class BaseHomeStore with Store {
  HomeServiceInterface homeServiceInterface = HomeService();

  @observable
  HomePeopleListModel? homePeopleListModel;

  @observable
  HomeAboutPerson? homeAboutPerson;

  @observable
  List<HomePeopleListModel?> homePeopleListModelObservable = ObservableList();

  List<HomePeopleListModel?> homePeopleListModelFiltered = ObservableList();

  @observable
  bool isPeopleLoading = false;

  @action
  Future<void> getPeople() async {
    isPeopleLoading = false;
    try {
      homePeopleListModelObservable = await homeServiceInterface.getPeople();
    } catch (error) {
      rethrow;
    } finally {
      isPeopleLoading = false;
    }
  }
}
