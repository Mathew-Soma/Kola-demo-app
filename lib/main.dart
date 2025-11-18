import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kolademo/BLOC/bloc/kola_bloc.dart';
import 'package:kolademo/data/repository.dart';
import 'package:kolademo/data/services.dart';
import 'package:kolademo/views/view_one.dart';

void main() {
  final mobileService = MobileService(); // create service
  final mobileRepository = MobileRepository(service: mobileService); // inject service into repository

  runApp(
    BlocProvider(
      create: (_) => KolaBloc(repository: mobileRepository), // inject repository into bloc
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        inputDecorationTheme: const InputDecorationTheme(
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          fillColor: Color(0xFFF0F0F0),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: const ViewOne(),
    );
  }
}
