import 'package:flutter/material.dart';


const List<String> list = <String>['Serra Gaucha', 'Bento Gonçalves', 'Joinville', 'Balneario Camboriu'];

class DropdownButtonCities extends StatefulWidget {
  const DropdownButtonCities({super.key});

  @override
  State<DropdownButtonCities> createState() => _DropdownButtonCitiesState();
}

class _DropdownButtonCitiesState extends State<DropdownButtonCities> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(
              color: Colors.black, 
              fontWeight: FontWeight.bold, 
              fontSize: 20),
      underline: Container(
        height: 2,
        color: Colors.black,               
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.        
        print(value);
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}