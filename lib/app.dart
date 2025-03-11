import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_portfolio/bloc/logic.dart';
import 'package:flutter_portfolio/utils/router/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PortfolioLogic(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'GrullonDev Portfolio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
      ),
    );
  }
}
