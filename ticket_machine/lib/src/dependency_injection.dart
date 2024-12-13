import 'package:get_it/get_it.dart';
import 'package:ticket_machine/src/controller/theme_controller.dart';
import 'package:ticket_machine/src/core/service/theme_services.dart';

class DependencyInjection {
  static final GetIt getIt = GetIt.instance;

  static void init() {
    getIt.registerSingleton<SettingsController>(
        SettingsController(SettingService()));
    getIt<SettingsController>().loadSettings();
  }
}
