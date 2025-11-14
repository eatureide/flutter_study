import 'package:flutter/material.dart';
import 'app_localizations.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  // 1. shouldLoad：检查是否支持该语言
  @override
  bool isSupported(Locale locale) {
    // 假设我们只支持英文和中文
    return ['en', 'zh'].contains(locale.languageCode);
  }

  // 2. load：加载对应语言的本地化实例
  @override
  Future<AppLocalizations> load(Locale locale) {
    // 在实际项目中，这里通常是异步读取 JSON 或其他数据
    return Future.value(AppLocalizations(locale));
  }

  // 3. shouldReload：如果设置为 false，则不会在重建时重新加载
  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
