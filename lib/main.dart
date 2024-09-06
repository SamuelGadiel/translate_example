import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController textEditingController = TextEditingController();

  final GoogleTranslator translator = GoogleTranslator();

  String toTranslate = "A can can jump up to 3 meters when he's felling angry";
  String text = '';

  @override
  void initState() {
    translate();
    super.initState();
  }

  translate() async {
    setState(() async {
      text = (await translator.translate(toTranslate, from: 'en', to: 'pt')).text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Google Translate")),
      body: Center(
        child: Text(text),
      ),
    );
  }
}
