import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../retrofit/CommonService.dart';
import 'forgot_password_screen.dart';
import 'home_screen.dart';
import 'package:image_picker/image_picker.dart';

class AddFarmerScreen extends StatefulWidget {
  const AddFarmerScreen({super.key});

  @override
  _AddFarmerState createState() => _AddFarmerState();
}

class _AddFarmerState extends State<AddFarmerScreen> {
  String? _selectedSalutation = 'Mr';
  String? _selectedCountry = 'India'; // Set initial value to match the list
  String? _selectedFarmerCategories =
      'FARMER_CAT_1'; // Set initial value to match the list
  String? _selectedEducation = 'EDU_A'; // Set initial value to match the list
  String? _selectedBplStatuses = 'Yes'; // Set initial value to match the list
  String? _selectedPmKishans = 'Yes'; // Set initial value to match the list
  String? _selectedOccupations =
      'OCCUPATION_A'; // Set initial value to match the list
  String? _selectedReligions = 'Hindu'; // Set initial value to match the list
  String? _selectedSocialCategories =
      'ST'; // Set initial value to match the list
  String? _selectedState = 'Punjab'; // Set initial value to match the list
  String? _selectedDistricts = 'Patiala'; // Set initial value to match the list
  String? _selectedBlocks = 'All'; // Set initial value to match the list
  String? _selectedIncome = 'Below 2000'; // Set initial value to match the list
  String? _selectedVcdcs = 'All'; // Set initial value to m
  String? _selectedRevenueVillages = 'All';
  String _selectedDate = ''; // State variable for storing the selected date

  bool _isLoading = false;
  final TextEditingController _dateController =
      TextEditingController(); // Controller for the date field

  String? _selectedValue = '--select--';
  final List<String> _selected = ['--select--', 'MALE', 'FEMALE', 'OTHER'];

  final List<String> _countryList = ['India'];
  final List<String> _farmerCategories = ['FARMER_CAT_1'];
  final List<String> _education = ['EDU_A'];
  final List<String> _bplStatuses = ['Yes', 'No'];
  final List<String> _pmKishans = ['Yes', 'No'];
  final List<String> _occupations = ['OCCUPATION_A'];
  final List<String> _religions = [
    'Hindu',
    'Christian',
    'Muslim',
    'Sikh',
    'Buddhist',
    'Jain',
    'Other Religion',
  ];
  final List<String> _socialCategories = [
    'ST',
    'SC',
    'OBC',
    'GEN',
  ];
  final List<String> _states = ['Punjab'];
  final List<String> _districts = ['Patiala'];
  final List<String> _blocks = ['All', 'BLOCKA'];
  final List<String> _incomes = [
    'Below 2000',
    '2000 to 5000',
    '5000 to 8000',
    '8000 to 10,000',
    'Above 10, 000',
  ];
  final List<String> _salutation = ['Mr', 'Mrs', 'Late', 'Miss', 'Smt'];
  final List<String> _vcdcs = ['All', 'VCDC1', 'VCDC 2', 'VCDC 3'];
  final List<String> _revenueVillages = [
    'All',
    'Village 1',
    'Village 2',
    'Village 3'
  ];

