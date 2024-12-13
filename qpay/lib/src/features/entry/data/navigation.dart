import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/src/features/entry/model/navigation_item.dart';
import 'package:qpay/src/features/home/screen/home_screen.dart';
import 'package:qpay/src/features/qr_scanner/screen/qr_screen.dart';
import 'package:qpay/src/features/settings/settings_screen.dart';
import 'package:qpay/src/features/statistics/screen/statistics_screen.dart';
import 'package:qpay/src/features/transactions/screen/transactions_screen.dart';

List<NavigationItem> navigationItems = [
  const NavigationItem(
    inactiveIcon: FontAwesomeIcons.house,
    activeIcon: FontAwesomeIcons.houseChimney,
    page: HomeScreen(),
  ),
  const NavigationItem(
    inactiveIcon: FontAwesomeIcons.squarePollHorizontal,
    activeIcon: FontAwesomeIcons.squarePollHorizontal,
    page: TransactionsScreen(),
  ),
  const NavigationItem(
    inactiveIcon: FontAwesomeIcons.qrcode,
    activeIcon: FontAwesomeIcons.qrcode,
    page: QrScreen(),
  ),
  const NavigationItem(
    inactiveIcon: FontAwesomeIcons.squarePollVertical,
    activeIcon: FontAwesomeIcons.squarePollVertical,
    page: StatisticsScreen(),
  ),
  NavigationItem(
    inactiveIcon: FontAwesomeIcons.gear,
    activeIcon: FontAwesomeIcons.gear,
    page: SettingsScreen(),
  ),
];
