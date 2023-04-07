import 'package:aw_pilot_helper/l10n/output/app_localizations.dart';
import 'package:flutter/widgets.dart';

export 'output/app_localizations.dart';

extension BuildContextL10nExtension on BuildContext {
  L10n get l10n => L10n.of(this);
}
