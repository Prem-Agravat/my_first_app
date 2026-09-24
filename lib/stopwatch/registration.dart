import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool Register = false;
  String name = '';
  String email = '';
  String pass = '';
  String cpass = '';
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _cpassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String gender = 'Male';
  bool is10th = false;
  bool is11th = false;
  bool is12th = false;
  bool isGraduate = false;

  String city = 'city 1';
  double value = 20000;

  DateTime? data;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _cpassController.dispose();
    super.dispose();
  }

  Future<void> pickData() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: data ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
    );
    if (!mounted || picked == null) return;
    setState(() => data = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration Page')),
      body: Center(child: Register ? _buildSuccess() : _buildRegisterForm()),
    );
  }

  Widget _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.check, color: Colors.green, size: 100),
        const SizedBox(height: 20),
        Text('Hi $name', style: const TextStyle(fontSize: 24)),
      ],
    );
  }

  Widget _buildRegisterForm() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Enter Name'),
                validator: (text) =>
                    text!.isEmpty ? 'Please enter your name' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Email address cannot be empty';
                  }
                  final regex = RegExp('[^@]+@[^.]+..+');
                  if (!regex.hasMatch(text)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'password cannot be empty';
                  }
                  pass = _passController.text;
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _cpassController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Confirm password cannot be empty';
                  }
                  if (pass != text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Text('Selected Gender: $gender'),
              RadioListTile<String>(
                title: const Text("Male"),
                value: "Male",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text("Female"),
                value: "Female",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              CheckboxListTile(
                title: const Text("10th"),
                value: is10th,
                onChanged: (v) => setState(() {
                  is10th = v!;
                }),
              ),
              CheckboxListTile(
                title: const Text("11th"),
                value: is11th,
                onChanged: (v) => setState(() {
                  is11th = v!;
                }),
              ),
              CheckboxListTile(
                title: const Text("12th"),
                value: is12th,
                onChanged: (v) => setState(() {
                  is12th = v!;
                }),
              ),
              CheckboxListTile(
                title: const Text("Graduate"),
                value: isGraduate,
                onChanged: (v) => setState(() {
                  isGraduate = v!;
                }),
              ),
              const SizedBox(height: 10),
              DropdownButton(
                value: city,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(value: 'city 1', child: Text("City 1")),
                  DropdownMenuItem(value: 'city 2', child: Text("City 2")),
                  DropdownMenuItem(value: 'city 3', child: Text("City 3")),
                  DropdownMenuItem(value: 'city 4', child: Text("City 4")),
                ],
                onChanged: (v) => setState(() {
                  city = v!;
                }),
              ),
              Text('Selected City: $city'),
              const SizedBox(height: 10),
              Slider(
                value: value,
                min: 20000,
                max: 100000,
                divisions: 30,
                onChanged: (double newValue) {
                  setState(() {
                    value = newValue;
                  });
                },
              ),
              Text('Fees: ${value.round()}'),
              const SizedBox(height: 15),
              Text(
                data == null
                    ? 'No Date'
                    : "DOB: ${data!.day}/${data!.month}/${data!.year}",
              ),
              ElevatedButton(
                onPressed: pickData,
                child: const Text("Pick DOB"),
              ),

              const SizedBox(height: 20),
              ElevatedButton(onPressed: _validate, child: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }

  void _validate() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      if (!is10th && !is11th && !is12th && !isGraduate) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select qualification')),
        );
        return;
      }
      if (data == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select Date of Birth')),
        );
        return;
      }
      setState(() {
        name = _nameController.text;
        email = _emailController.text;
        Register = true;
      });

      List<String> qList = [];
      if (is10th) qList.add('10th');
      if (is11th) qList.add('11th');
      if (is12th) qList.add('12th');
      if (isGraduate) qList.add('Graduate');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayInfo(
            name: name,
            email: email,
            gender: gender,
            qualification: qList.join(', '),
            city: city,
            height: value.round().toString(),
            dob: "${data!.day}/${data!.month}/${data!.year}",
          ),
        ),
      );
    }
  }
}

class DisplayInfo extends StatelessWidget {
  final String name;
  final String email;
  final String gender;
  final String qualification;
  final String city;
  final String height;
  final String dob;

  const DisplayInfo({
    super.key,
    required this.name,
    required this.email,
    required this.gender,
    required this.qualification,
    required this.city,
    required this.height,
    required this.dob,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Information')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name: $name', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text('Email: $email', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text('Gender: $gender', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text(
                  'Qualification: $qualification',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text('City: $city', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text('Fees: $height', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text('DOB: $dob', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
