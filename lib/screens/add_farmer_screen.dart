import 'package:flutter/material.dart';
import 'forgot_password_screen.dart';
import 'home_screen.dart';

class AddFarmerScreen extends StatefulWidget {
  const AddFarmerScreen({super.key});

  @override
  _AddFarmerState createState() => _AddFarmerState();
}

class _AddFarmerState extends State<AddFarmerScreen> {
  String? _selectedSalutation = 'Mr';
  String? _selectedBlock = 'All';
  String? _selectedVCDC = 'All';
  String? _selectedRevenueVillage = 'All';

  String? _selectedValue = '--select--';
  final List<String> _selected = ['--select--'];


  final List<String> _salutation = ['Mr', 'Mrs', 'Late', 'Miss', 'Smt'];
  final List<String> _blocks = ['All', 'Block 1', 'Block 2', 'Block 3'];
  final List<String> _vcdcs = ['All', 'VCDC 1', 'VCDC 2', 'VCDC 3'];
  final List<String> _revenueVillages = [
    'All',
    'Village 1',
    'Village 2',
    'Village 3'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: const Text('Farmer Detail')),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),

              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 36),
                    const Text(
                      'Personal Information',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 4,
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  _buildDropdown(
                                      'Salutation',
                                      _selectedSalutation,
                                      _salutation, (String? newValue) {
                                    setState(() {
                                      _selectedSalutation = newValue;
                                    });
                                  }),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    'First Name:',
                                    'Enter First Name',
                                    '',
                                    (value) {
                                      // Handle the changed text
                                      print('FirstName changed: $value');
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    'Middle Name:',
                                    'Enter Middle Name',
                                    '',
                                    (value) {
                                      // Handle the changed text
                                      print('MiddleName changed: $value');
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    'Last Name:',
                                    'Enter Last Name',
                                    '',
                                    (value) {
                                      // Handle the changed text
                                      print('LastName changed: $value');
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    'Family Name:',
                                    'Enter Family Name',
                                    '',
                                    (value) {
                                      print('FamilyName changed: $value');
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    'Date of birth:',
                                    'Enter DOB Name',
                                    '',
                                    (value) {
                                      // Handle the changed text
                                      print('FamilyName changed: $value');
                                    },
                                  ),

                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    'Mobile Number:',
                                    'Enter Mobile Number',
                                    '',
                                    (value) {
                                      print('Mobile Number changed: $value');
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    'Alternate Mobile Number :',
                                    'Enter Alternate Mobile Number ',
                                    '',
                                    (value) {
                                      // Handle the changed text
                                      print('Mobile Number changed: $value');
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    'Email:',
                                    'Enter Email Address',
                                    '',
                                    (value) {
                                      // Handle the changed text
                                      print('Email changed: $value');
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  _buildDropdown('Gender:', _selectedValue,
                                      _selected, (String? newValue) {
                                        setState(() {
                                          _selectedValue = newValue;
                                        });
                                      }),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    'Hornet Number (Max size: 10) :',
                                    'Enter Hornet Number',
                                    '',
                                    (value) {
                                      // Handle the changed text
                                      print('Hornet Number changed: $value');
                                    },
                                  ),
                                  const SizedBox(height: 16),

                                  _buildTextField('Monthly Family Income ✫ :', '', '', (value) {
                                      // Handle the changed text
                                      print('MonthlyIncome changed: $value');
                                    },),
                                  const SizedBox(height: 16),
                                  _buildDropdown('Monthly Family IncomeZ:', _selectedValue,
                                      _selected, (String? newValue) {
                                        setState(() {
                                          _selectedValue = newValue;
                                        });
                                      }),
                                ]))),
                    const SizedBox(height: 36),
                    const Text(
                      'Address Information',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 4,
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  const SizedBox(height: 16),
                                  _buildDropdown(
                                      'Country:',
                                      _selectedSalutation,
                                      _salutation, (String? newValue) {
                                    setState(() {
                                      _selectedSalutation = newValue;
                                    });
                                  }),
                                  const SizedBox(height: 16),
                                  _buildDropdown('State:', _selectedValue,
                                      _selected, (String? newValue) {
                                    setState(() {
                                      _selectedValue = newValue;
                                    });
                                  }),
                                  const SizedBox(height: 16),
                                  _buildDropdown(
                                      'District:',
                                      _selectedValue,
                                      _selected, (String? newValue) {
                                    setState(() {
                                      _selectedValue = newValue;
                                    });
                                  }),
                                  const SizedBox(height: 16),
                                  _buildDropdown('Block:', _selectedValue,
                                      _selected, (String? newValue) {
                                    setState(() {
                                      _selectedValue = newValue;
                                    });
                                  }),
                                  const SizedBox(height: 16),
                                  _buildDropdown('VCDC :', _selectedValue,
                                      _selected, (String? newValue) {
                                    setState(() {
                                      _selectedValue = newValue;
                                    });
                                  }),
                                  const SizedBox(height: 16),
                                  _buildDropdown(
                                      'Revenue Village:',
                                      _selectedValue,
                                      _selected, (String? newValue) {
                                    setState(() {
                                      _selectedValue = newValue;
                                    });
                                  }),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    'Village Name:',
                                    'Enter Village Name',
                                    '',
                                    (value) {
                                      // Handle the changed text
                                      print('Email changed: $value');
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    'Address Line:',
                                    'Enter Address Line',
                                    '',
                                    (value) {
                                      // Handle the changed text
                                      print('Email changed: $value');
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    'Pincode::',
                                    'Enter PinCode',
                                    '',
                                    (value) {
                                      // Handle the changed text
                                      print('Email changed: $value');
                                    },
                                  ),
                                ]))),



                    const SizedBox(height: 36),
                    const Text(
                      'Social Information',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 4,
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  const SizedBox(height: 16),
                                  _buildDropdown(
                                      'Farmer Category:',
                                      _selectedSalutation,
                                      _salutation, (String? newValue) {
                                    setState(() {
                                      _selectedSalutation = newValue;
                                    });
                                  }),
                                  const SizedBox(height: 16),
                                  _buildDropdown('Social Category:', _selectedValue,
                                      _selected, (String? newValue) {
                                        setState(() {
                                          _selectedValue = newValue;
                                        });
                                      }),
                                  const SizedBox(height: 16),
                                  _buildDropdown(
                                      'Education:',
                                      _selectedValue,
                                      _selected, (String? newValue) {
                                    setState(() {
                                      _selectedValue = newValue;
                                    });
                                  }),
                                  const SizedBox(height: 16),
                                  _buildDropdown('Religion:', _selectedValue,
                                      _selected, (String? newValue) {
                                        setState(() {
                                          _selectedValue = newValue;
                                        });
                                      }),
                                  const SizedBox(height: 16),
                                  _buildDropdown('Occupation :', _selectedValue,
                                      _selected, (String? newValue) {
                                        setState(() {
                                          _selectedValue = newValue;
                                        });
                                      }),

                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    'Aadhaar Number (Max size:12):',
                                    'Enter  Aadhaar Number',
                                    '',
                                        (value) {
                                      // Handle the changed text
                                      print('Email changed: $value');
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    'Pan card Number (Max size:10):',
                                    'Enter Pan card Number (Max size:10):',
                                    '',
                                        (value) {
                                      // Handle the changed text
                                      print('Email changed: $value');
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextField('Ration Card Number (Max Size:15):', 'Enter Ration Number', '', (value) {
                                      // Handle the changed text
                                      print('Email changed: $value');
                                    },),
                                  const SizedBox(height: 16),
                                  _buildTextField('Voter Number (Max Size:10):', 'Enter Voter Number', '', (value) {
                                      // Handle the changed text
                                      print('Email changed: $value');
                                    },),
                                ]))),

                    const SizedBox(height: 36),
                    const Text(
                      'Family Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 4,
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16),
                                  _buildTextField('Male Members :', 'Enter no. of Male Member', '', (value) {
                                    // Handle the changed text
                                    print('Email changed: $value');
                                  },),
                                  const SizedBox(height: 16),
                                  _buildTextField('Female Members :', 'Enter no.of Female', '', (value) {
                                    // Handle the changed text
                                    print('Email changed: $value');
                                  },),
                                  const SizedBox(height: 16),
                                  _buildDropdown('Do Farmer belong to BPL Category?:', _selectedSalutation, _salutation, (String? newValue) {setState(() {_selectedSalutation = newValue;});}),
                                  const SizedBox(height: 16),
                                  _buildDropdown('Is PM-Kishan Holder ?:', _selectedValue,
                                      _selected, (String? newValue) {
                                        setState(() {
                                          _selectedValue = newValue;
                                        });
                                      }),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    'PM-Kishan Number:',
                                    'Enter PM-Kishan Number',
                                    '',
                                        (value) {
                                      // Handle the changed text
                                      print('Email changed: $value');
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    'No of Children (Below 12 years):',
                                    'Enter no of children',
                                    '',
                                        (value) {
                                      // Handle the changed text
                                      print('Email changed: $value');
                                    },
                                  ),

                                ])))

                  ])),
        ));
  }

  Widget _buildDropdown(String label, String? selectedValue, List<String> items,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
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
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: Colors.grey),
          ),
          child: TextField(
            controller: TextEditingController(text: initialValue),
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

}
