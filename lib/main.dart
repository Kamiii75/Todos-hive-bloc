import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todos_bloc_hive/screens/note_screen.dart';

import 'bloc/bloc/note_bloc.dart';
import 'database/note_database.dart';
import 'model/note_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>(NoteDatabase.boxName);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NoteBloc(NoteDatabase()),
      child: MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.blue,
          ),
          home: const NoteScreen()),
    );
  }
}
