import 'package:expryy/CreateReminderPage.dart';
import 'package:expryy/MyReminderPage.dart';
import 'package:flutter/material.dart';
class buildButton extends StatelessWidget {
  bool isReminder;
  String innerText;
   buildButton({Key? key,required this.isReminder, required this.innerText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => isReminder ? const CreateReminder() : const MyReminders()));
      },
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: isReminder ? const Color(0xffB1B2FF) : const Color(0xffEEF1FF),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))
            )
        ),

        child: Text(innerText,style: TextStyle(color: isReminder ? Colors.black: const Color(0xff413F42), fontWeight: isReminder ? FontWeight.w500 : FontWeight.w300),),
      );

    }

}

