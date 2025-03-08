import 'package:flutter/material.dart';

import 'package:flutter_portfolio/app.dart';
import 'package:flutter_portfolio/bloc/theme_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}
