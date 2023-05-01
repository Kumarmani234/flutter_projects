
import 'package:flutter/material.dart';
import '../Authantication.dart';




class AddGuestForm extends StatefulWidget {
  final String title;
  const AddGuestForm({required this.title});

  @override

  _AddGuestFormState createState() => _AddGuestFormState();
}

class _AddGuestFormState extends State<AddGuestForm> {
  final _formKey=GlobalKey<FormState>();
  final _guest_nameController = TextEditingController();
  final _purpose_of_visitController = TextEditingController();
  final _addressController = TextEditingController();
  final _imageController=TextEditingController();
  var _dropdownValue ;
  bool _isLoading = false;

  Authentication authentication=Authentication();

  void _submit() async {

    setState(() {
      _isLoading = true;
    });


    final guestName = _guest_nameController.text;
    final purpose_of_visit  = _purpose_of_visitController.text;
    final address = _addressController.text;
    final image=_imageController.text;
    final assigned_to=_dropdownValue;
    if(_formKey.currentState!.validate()){}
    await Authentication().Addguest(guestName, purpose_of_visit,
      address,image,assigned_to);

    // if(response['status']=='success') {
    //
    //   setState(() {
    //     if(authentication==null) {
    //       Navigator.pushReplacement(context,
    //           MaterialPageRoute (builder: (context) =>
    //               MyHomePage(title: 'Home Page')));
    //     }
    //     else {
    //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //         content: Text(
    //           'Guest added successfully!',
    //           style: TextStyle(fontSize: 16),
    //         ),
    //       ));
    //       Navigator.pushReplacement(context,
    //           MaterialPageRoute(builder: (context) =>
    //               AdminForm(title:'Add Guest Page')));
    //     }
    //   });
    // }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _guest_nameController,
                decoration: InputDecoration(labelText: 'Guest Name',
                prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  // add your custom validation here.
                  if (value==null||value.isEmpty ) {
                    return 'Please enter guest name';
                  }
                  else if(value.length <4 ){
                    return 'Must be greater than 4 characters';
                  }else if(value.length >20){
                    return 'Must be less than 20 characters';
                  }
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _purpose_of_visitController,
                decoration: InputDecoration(labelText: 'Purpose_Of_Visit',
                    prefixIcon: Icon(Icons.event)
                ),
                validator: (value) {
                  // add your custom validation here.
                  if (value==null||value.isEmpty ) {
                    return 'Please enter purpose of visit';
                  }
                  else if(value.length <4 ){
                    return 'Must be greater than 4 characters';
                  }else if(value.length >20){
                    return 'Must be less than 20 characters';
                  }
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address',
                    prefixIcon: Icon(Icons.location_on),
                ),
                validator: (value) {
                  // add your custom validation here.
                  if (value==null||value.isEmpty ) {
                    return 'Please enter address';
                  }
                  else if(value.length <4 ){
                    return 'Must be greater than 4 characters';
                  }else if(value.length >50){
                    return 'Must be less than 50 characters';
                  }
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(labelText: 'Image',
                prefixIcon: Icon(Icons.image),
                ),
                validator: (value) {
                  // add your custom validation here.
                  if (value==null||value.isEmpty ) {
                    return 'Please enter image';
                  }
                  else if(value.length <4 ){
                    return 'Must be greater than 15 characters';
                  }else if(value.length >300){
                    return 'Must be less than 300 characters';
                  }
                },
              ),

              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _dropdownValue,
                onChanged: (newValue) {
                  setState(() {
                    _dropdownValue = newValue;
                  });
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: 'admin',
                    child: Text('admin'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'super_admin',
                    child: Text('super_admin'),
                  ),
                ],
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_2_outlined),
                  labelText: 'Assigned_To',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your role';
                  }
                  return null;
                },
              ),

              SizedBox(height: 40,),
              ElevatedButton(
                  child: Text('Submit'),
                onPressed: () {
                  _submit();
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}