import 'package:flutter/material.dart';
import 'package:qpay/src/config/constants.dart';
import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  String _selectedCurrency = 'USD';
  bool _biometricEnabled = false;
  String _backupFrequency = 'Weekly';

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  final List<String> _currencies = ['USD', 'EUR', 'GBP', 'JPY', 'INR'];
  final List<String> _backupOptions = ['Daily', 'Weekly', 'Monthly', 'Never'];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: tertiaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn(duration: 600.ms).slideX(),
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: tertiaryColor),
      ),
      body: Column(
        children: [
          Expanded(
            child: ImplicitlyAnimatedList<Widget>(
              controller: _scrollController,
              items: _buildListItems,
              areItemsTheSame: (oldItem, newItem) => oldItem.key == newItem.key,
              itemBuilder: (context, animation, item, index) {
                return SlideTransition(
                  position: animation.drive(
                    Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ),
                  ),
                  child: FadeTransition(
                    opacity: animation,
                    child: item,
                  ),
                );
              },
              spawnIsolate: true,
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  List<Widget> get _buildListItems {
    return [
      _buildSection(
        'General Settings',
        [
          _buildAnimatedTile(
            'Currency',
            'Select your preferred currency',
            trailing: _buildCurrencyDropdown(),
          ),
        ],
      ),
      _buildSection(
        'Notifications',
        [
          _buildAnimatedSwitch(
            'Enable Notifications',
            'Receive alerts for budget limits and reminders',
            _notificationsEnabled,
            (value) => setState(() => _notificationsEnabled = value),
          ),
        ],
      ),
      _buildSection(
        'Appearance',
        [
          _buildAnimatedSwitch(
            'Dark Mode',
            'Enable dark theme',
            _darkModeEnabled,
            (value) => setState(() => _darkModeEnabled = value),
          ),
        ],
      ),
      _buildSection(
        'Security',
        [
          _buildAnimatedSwitch(
            'Biometric Authentication',
            'Use fingerprint or face ID to login',
            _biometricEnabled,
            (value) => setState(() => _biometricEnabled = value),
          ),
        ],
      ),
      _buildSection(
        'Backup & Sync',
        [
          _buildAnimatedTile(
            'Backup Frequency',
            'How often to backup your data',
            trailing: _buildBackupDropdown(),
          ),
        ],
      ),
      _buildSection(
        'About',
        [
          _buildAnimatedTile('Version', '1.0.0'),
          _buildAnimatedTile(
            'Terms of Service',
            'Tap to view terms',
            onTap: () {
              // Navigate to Terms of Service
            },
          ),
          _buildAnimatedTile(
            'Privacy Policy',
            'Tap to view policy',
            onTap: () {
              // Navigate to Privacy Policy
            },
          ),
        ],
      ),
      _buildSection(
        'Danger Zone',
        [
          _buildAnimatedTile(
            'Clear All Data',
            'Warning: This action cannot be undone',
            trailing: const Icon(Icons.warning, color: Colors.red),
            onTap: () => _showClearDataDialog(),
          ),
        ],
        headerColor: Colors.red,
      ),
    ];
  }

  Widget _buildSection(String title, List<Widget> children,
      {Color? headerColor}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(title, color: headerColor),
          ...children,
          _buildDivider(),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.2, end: 0);
  }

  Widget _buildSectionHeader(String title, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          color: color ?? secondaryColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAnimatedTile(String title, String subtitle,
      {Widget? trailing, VoidCallback? onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: secondaryColor.withOpacity(0.1)),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: tertiaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: tertiaryColor.withOpacity(0.7)),
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    ).animate().scale(delay: 200.ms).fadeIn();
  }

  Widget _buildAnimatedSwitch(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: secondaryColor.withOpacity(0.1)),
      ),
      child: SwitchListTile(
        title: Text(
          title,
          style: TextStyle(
            color: tertiaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: tertiaryColor.withOpacity(0.7)),
        ),
        value: value,
        onChanged: onChanged,
        activeColor: secondaryColor,
        inactiveTrackColor: tertiaryColor.withOpacity(0.3),
      ),
    ).animate().scale(delay: 200.ms).fadeIn();
  }

  Widget _buildCurrencyDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: _selectedCurrency,
        dropdownColor: primaryColor,
        style: TextStyle(color: tertiaryColor),
        icon: Icon(Icons.arrow_drop_down, color: secondaryColor),
        underline: const SizedBox(),
        onChanged: (String? newValue) {
          setState(() => _selectedCurrency = newValue!);
        },
        items: _currencies.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBackupDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: _backupFrequency,
        dropdownColor: primaryColor,
        style: TextStyle(color: tertiaryColor),
        icon: Icon(Icons.arrow_drop_down, color: secondaryColor),
        underline: const SizedBox(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() => _selectedCurrency = newValue);
          }
        },
        items: _backupOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(color: tertiaryColor.withOpacity(0.2));
  }

  void _showClearDataDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: secondaryColor.withOpacity(0.1)),
          ),
          title: Text(
            'Clear All Data',
            style: TextStyle(color: tertiaryColor),
          ),
          content: Text(
            'Are you sure you want to clear all your data? This action cannot be undone.',
            style: TextStyle(color: tertiaryColor.withOpacity(0.7)),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: secondaryColor),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text(
                'Clear',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                // Implement clear data functionality
                Navigator.of(context).pop();
              },
            ),
          ],
        ).animate().scale().fadeIn();
      },
    );
  }
}
