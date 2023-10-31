import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_first_project/app/modules/home/components/_export_components.dart';
import 'package:my_first_project/app/modules/home/utils/_export_utils.dart';
import '../../../../translations/locale_keys.g.dart';
import '../stores/home_store.dart';

class AboutPage extends StatefulWidget {
  final int id;
  const AboutPage({
    super.key,
    required this.id,
  });

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late HomeStore _homeStore;

  Widget _cardDetailPerson() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 15.0,
            bottom: 20.0,
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              _homeStore.homePeopleListModelObservable
                  .elementAt(widget.id)!
                  .avatar,
            ),
          ),
        ),
        Text(
          _isOnline()
              ? LocaleKeys.screens_details_available.tr()
              : LocaleKeys.screens_details_unavailable.tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: HomeUtil.isOnlineColor(isOnline: _isOnline()),
          ),
        ),
        Text(
          "${_homeStore.homePeopleListModelObservable.elementAt(widget.id)!.about!.description}",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.screens_details_details.tr()),
      ),
      body: Observer(
        builder: (context) {
          return _homeStore.homePeopleListModelObservable.isEmpty
              ? CircularProgressComponent(
                  label: LocaleKeys.screens_home_await_loading.tr(),
                )
              : _homeStore.homePeopleListModelObservable
                          .elementAt(widget.id)!
                          .about ==
                      null
                  ? const NotFoundDetailsComponent()
                  : _cardDetailPerson();
        },
      ),
    );
  }

  void _initPage() async {
    _homeStore = HomeStore();
    await _homeStore.getPeople();
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

  bool _isOnline() =>
      _homeStore.homePeopleListModelObservable.elementAt(widget.id)!.isOnline;
}
