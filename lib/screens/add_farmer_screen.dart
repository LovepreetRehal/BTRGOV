import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../retrofit/CommonService.dart';
import 'forgot_password_screen.dart';
import 'home_screen.dart';

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

  bool _isLoading = false;

  String? _selectedValue = '--select--';
  final List<String> _selected = ['--select--','MALE','FEMALE','OTHER'];

  final List<String> _countryList = ['India'];
  final List<String> _farmerCategories = ['FARMER_CAT_1'];
  final List<String> _education = ['EDU_A'];
  final List<String> _bplStatuses = ['Yes', 'No'];
  final List<String> _pmKishans = ['Yes', 'No'];
  final List<String> _occupations = ['OCCUPATION_A'];
  final List<String> _religions = ['Hindu', 'Christian', 'Muslim', 'Sikh', 'Buddhist', 'Jain', 'Other Religion',];
  final List<String> _socialCategories = ['ST', 'SC', 'OBC', 'GEN',];
  final List<String> _states = ['Punjab'];
  final List<String> _districts = ['Patiala'];
  final List<String> _blocks = ['All', 'BLOCKA'];
  final List<String> _incomes = ['Below 2000', '2000 to 5000', '5000 to 8000', '8000 to 10,000', 'Above 10, 000',];
  final List<String> _salutation = ['Mr', 'Mrs', 'Late', 'Miss', 'Smt'];
  final List<String> _vcdcs = ['All', 'VCDC1', 'VCDC 2', 'VCDC 3'];
  final List<String> _revenueVillages = ['All', 'Village 1', 'Village 2', 'Village 3'];

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
                                    '',
                                    (value) {
                                      // Handle the changed text
                                      print('Hornet Number changed: $value');
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTextField(
                                    'Monthly Family Income ✫ :',
                                    '',
                                    '',
                                    (value) {
                                      // Handle the changed text
                                      print('MonthlyIncome changed: $value');
                                    },
                                  ),
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
                                  _buildDropdown('Country:', _selectedCountry,
                                      _countryList, (String? newValue) {
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
                                      'District:',
                                      _selectedDistricts,
                                      _districts, (String? newValue) {
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
                                  _buildDropdown(
                                      'VCDC :', _selectedVcdcs, _vcdcs,
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
                                  _buildDropdown(
                                      'Education:',
                                      _selectedEducation,
                                      _education, (String? newValue) {
                                    setState(() {
                                      _selectedEducation = newValue;
                                    });
                                  }),
                                  const SizedBox(height: 16),
                                  _buildDropdown(
                                      'Religion:',
                                      _selectedReligions,
                                      _religions, (String? newValue) {
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
