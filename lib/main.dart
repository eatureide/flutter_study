import 'package:flutter/material.dart';
import 'home_page/index.dart';
import 'detail/index.dart';
import 'exchange/index.dart';
import 'material/index.dart';
import 'count/index.dart';
import 'state/index.dart';
import 'new_page.dart';
import 'stack/index.dart';
import 'req.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // 导入这个包

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  initState() {
    super.initState();
  }

  routerList(context) {


    onTap(String router) {
      Navigator.of(context).pushNamed(router);
    }

    return Scaffold(
      appBar: AppBar(title: Text('hello')),
      body: Center(
        child: Column(
          children: [
            Text('主页'),
            ElevatedButton(
              onPressed: () => onTap('/home'),
              child: Text('home'),
            ),
            Text('详情页'),
            ElevatedButton(
              onPressed: () => onTap('/detail'),
              child: Text('detail'),
            ),
            Text('兑换页'),
            ElevatedButton(
              onPressed: () => onTap('/exchange'),
              child: Text('exchange'),
            ),
            Text('商品瀑布流页'),
            ElevatedButton(
              onPressed: () => onTap('/material'),
              child: Text('material'),
            ),
            Text('测试路由返回值'),
            ElevatedButton(
              onPressed: () => onTap('/new_page'),
              child: Text('new_page'),
            ),
            Text('计数器'),
            ElevatedButton(
              onPressed: () => onTap('/count'),
              child: Text('count'),
            ),
            Text('状态'),
            ElevatedButton(
              onPressed: () => onTap('/state'),
              child: Text('state'),
            ),
            Text('堆叠布局'),
            ElevatedButton(
              onPressed: () => onTap('/stack_demo'),
              child: Text('stack_demo'),
            ),
            Text('请求示例'),
            ElevatedButton(onPressed: () => onTap('/req'), child: Text('req')),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp',
      initialRoute: '/',
      supportedLocales: [
        Locale('en', ''), // English
        Locale('zh', ''), // Chinese
      ],
      localizationsDelegates: const [
        // AppLocalizationsDelegate(),
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      routes: {
        '/': (context) => routerList(context),
        '/home': (context) => HomePage(),
        '/detail': (context) => Detail(),
        '/exchange': (context) => ExChange(),
        '/material': (context) => Index(),
        '/new_page': (context) => NewPage(),
        '/count': (context) => CountPage(),
        '/state': (context) => ParentWidgetC(),
        '/stack_demo': (context) => StackDemo(),
        '/req': (context) => Req(),
      },
    );
  }
}
