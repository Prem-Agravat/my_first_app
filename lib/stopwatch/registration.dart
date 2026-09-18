import 'package:flutter/material.dart';
import 'package:my_first_app/stopwatch/login.dart';

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
  bool ischecked = false;
  String city = 'city 1';
  double value = 48;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration Page')),
      body: Center(child: Register ? _buildSuccess() : _buildRegisterForm()),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
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
    return Form(
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
            TextFormField(
              controller: _passController,
              decoration: const InputDecoration(labelText: 'Password'),
              validator: (text) {
                if (text!.isEmpty) {
                  return 'password cannot be empty';
                }
                final regex = RegExp('[^@]+@[^.]+..+');
                if (!regex.hasMatch(text)) {
                  return 'Please enter a valid password';
                }
                pass = _passController.text;
                return null;
              },
            ),
            TextFormField(
              controller: _cpassController,
              decoration: const InputDecoration(labelText: 'Confrim Password'),
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Confirm password cannot be empty';
                }
                if (pass == text) {
                  return 'Please enter a valid password';
                }
                return null;
              },
            ),
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
            CheckboxListTile(
              title: const Text("10th"),
              value: ischecked,
              onChanged: (v) => setState(() {
                ischecked = v!;
              }),
            ),
            CheckboxListTile(
              title: const Text("11th"),
              value: ischecked,
              onChanged: (v) => setState(() {
                ischecked = v!;
              }),
            ),
            CheckboxListTile(
              title: const Text("12th"),
              value: ischecked,
              onChanged: (v) => setState(() {
                ischecked = v!;
              }),
            ),
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
            Slider(
              value: value,
              min: 0,
              max: 100,
              divisions: 100,
              onChanged: (double newValue) {
                setState(() {
                  value = newValue;
                });
              },
            ),
            Text('Value: ${value.round()}'),

            const SizedBox(height: 20),
            ElevatedButton(onPressed: _validate, child: const Text('Register')),
          ],
        ),
      ),
    );
  }

  void _validate() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      setState(() {
        name = _nameController.text;
        email = _emailController.text;
        Register = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }
}
