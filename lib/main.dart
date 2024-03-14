import 'package:flutter/material.dart';
import 'package:kids_math_homework/body.dart';
import 'package:kids_math_homework/controller.dart';
import 'package:provider/provider.dart';

typedef iLs = List<int>;
// typedef ilLs = List<List<int>>;

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
      create:(context)=> MyProvider(),
      child:  MaterialApp(
          theme: ThemeData(
            useMaterial3: false,
            textTheme: const TextTheme(bodyMedium: TextStyle(fontFamily: 'pyidaungsu_bold'))),
          title: 'Material App',
          home: const MyHome(),
        )
  
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Math Game Lesson-1'),
      ),
      body: const Body(),
    );
  }
}