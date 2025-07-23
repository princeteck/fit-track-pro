import 'package:injectable/injectable.dart';

import 'prelude/prelude.dart';

@module
abstract class Services {
  @singleton
  NavigationService get navigationService => NavigationService();
}
