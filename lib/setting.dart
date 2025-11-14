import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';

class SettingPage extends StatelessWidget {
  final Function(Locale value) onChangeLanguage;
  const SettingPage({super.key, required this.onChangeLanguage});

  setLanguage(Locale value, BuildContext context) {
    onChangeLanguage(value);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingTitle)),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('语言', style: TextStyle(fontSize: 20)),
              ElevatedButton(
                onPressed: () {
                  setLanguage(Locale('zh', ''), context);
                },
                child: Text('简体中文'),
              ),
              ElevatedButton(
                onPressed: () {
                  setLanguage(Locale('en', ''), context);
                },
                child: Text('English'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
