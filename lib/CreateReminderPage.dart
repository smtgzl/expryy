import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';


class CreateReminder extends StatefulWidget {
  const CreateReminder({Key? key}) : super(key: key);

  @override
  State<CreateReminder> createState() => _CreateReminderState();
}

class _CreateReminderState extends State<CreateReminder> {
  TextEditingController platformNameController = TextEditingController();
   TextEditingController dateinput = TextEditingController(); 
  int _currentHorizontalIntValue = 10;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
    
  @override
  void initState() {
    dateinput.text = ""; 
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }
    
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body:  SafeArea(child: 
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const SizedBox(height: 30,),
          const Text("Platform",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          const SizedBox(height: 25,),
           TextFormField(
            controller: platformNameController,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: 'Netflix',
              hintStyle: const TextStyle(color: Color(0xFF8F9098),fontWeight: FontWeight.normal,fontSize: 14),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),),
              ),
              const SizedBox(height: 25,),
              TextField(
                controller: dateinput,
                decoration: const InputDecoration( 
                   icon: Icon(Icons.calendar_today), 
                   labelText: "Deneme Başlangıcı" 
                ),
                readOnly: true,  
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2000), 
                      lastDate: DateTime(2101)
                  );
                  
                  if(pickedDate != null ){
                      print(pickedDate);  
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                      print(formattedDate); 
                        

                      setState(() {
                         dateinput.text = formattedDate; 
                      });
                  }else{
                      print("Date is not selected");
                  }
                },
             ),
             const SizedBox(height: 25,),
          const Text("Deneme Süresi",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          const SizedBox(height: 25,),
          NumberPicker(
              value: _currentHorizontalIntValue,
              minValue: 0,
              maxValue: 60,
              step: 1,
              itemHeight: 100,
              axis: Axis.horizontal,
              onChanged: (value) =>
                setState(() => _currentHorizontalIntValue = value),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black26),
          ),
        ),
        const SizedBox(height: 25,),
        const Text("Hatırlatma Süreleri",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states){
        if (states.contains(MaterialState.disabled)){
          return Colors.orange.withOpacity(.32);
        }
        return Colors.blue;
      }) ,
      value: isChecked1,
      onChanged: (bool? value) {
                setState(() {
                  isChecked1 = value!;
                });
      },
    ),
    const Text("1 gün önce"),
              ],
            ),
    const SizedBox(width: 10,),
    
    Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states){
        if (states.contains(MaterialState.disabled)){
          return Colors.orange.withOpacity(.32);
        }
        return Colors.blue;
      }) ,
          value: isChecked2,
          onChanged: (bool? value) {
                setState(() {
                  isChecked2 = value!;
                });
          },
        ),
        const Text("3 gün önce"),
      ],
    ),
    

          ],
        ),
        const SizedBox(height: 25,),
        const Text("Hatırlatma Yöntemleri",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states){
        if (states.contains(MaterialState.disabled)){
          return Colors.orange.withOpacity(.32);
        }
        return Colors.blue;
      }) ,
      value: isChecked3,
      onChanged: (bool? value) {
                setState(() {
                  isChecked3 = value!;
                });
      },
    ),
    const Text("Mail"),
              ],
            ),
    const SizedBox(width: 10,),
    
    Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states){
        if (states.contains(MaterialState.disabled)){
          return Colors.orange.withOpacity(.32);
        }
        return Colors.blue;
      }) ,
          value: isChecked4,
          onChanged: (bool? value) {
                setState(() {
                  isChecked4 = value!;
                });
          },
        ),
        const Text("SMS"),
      ],
    ),
    const SizedBox(width: 10,),
    
    Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states){
        if (states.contains(MaterialState.disabled)){
          return Colors.orange.withOpacity(.32);
        }
        return Colors.blue;
      }) ,
          value: isChecked5,
          onChanged: (bool? value) {
                setState(() {
                  isChecked5 = value!;
                });
          },
        ),
        const Text("Bildirim"),
      ],
    ),
    

          ],
        ),
        const SizedBox(height: 25,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))
            )
          ),
          onPressed: (){}, 
          child: const Text("Hatırlatıcıyı Kur")),
          const SizedBox(height: 20,),
          Center(
            child: GestureDetector(
              child: const Text("İptal"),
              onTap: (){
                Navigator.pop(context);

              },
              ))
  




              
           
            




        ],),
      )),
    );
  }
}


  