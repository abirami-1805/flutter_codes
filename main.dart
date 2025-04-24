import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Care Manager',
      theme: ThemeData(primarySwatch : Colors.teal),
      home : const PetCareHomePage(),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Pet {
  final String name;
  final String genre;
  final String breed;
  final DateTime vaccinationDate;

  Pet(this.name, this.genre, this.breed, this.vaccinationDate);
}

class PetCareHomePage extends StatefulWidget {
  const PetCareHomePage({super.key});


  @override
  State<PetCareHomePage> createState() => _PetCareHomePageState();
}



class _PetCareHomePageState extends State<PetCareHomePage> {

  final List<Pet> pets = [];
  final nameController = TextEditingController();
  final genreController = TextEditingController();
  final breedController = TextEditingController();
  DateTime? selectedDate;

  void _addPet(){
    if (nameController.text.isEmpty
    || genreController.text.isEmpty
    || breedController.text.isEmpty
    || selectedDate == null) return;

    setState(() {
      pets.add(Pet(
        nameController.text,
        genreController.text,
        breedController.text,
        selectedDate!
      ));
    });

    nameController.clear();
    genreController.clear();
    breedController.clear();
    selectedDate = null;
  }

  void _pickDate() async{
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2100));

    if (picked != null){
      setState(() {
        selectedDate = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(title : Text("Pet Caretaking App")),
      body : SingleChildScrollView(
        child : Column(
          children : [
            TextField(
              controller : nameController,
              decoration: InputDecoration(label : Text("Pet Name")),
            ),
            TextField(
              controller : genreController,
              decoration : InputDecoration(label : Text("Pet genre")),
            ),
            TextField(
              controller : breedController,
              decoration : InputDecoration(label : Text("Pet breed")),
            ),
            SizedBox(height : 10),
            Row(
              children : [
                 Text(selectedDate == null ? "No date chosen 1" :
                 'Vaccination Date : ${selectedDate!.toLocal().toString().split(' ')[0]}'),
                SizedBox(width:10),
                ElevatedButton(onPressed: _pickDate, child: Text("Pick Date"))
              ]
            ),
            SizedBox(height:10),
            ElevatedButton(onPressed: _addPet, child: Text("Add Pet")),
            Divider(),
            Text("Pet List : ",style:TextStyle(fontSize:18)),
            Container(
              height : 300,
            child : pets.isEmpty ? Text("No pets added") :
            ListView.builder(
              itemCount : pets.length,
              itemBuilder: (context, index){
                final pet = pets[index];
                return Card(
                  child : ListTile(
                    title : Text('${pet.name} (${pet.genre})'),
                    subtitle: Text('Breed : ${pet.breed}\nVaccination : ${pet.vaccinationDate.toLocal().toString().split(' ')[0]}'),
                    trailing : IconButton(icon : Icon(Icons.alarm), onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reminder set for ${pet.name}")));
                    }, )
                  )
                );
              },
            )
            )
          ]
        ),
      )
    );
  }
}

