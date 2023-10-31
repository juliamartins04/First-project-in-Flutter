import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_first_project/app/modules/home/_export_home_module.dart';
import 'package:my_first_project/app/modules/home/components/_export_components.dart';
import 'package:my_first_project/translations/locale_keys.g.dart';
import '../stores/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeStore _homeStore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(
        builder: (context) {
          return SafeArea(
            child: _homeStore.isPeopleLoading
                ? CircularProgressComponent(
                    label: LocaleKeys.screens_home_await_loading.tr())
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 20.0,
                            ),
                            itemBuilder: (context, index) {
                              HomePeopleListModel? homePeopleListModel =
                                  _homeStore.homePeopleListModelObservable
                                      .elementAt(index);
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                              _homeStore
                                                  .homePeopleListModelObservable
                                                  .elementAt(index)!
                                                  .avatar,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          homePeopleListModel!
                                                              .name,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.blue,
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 8.0,
                                                          height: 8.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: _homeStore
                                                                    .homePeopleListModelObservable
                                                                    .elementAt(
                                                                        index)!
                                                                    .isOnline
                                                                ? Colors.green
                                                                : Colors.red,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      homePeopleListModel
                                                          .profession,
                                                      style: const TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${LocaleKeys.screens_home_cards_age.tr()}: ${homePeopleListModel.age}",
                                                      style: const TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${LocaleKeys.screens_home_cards_id.tr()}: ${homePeopleListModel.id}',
                                                      style: const TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () async {
                                                        _clickSeeMore(
                                                            index: index);
                                                      },
                                                      child: Text(
                                                        LocaleKeys
                                                            .screens_home_button_see_more
                                                            .tr(),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount:
                                _homeStore.homePeopleListModelObservable.length,
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }

  void _initPage() {
    _homeStore = HomeStore();
    _homeStore.getPeople();
  }

  @override
  void initState() {
    super.initState();
    _initPage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _pushAboutPage({required int index}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AboutPage(id: index),
      ),
    );
  }

  void _showAlertDialog({
    required BuildContext context,
    required int index,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(LocaleKeys.screens_home_dialog_attention.tr()),
          content:
              Text(LocaleKeys.screens_home_dialog_are_you_sure_about_that.tr()),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(LocaleKeys.screens_home_dialog_close.tr()),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pushAboutPage(index: index);
              },
              child: Text(LocaleKeys.screens_home_dialog_yes.tr()),
            ),
          ],
        );
      },
    );
  }

  bool _isOnline({required int index}) =>
      _homeStore.homePeopleListModelObservable.elementAt(index)!.isOnline;

  void _clickSeeMore({required int index}) {
    if (_isOnline(index: index)) {
      _pushAboutPage(index: index);
    } else {
      _showAlertDialog(
        context: context,
        index: index,
      );
    }
  }
}
