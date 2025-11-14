import 'package:flutter/material.dart';

class AppLocalizations {
  // 1. 构造函数：私有构造，根据语言代码加载对应字符串
  const AppLocalizations(this.locale);

  final Locale locale;

  // 2. 静态方法：通过 context 获取 AppLocalizations 实例
  static AppLocalizations? of(BuildContext context) {
    // 使用非空断言 ! 告诉编译器，如果配置正确，AppLocalizations 一定存在
    // 否则，会抛出运行时错误，这在 Localizations 中是常见的做法。
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // 3. 实际的本地化字符串（示例）
  String get title {
    if (locale.languageCode == 'zh') {
      return '路由列表';
    }
    return 'routerList';
  }

  String get greeting {
    if (locale.languageCode == 'zh') {
      return '欢迎使用本地化应用！';
    }
    return 'Welcome to the localized App!';
  }
}
