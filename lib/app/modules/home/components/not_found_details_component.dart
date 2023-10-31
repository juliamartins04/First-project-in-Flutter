import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../translations/locale_keys.g.dart';

class NotFoundDetailsComponent extends StatelessWidget {
  const NotFoundDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        LocaleKeys.screens_details_not_found_details.tr(),
      ),
    );
  }
}
