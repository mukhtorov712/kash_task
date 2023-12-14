import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/core/locator.dart';
import 'package:task/src/features/home/presentation/manager/home_bloc.dart';
import 'package:task/src/features/home/presentation/pages/home_screen.dart';

void main() {
  initializeDependencies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<HomeBloc>(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
