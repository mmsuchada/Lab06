import 'package:flutter/material.dart';
import 'package:lab6_checkboxlisttile/hobby.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key, required String title});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Hobby> hobbies = [];

  List selectedItems = [];
  
  get name => null;

  @override
  void initState() {
    super.initState();
    hobbies = Hobby.getHobby();
    print(hobbies);
  }

  List<Widget> createHobbyCheckbox(){
    List<Widget> mywidget = [];

    for (var hb in hobbies) {
      mywidget.add(
        CheckboxListTile(
          title: Text(hb.name),
          value: hb.checked, 
          onChanged: (value){

            setState(() {
              hb.checked = value!;
              
              if (value == true) {
                selectedItems.add(hb.name);
              }
              else {
                selectedItems.remove(hb.name);
              }
          
            });
          },
          
          ),
      );
    }

    return mywidget;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    


      appBar: AppBar(
        title: Text("Lab6 CheckBoxListTile"),
      ),
      body: Column(
        children: [
          Text("งานอดิเรก"),
          //ใส่ checkbox
          Column(
            children: createHobbyCheckbox(),
          ),
          Text(selectedItems.toString()),
        ],
      ),
    );
  }
}