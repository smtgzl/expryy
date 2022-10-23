import 'package:expryy/CreateReminderPage.dart';
import 'package:expryy/MyReminderPage.dart';
import 'package:flutter/material.dart';
import 'package:expryy/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {




    @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SafeArea(
          child: Center(

            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton(isReminder: true, innerText: 'Create Reminder'),
                  const SizedBox(height: 15,),
                  buildButton(isReminder: false, innerText: 'My Reminders')
                ],
              ),
            ),
          )),
    );
  }
}