  File? _passbookImage;
  File? _aadharImage;
  File? _voterIdImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _getfarmerDetail() async {
    try {
      final commonService = Provider.of<CommonService>(context, listen: false);
      final response = await commonService.getFarmerDetail();
      print("forgot_response success: ${response.toString()}");

      if (response.status!) {
        // Handle successful login

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Success')));
      } else {
        // Show error message if login failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed : ${response.toString()}')),
        );
      }
    } catch (e) {
      print("forgot catch: ${e.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed : ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // _getfarmerDetail(); // Fetch farmer details when screen is opened
  }

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
                                const SizedBox(height: 8),
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
                                _buildDatePickerField(
                                  'Date of Birth:',
                                  'Enter DOB',
                                  _dateController,
                                  // Pass the date controller to the date field
                                  (value) {
                                    setState(() {
                                      _selectedDate = value ?? '';
                                      print('Selected DOB: $value');
                                    });
                                  },
                                ),
                                const SizedBox(height: 16),
                                _buildTextField(
                                    'Mobile Number:', 'Enter Mobile Number', '',
                                    (value) {
                                  print('Mobile Number changed: $value');
                                }, isPhone: true),
                                const SizedBox(height: 16),
                                _buildTextField(
                                    'Alternate Mobile Number :',
                                    'Enter Alternate Mobile Number ',
                                    '', (value) {
                                  // Handle the changed text
                                  print('Mobile Number changed: $value');
                                }, isPhone: true),
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
                                _buildDropdown(
                                    'Gender:', _selectedValue, _selected,
                                    (String? newValue) {
                                  setState(() {
                                    _selectedValue = newValue;
                                  });
                                }),
                                const SizedBox(height: 16),
                                _buildTextField(
                                    'Hornet Number (Max size: 10) :',
                                    'Enter Hornet Number',
                                    '', (value) {
                                  // Handle the changed text
                                  print('Hornet Number changed: $value');
                                }, isPhone: true),
                                const SizedBox(height: 16),
                                _buildTextField(
                                    'Monthly Family Income ✫ :', '', '',
                                    (value) {
                                  // Handle the changed text
                                  print('MonthlyIncome changed: $value');
                                }, isPhone: true),
                                const SizedBox(height: 16),
                                _buildDropdown(
                                    'Monthly Family IncomeZ:',
                                    _selectedIncome,
                                    _incomes, (String? newValue) {
                                  setState(() {
                                    _selectedIncome = newValue;
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
                                    'Country:', _selectedCountry, _countryList,
                                    (String? newValue) {
                                  setState(() {
                                    _selectedCountry = newValue;
                                  });
                                }),
                                const SizedBox(height: 16),
                                _buildDropdown(
                                    'State:', _selectedState, _states,
                                    (String? newValue) {
                                  setState(() {
                                    _selectedState = newValue;
                                  });
                                }),
                                const SizedBox(height: 16),
                                _buildDropdown(
                                    'District:', _selectedDistricts, _districts,
                                    (String? newValue) {
                                  setState(() {
                                    _selectedDistricts = newValue;
                                  });
                                }),
                                const SizedBox(height: 16),
                                _buildDropdown(
                                    'Block:', _selectedBlocks, _blocks,
                                    (String? newValue) {
                                  setState(() {
                                    _selectedBlocks = newValue;
                                  });
                                }),
                                const SizedBox(height: 16),
                                _buildDropdown('VCDC :', _selectedVcdcs, _vcdcs,
                                    (String? newValue) {
                                  setState(() {
                                    _selectedVcdcs = newValue;
                                  });
                                }),
                                const SizedBox(height: 16),
                                _buildDropdown(
                                    'Revenue Village:',
                                    _selectedRevenueVillages,
                                    _revenueVillages, (String? newValue) {
                                  setState(() {
                                    _selectedRevenueVillages = newValue;
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
                                    _selectedFarmerCategories,
                                    _farmerCategories, (String? newValue) {
                                  setState(() {
                                    _selectedFarmerCategories = newValue;
                                  });
                                }),
                                const SizedBox(height: 16),
                                _buildDropdown(
                                    'Social Category:',
                                    _selectedSocialCategories,
                                    _socialCategories, (String? newValue) {
                                  setState(() {
                                    _selectedSocialCategories = newValue;
                                  });
                                }),
                                const SizedBox(height: 16),
                                _buildDropdown('Education:', _selectedEducation,
                                    _education, (String? newValue) {
                                  setState(() {
                                    _selectedEducation = newValue;
                                  });
                                }),
                                const SizedBox(height: 16),
                                _buildDropdown(
                                    'Religion:', _selectedReligions, _religions,
                                    (String? newValue) {
                                  setState(() {
                                    _selectedReligions = newValue;
                                  });
                                }),
                                const SizedBox(height: 16),
                                _buildDropdown(
                                    'Occupation :',
                                    _selectedOccupations,
                                    _occupations, (String? newValue) {
                                  setState(() {
                                    _selectedOccupations = newValue;
                                  });
                                }),
                                const SizedBox(height: 16),
                                _buildTextField('Aadhaar Number (Max size:12):',
                                    'Enter  Aadhaar Number', '', (value) {
                                  // Handle the changed text
                                  print('Email changed: $value');
                                }, isPhone: true),
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
                                _buildTextField(
                                  'Ration Card Number (Max Size:15):',
                                  'Enter Ration Number',
                                  '',
                                  (value) {
                                    // Handle the changed text
                                    print('Email changed: $value');
                                  },
                                ),
                                const SizedBox(height: 16),
                                _buildTextField(
                                  'Voter Number (Max Size:10):',
                                  'Enter Voter Number',
                                  '',
                                  (value) {
                                    // Handle the changed text
                                    print('Email changed: $value');
                                  },
                                ),
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
                                _buildTextField(
                                  'Male Members :',
                                  'Enter no. of Male Member',
                                  '',
                                  (value) {
                                    // Handle the changed text
                                    print('Email changed: $value');
                                  },
                                ),
                                const SizedBox(height: 16),
                                _buildTextField(
                                  'Female Members :',
                                  'Enter no.of Female',
                                  '',
                                  (value) {
                                    // Handle the changed text
                                    print('Email changed: $value');
                                  },
                                ),
                                const SizedBox(height: 16),
                                _buildDropdown(
                                    'Do Farmer belong to BPL Category?:',
                                    _selectedBplStatuses,
                                    _bplStatuses, (String? newValue) {
                                  setState(() {
                                    _selectedBplStatuses = newValue;
                                  });
                                }),
                                const SizedBox(height: 16),
                                _buildDropdown(
                                    'Is PM-Kishan Holder ?:',
                                    _selectedPmKishans,
                                    _pmKishans, (String? newValue) {
                                  setState(() {
                                    _selectedPmKishans = newValue;
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
                              ]))),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildImageUploadSection(
                          title: 'Passbook Image',
                          buttonText: 'Upload Passbook',
                          imageFile: _passbookImage,
                          onUpload: () =>
                              _pickImage(ImageSource.gallery, 'passbook'),
                        ),
                        const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(8.0), // Add margin to provide space
                            child: _buildImageUploadSection(
                              title: 'Upload Aadhaar Card',
                              buttonText: 'Browse Image',
                              imageFile: _aadharImage,
                              onUpload: () => _pickImage(ImageSource.gallery, 'aadhar'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8), // Add space between the containers
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(8.0), // Add margin to provide space
                            child: _buildImageUploadSection(
                              title: 'Upload Voter ID Card',
                              buttonText: 'Browse Image',
                              imageFile: _voterIdImage,
                              onUpload: () => _pickImage(ImageSource.gallery, 'voterId'),
                            ),
                          ),
                        ),
                      ],
                    )

                    ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSectionTitle("Save")
                ],
              )),
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
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _buildTextField(
    String label,
    String hint,
    String? initialValue,
    ValueChanged<String?> onChanged, {
    bool isPhone = false, // Add an optional parameter for phone input
  }) {
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
            keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
            // Use phone keyboard if isPhone is true
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

// Method to build the date picker field
  Widget _buildDatePickerField(
    String label,
    String hint,
    TextEditingController controller, // Use a controller for the text field
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
          child: GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );

              if (pickedDate != null) {
                String formattedDate =
                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                setState(() {
                  _selectedDate = formattedDate;
                  controller.text =
                      formattedDate; // Update the controller with the selected date
                });
                onChanged(formattedDate);
              }
            },
            child: AbsorbPointer(
              child: TextField(
                controller: controller,
                // Attach the controller to the text field
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Handle button press
                print('Button Pressed');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.indigo[400],
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              child: Text(title),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource source, String imageType) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        switch (imageType) {
          case 'passbook':
            _passbookImage = File(image.path);
            break;
          case 'aadhar':
            _aadharImage = File(image.path);
            break;
          case 'voterId':
            _voterIdImage = File(image.path);
            break;
        }
      });
    }
  }

  Widget _buildImageUploadSection({
    required String title,
    required String buttonText,
    File? imageFile,
    required Function() onUpload,
  }) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              if (imageFile != null)
                Image.file(
                  imageFile,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                )
              else
                const Icon(Icons.upload_file, size: 50, color: Colors.grey),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: onUpload,
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
