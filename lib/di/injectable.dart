import 'package:injectable/injectable.dart';
import 'package:masiro/di/get_it.dart';
import 'package:masiro/di/injectable.config.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();
