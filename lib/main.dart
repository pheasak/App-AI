import 'package:chatai/view/screen/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());

  // final model = GenerativeModel(
  //     model: 'gemini-1.5-flash',
  //     apiKey: "AIzaSyATUqiQXGSPDVGIFbYx95gQTw7sREz-Jx4");
  // final content = [Content.text('Write a story about a magic backpack.')];
  // final response = await model.generateContent(content);
  // print("RESPONSE TEXT:  ${response.text}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
