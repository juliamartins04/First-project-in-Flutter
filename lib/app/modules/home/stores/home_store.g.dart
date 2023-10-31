// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on BaseHomeStore, Store {
  late final _$homePeopleListModelAtom =
      Atom(name: 'BaseHomeStore.homePeopleListModel', context: context);

  @override
  HomePeopleListModel? get homePeopleListModel {
    _$homePeopleListModelAtom.reportRead();
    return super.homePeopleListModel;
  }

  @override
  set homePeopleListModel(HomePeopleListModel? value) {
    _$homePeopleListModelAtom.reportWrite(value, super.homePeopleListModel, () {
      super.homePeopleListModel = value;
    });
  }

  late final _$homePeopleListModelObservableAtom = Atom(
      name: 'BaseHomeStore.homePeopleListModelObservable', context: context);

  @override
  List<HomePeopleListModel?> get homePeopleListModelObservable {
    _$homePeopleListModelObservableAtom.reportRead();
    return super.homePeopleListModelObservable;
  }

  @override
  set homePeopleListModelObservable(List<HomePeopleListModel?> value) {
    _$homePeopleListModelObservableAtom
        .reportWrite(value, super.homePeopleListModelObservable, () {
      super.homePeopleListModelObservable = value;
    });
  }

  late final _$isPeopleLoadingAtom =
      Atom(name: 'BaseHomeStore.isPeopleLoading', context: context);

  @override
  bool get isPeopleLoading {
    _$isPeopleLoadingAtom.reportRead();
    return super.isPeopleLoading;
  }

  @override
  set isPeopleLoading(bool value) {
    _$isPeopleLoadingAtom.reportWrite(value, super.isPeopleLoading, () {
      super.isPeopleLoading = value;
    });
  }

  late final _$getPeopleAsyncAction =
      AsyncAction('BaseHomeStore.getPeople', context: context);

  @override
  Future<void> getPeople() {
    return _$getPeopleAsyncAction.run(() => super.getPeople());
  }

  @override
  String toString() {
    return '''
homePeopleListModel: ${homePeopleListModel},
homePeopleListModelObservable: ${homePeopleListModelObservable},
isPeopleLoading: ${isPeopleLoading}
    ''';
  }
}
