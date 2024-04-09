import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textController = TextEditingController();
  final _apartmentController = TextEditingController();
  final _noOfVehiclesOwned = TextEditingController();
  final _noOfSlotsAvailable = TextEditingController();
  List<TextEditingController> _vehicleNoControllers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "User Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Icon(Icons.home),
        actions: [Icon(Icons.search), Icon(Icons.more_vert)],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Your Name",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _apartmentController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Apartment Number",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _noOfVehiclesOwned,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "No of Vehicles",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _noOfSlotsAvailable,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "No of Parking Slots available",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _vehicleNoControllers.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _vehicleNoControllers[index],
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter Vehicle No",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            _vehicleNoControllers.removeAt(index);
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
            TextButton(
  onPressed: () {
    setState(() {
      _vehicleNoControllers.add(TextEditingController());
    });
  },
  style: TextButton.styleFrom(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    textStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.blue, // Setting text color to blue
    ),
  ),
  child: Text("Add Vehicle Number"),
),

              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  int noOfVehicles = int.parse(_noOfVehiclesOwned.text);
                  int noOfSlots = int.parse(_noOfSlotsAvailable.text);
                  print("Name: ${_textController.text}");
                  print("Apartment No: ${_apartmentController.text}");
                  print("No Of Vehicles: $noOfVehicles");
                  print("No Of Parking Slots Available: $noOfSlots");
                  _vehicleNoControllers.forEach((controller) {
                    print("Vehicle No: ${controller.text}");
                  });

                  _textController.clear();
                  _apartmentController.clear();
                  _noOfVehiclesOwned.clear();
                  _noOfSlotsAvailable.clear();
                  _vehicleNoControllers.forEach((controller) {
                    controller.clear();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text("SUBMIT"),
              ),
              SizedBox(
                height: 20,
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
