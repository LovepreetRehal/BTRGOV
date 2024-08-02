import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../retrofit/CommonService.dart';
import 'forgot_password_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _selectedDepartments = '--Select--';

  final List<String> _department = ['--Select--', 'AGRICULTURE', 'HORTICULTURE', 'IRRIGATION','DIARY','VETERINARY','FOOD &amp; CIVIL SUPPLIES','OTHERS'];

  String _mobileNumber = '';
  String _password = '';
  bool _isLoading = false;


  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final commonService = Provider.of<CommonService>(context, listen: false);
      final response = await commonService.login(_mobileNumber, _password, _selectedDepartments ?? '');

      // Handle the response data as needed.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to log in')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      backgroundColor: Colors.white, // Set the background color of the Scaffold
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo
              const SizedBox(height: 50),
              Image.asset(
                'resources/image/BTRgov-logo.png', // Path to your logo
                width: 100, // Adjust width as needed
                height: 100, // Adjust height as needed
              ),
              const SizedBox(height: 20),

              _buildTextField('Mobile Number :', 'Enter Mobile Number', '', (value) {
                // Handle the changed text
                print('Email changed: $value');
                setState(() {
                  _mobileNumber = value ?? '';
                });
              },),
              const SizedBox(height: 16),
              _buildTextField('Password :', 'Enter Password', '', (value) {
                // Handle the changed text
                print('Email changed: $value');
                setState(() {
                  _password = value ?? '';
                });
              },),

              const SizedBox(height: 16),

              _buildDropdown('Select Department', _selectedDepartments, _department, (String? newValue) {
                setState(() {
                  _selectedDepartments = newValue;
                });
              }),
              const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),);
                },
                child: const Text('Forgot Password?'),
              ),
              MouseRegion(
            cursor: SystemMouseCursors.click,
            child: ElevatedButton(
              onPressed: () {
                // Handle button press
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()),);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green[800], // Text color
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0), // Border radius
                ),
                textStyle: const TextStyle(
                  fontSize: 12, // Font size
                  fontWeight: FontWeight.w600, // Font weight
                  letterSpacing: 1.5, // Letter spacing
                ),
              ).copyWith(
                // Optionally, modify the button style for different states
                // You can also use themes for more comprehensive styling
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Log In'),
            ),
              // child: const Text('Log In'),
            // ),
      //
      ),
      ]),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildTextField(
      String label,
      String hint,
      String? initialValue,
      ValueChanged<String?> onChanged,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: Colors.grey),
          ),
          child: TextField(
            controller: TextEditingController(text: initialValue),
            style: const TextStyle(
              fontSize: 14, // Set input text size
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,

            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }


  Widget _buildDropdown(String label, String? selectedValue, List<String> items,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          // Make the container take the full width of its parent
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: Colors.grey),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              isExpanded: true,
              // Make the dropdown take the full width of its container
              onChanged: onChanged,
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
