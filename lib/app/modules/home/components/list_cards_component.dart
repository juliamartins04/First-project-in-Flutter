import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../translations/locale_keys.g.dart';
import '../stores/_export_home_store.dart';

class ListCardsComponent extends StatefulWidget {
  late HomeStore homeStore;

  ListCardsComponent({
    super.key,
    required this.homeStore,
  });

  @override
  State<ListCardsComponent> createState() => _ListCardsComponentState();
}

class _ListCardsComponentState extends State<ListCardsComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 20.0,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        widget.homeStore.homePeopleListModelObservable
                            .elementAt(index)!
                            .avatar,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.homeStore.homePeopleListModelObservable
                                    .elementAt(index)!
                                    .name,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              Text(
                                widget.homeStore.homePeopleListModelObservable
                                    .elementAt(index)!
                                    .profession,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "Idade: ${widget.homeStore.homePeopleListModelObservable.elementAt(index)!.age}",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'ID: ${widget.homeStore.homePeopleListModelObservable.elementAt(index)!.id}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(LocaleKeys
                                    .screens_home_button_see_more
                                    .tr()),
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
      itemCount: widget.homeStore.homePeopleListModelObservable.length,
    );
  }

  void _initPage() {
    widget.homeStore = HomeStore();
    widget.homeStore.getPeople();
    widget.homeStore.homePeopleListModelObservable;
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
}
