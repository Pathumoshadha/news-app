import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/search_bloc.dart';
import 'services/services.dart';
import 'screen/home screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBloc(NewsApi()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NewsHomeScreen(),
      ),
    );
  }
}
