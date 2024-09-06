import 'dart:convert';
import 'dart:io';

import 'package:btr_gov/data/ApiClient.dart';
import 'package:btr_gov/retrofit/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/FarmerSingleDetail.dart';
import '../model/FarmerStateRepose.dart';
import '../retrofit/CommonService.dart';
import 'forgot_password_screen.dart';
import 'home_screen.dart';
import 'package:image_picker/image_picker.dart';

class AddFarmerScreen extends StatefulWidget {
  bool edit = false;
  String? id;
  AddFarmerScreen({required this.edit, this.id});

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
  String? _selectedState = ''; // Set initial value to match the list
  String? _selectedDistricts = 'Baksa'; // Set initial value to match the list
  String? _selectedBlocks = 'All'; // Set initial value to match the list
  String? _selectedIncome = 'Below 2000'; // Set initial value to match the list
  String? _selectedVcdcs = 'All'; // Set initial value to m
  String? _selectedRevenueVillages = 'All';
  String? _selectedDate = ''; // State variable for storing the selected date
  String? _familyName = 'test'; // State variable for storing the selected date
  String? _mobileNumber = ''; // State variable for storing the selected date
  String? _alternateMobileNumber = ''; // State variable for storing the selected date
  String? _emailAddress = ''; // State variable for storing the selected date
  String? _hornetNumber = '';
  String? _monthlyIncome='2000';
  String? _VillageName='';
  String? _addressLine='';
  String? _pincode='147021';
  String? _aadharNumber='';
  String? _panCardNumber='';
  String? _rationCardNumber='';
  String? _voterNumber='';
  String? _maleMember='';
  String? _accountNumber='';
  String? _accountHolderName='';
  String? _IFSCcode='';
  String? _BankName='';
  String? _BranchName='';
  String? _feMaleMember='';
  String? _pmKishansNumber='';
  String? _noOfChildNumber='';
  String? _firstName='demo';
  String? _lastName='estte';
  String? _middleName='test';

  var paramdic = {"": ""};

  Farmersingledetail? _Farmersingledetail;
  bool loadlist = true;


  bool _isLoading = false;
  final TextEditingController _dateController =
      TextEditingController(); // Controller for the date field

  String? _selectedValue = '--select--';
  final List<String> _selected = ['--select--', 'MALE', 'FEMALE', 'OTHER'];

  final List<String> _countryList = ['India'];
  final List<String> _farmerCategories = ['Farmer','Farm worker','Processor','Non-farmer'];
  final List<String> _education = ['Primary(1-5 class)','Upper Primary(6-8 class)','High School(9-10 class)','Higher Secondary(11-12 class)','Graduate','Post Graduation'];
  final List<String> _bplStatuses = ['Yes', 'No'];
  final List<String> _pmKishans = ['Yes', 'No'];
  final List<String> _occupations = ['OCCUPATION_A'];
  final List<String> _religions = ['Hindu', 'Christian', 'Muslim', 'Sikh', 'Buddhist', 'Jain', 'Other Religion',];
  final List<String> _socialCategories = ['ST', 'SC', 'OBC', 'GEN',];
  final List<String> _states = ['Assam'];
  final List<String> _districts = ['Baksa','Balaji','Barpeta','Chirang','Kokrajhar','Tamulpur','Udalguri'];
  final List<String> _blocks = ['BARAMA','BAKSA','DHAMDHAMA','GOBARDHANA(BTC)','GORESWAR','JALAH(BTC)','NAGRIJULI', 'TAMULPUR'];
  final List<String> _incomes = ['Below 2000', '2000 to 5000', '5000 to 8000', '8000 to 10,000', 'Above 10, 000',];
  final List<String> _salutation = ['Mr', 'Mrs', 'Late', 'Miss', 'Smt'];
  final List<String> _vcdcs = ['Barama', 'Debachara', 'Kaklabari', 'Kharuajan','Merkuchi','Puransripur'];
  final List<String> _revenueVillages = ['Barama', 'Nizjuluki', 'Khadamtola', 'Heramjar''Madhapur''Kaljar''Alagar''Mahoria'];

  File? _passbookImage;
  File? _aadharImage;
  File? _voterIdImage;

  Map<String, dynamic>? DashboardCategory;


  final ImagePicker _picker = ImagePicker();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _FamilyNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _mobilenumberController = TextEditingController();
  final TextEditingController _alternateNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _hornetController = TextEditingController();
  final TextEditingController _villageNameController = TextEditingController();
  final TextEditingController _addressLineController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _aadharCardController = TextEditingController();
  final TextEditingController _panCardController = TextEditingController();
  final TextEditingController _rationCardController = TextEditingController();
  final TextEditingController _voterCardController = TextEditingController();
  final TextEditingController _maleMemberController = TextEditingController();
  final TextEditingController _feMaleMemberController = TextEditingController();
  final TextEditingController _pmkishanController = TextEditingController();
  final TextEditingController _childrenNoController = TextEditingController();
  final TextEditingController _accountNoController = TextEditingController();
  final TextEditingController _accountHolderNameController = TextEditingController();
  final TextEditingController _ifscCodeController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();



  List<District> _district = [];
  List<CategoryWiseFarmerStats> _categoryWiseFarmerStats = [];
  List<LandTypeWiseLandStats> _landTypeWiseLandStats = [];
  List<Block> _block = [];
  List<Vcdc> _vcdc = [];
  List<Village> _villages = [];


  Future<void> _CreateFarmer() async {
    if (_passbookImage == null ||
        _aadharImage == null ||
        _voterIdImage == null) {
      print('Please select both files');
      Utils.toast('Please select both files');
      return;
    }
    var param = {
      "family_name": _familyName.toString(),
      "monthly_income": _monthlyIncome.toString(),
      "first_name": _firstName.toString(),
      "middle_name": _middleName.toString(),
      "last_name": _lastName.toString(),
      "address_line_1": _addressLine.toString(),
      "address_line_2": _selectedRevenueVillages.toString(),
      "pincode": _pincode.toString(),
      "country_code": "IN",
      "state_code": _selectedState.toString(),
      "district_code": _selectedDistricts.toString(),
      "block_code": _selectedBlocks.toString(),
      "vcdc_code": _selectedVcdcs.toString(),
      "revenue_village_code": _selectedRevenueVillages.toString(),
      "date_of_birth": _dateController.toString(),
      "gender_code": _selectedValue.toString(),
      "photograph": "",
      "mobile_number": _mobileNumber.toString(),
      "alternate_number": _alternateMobileNumber.toString(),
      "email": _emailAddress.toString(),
      "farmer_category_code": _farmerCategories.toString(),
      "social_category_code": _socialCategories.toString(),
      "education_code": _selectedEducation.toString(),
      "religion_code": _selectedReligions.toString(),
      "occupation_code": _selectedOccupations.toString(),
      "aadhar_number": _aadharNumber.toString(),
      "aadhar_card_image": _aadharImage.toString(),
      "voter_card_image": _voterIdImage.toString(),
      "relation": _selectedReligions.toString(),
      "pan_number": _panCardNumber.toString(),
      "ration_card": _rationCardNumber.toString(),
      "voter_number": _voterNumber.toString(),
      "govt_farmer_id": "",
      "hortnet_id": "1111111111",
      "is_head": "",
      "village": _selectedRevenueVillages.toString(),
      "family_head_id": "",
      "salutation_id": "1",
      "search": "",
      "is_bpl": "0",
      "male_members": _maleMember.toString(),
      "female_members": _feMaleMember.toString(),
      "is_pm_kishan_holder": _pmKishans.toString(),
      "pm_kishan_number": _pmKishansNumber.toString(),
      "is_financial_assistant_holder": "",
      "amount": "100",
      "received_year": "2000",
      "scheme_name": "",
      "open_pm_number": "0",
      "acc_num": _accountNumber.toString(),
      "acc_holder_name": _accountHolderName.toString(),
      "ifsc_code": _IFSCcode.toString(),
      "bank_name": _BankName.toString(),
      "bank_branch_name": _BranchName.toString(),
      "bank_passbook": "",
      "metadata[isGovtjob]": "0"
    };

    print('rehal->>>>   $param');
    ApiClient().postMultipartData(Utils.store, param, [
      MultipartBody(
        'photograph',
        XFile(_passbookImage!.path),
      ),
      MultipartBody(
        'aadhar_card_image',
        XFile(_aadharImage!.path),
      ),
      MultipartBody(
        'voter_card_image',
        XFile(_voterIdImage!.path),
      ),
    ]).then((onValue) {
      if (onValue.statusCode == 201) {
        Utils.toast(onValue.body);
        print("Done ${onValue.body}");

      } else {
        Utils.toast(onValue.body);
        print("error ${onValue.body}");
      }
    });

  }

  getEditData(bool edit, String? id) {
    ApiClient().getData(Utils.editDetail, true, paramdic).then((onValue) {
      if (onValue.statusCode == 200) {
        var data = json.decode(onValue.body);
        _Farmersingledetail = Farmersingledetail.fromJson(data["data"]);
        print(data["data"]);
        setState(() {
          _firstNameController.text = data['full_name'];
          _dobController.text = data['date_of_birth'];
          _mobilenumberController.text = data['mobile_number'];
        });
        loadlist = false;
      } else {
        loadlist = false;
      }
      setState(() {});
    });
  }



  void fetchCategoryWiseFarmerStats() async {
    final Map<String, String> queryParams = {'': ''};
    ApiClient().homeCategoryFilter(Utils.dashboard, queryParams ,true, ).then((onValue) {


      if (onValue.statusCode == 200) {
        setState(() {

          // DashboardCategory = json.decode(onValue.body) as Map<String, dynamic>;

          final responseData = jsonDecode(onValue.body);
          final farmerStatsResponse = FarmerStatsResponse.fromJson(responseData);
          _categoryWiseFarmerStats = farmerStatsResponse.data.categoryWiseFarmerStats;
          _landTypeWiseLandStats = farmerStatsResponse.data.landTypeWiseLandStats;
          _district = farmerStatsResponse.data.districts;
          _block = farmerStatsResponse.data.blocks;
          _vcdc = farmerStatsResponse.data.vcdcs;
          _villages = farmerStatsResponse.data.villages;
          print("_categoryWiseFarmerStats  API RESPOSE----- ${_categoryWiseFarmerStats}");
          print("_villages  API RESPOSE----- ${_villages}");

        });
        print("fetchCategoryWiseFarmerStats  API RESPOSE----- ${json.decode(onValue.body)}");
      } else {
        // Handle the error case
        print('Error: ${onValue.body}');
      }
    });}




  @override
  void initState() {
    super.initState();
    print('Edit mode: ${widget.edit}');
    print('Farmer ID: ${widget.id}');
    fetchCategoryWiseFarmerStats();

    if(widget.edit == true){
      getEditData(widget.edit, widget.id); // Fetch farmer details when screen is opened

    }
  }

  void getEditdata() {
    if (widget.edit == false) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  _firstNameController,
                                  (value) {
                                    // Handle the changed text
                                    _firstName = value;
                                    print('FirstName changed: $value');
                                  },
                                ),
                                const SizedBox(height: 16),
                                _buildTextField(
                                  'Middle Name:',
                                  'Enter Middle Name',
                                  _middleNameController,
                                  (value) {
                                    // Handle the changed text
                                    _middleName = value;
                                    print('MiddleName changed: $value');
                                  },
                                ),
                                const SizedBox(height: 16),
                                _buildTextField(
                                  'Last Name:',
                                  'Enter Last Name',
                                  _lastNameController,
                                  (value) {
                                    // Handle the changed text
                                    _lastName = value;
                                    print('LastName changed: $value');
                                  },
                                ),
                                const SizedBox(height: 16),
                                _buildTextField(
                                  'Family Name:',
                                  'Enter Family Name',
                                  _FamilyNameController,
                                  (value) {
                                    _familyName = value ?? '';
                                    print('FamilyName changed: $value');
                                  },
                                ),
                                const SizedBox(height: 16),
                                _buildDatePickerField(
                                  'Date of Birth:',
                                  'Enter DOB',
                                _dobController,
                                  // Pass the date controller to the date field
                                  (value) {
                                    // setState(() {
                                      _selectedDate = value ?? '';
                                      print('Selected DOB: $value');
                                    // }
                                    // );
                                  },
                                ),
                                const SizedBox(height: 16),
                                _buildTextField(
                                    'Mobile Number:', 'Enter Mobile Number', _mobilenumberController,
                                    (value) {
                                      _mobileNumber = value ?? '';

                                      print('Mobile Number changed: $value');
                                }, isPhone: true),
                                const SizedBox(height: 16),
                                _buildTextField(
                                    'Alternate Mobile Number :',
                                    'Enter Alternate Mobile Number ',
                                    _alternateNumberController, (value) {
                                  // Handle the changed text
                                  _alternateMobileNumber = value ?? '';

                                  print('Mobile Number changed: $value');
                                }, isPhone: true),
                                const SizedBox(height: 16),
                                _buildTextField(
                                  'Email:',
                                  'Enter Email Address',
                                  _emailController,
                                  (value) {
                                    // Handle the changed text
                                    _emailAddress = value ?? '';

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
                                    _hornetController, (value) {
                                  // Handle the changed text
                                  setState(() {
                                    _hornetNumber = value;

                                  });

                                  print('Hornet Number changed: $value');
                                }, isPhone: true),
                                const SizedBox(height: 16),
                                _buildDropdown(
                                    'Monthly Family Income ✫ :',
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
                                  _villageNameController,
                                  (value) {
                                    _VillageName = value;

                                    // Handle the changed text
                                    print('Email changed: $value');
                                  },
                                ),
                                const SizedBox(height: 16),
                                _buildTextField(
                                  'Address Line:',
                                  'Enter Address Line',
                                  _addressLineController,
                                  (value) {
                                    // Handle the changed text
                                    _addressLine = value;
                                    print('Email changed: $value');
                                  },
                                ),
                                const SizedBox(height: 16),
                                _buildTextField(
                                  'Pincode::',
                                  'Enter PinCode',
                                  _pincodeController,
                                  (value) {
                                    // Handle the changed text
                                    _pincode = value;
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
                                    'Enter  Aadhaar Number', _aadharCardController, (value) {
                                  // Handle the changed text
                                      _aadharNumber = value;

                                  print('Aadhaar number changed: $value');
                                }, isPhone: true),
                                const SizedBox(height: 16),
                                _buildTextField(
                                  'Pan card Number (Max size:10):',
                                  'Enter Pan card Number (Max size:10):',
                                  _panCardController,
                                  (value) {
                                    // Handle the changed text
                                    _panCardNumber = value;
                                    print('Email changed: $value');
                                  },
                                ),
                                const SizedBox(height: 16),
                                _buildTextField(
                                  'Ration Card Number (Max Size:15):',
                                  'Enter Ration Number',
                                  _rationCardController,
                                  (value) {
                                    // Handle the changed text
                                    _rationCardNumber = value;

                                    print('Cardnumber changed: $value');
                                  },
                                ),
                                const SizedBox(height: 16),
                                _buildTextField(
                                  'Voter Number (Max Size:10):',
                                  'Enter Voter Number',
                                  _voterCardController,
                                  (value) {
                                    // Handle the changed text
                                    _voterNumber = value;
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
                                  _maleMemberController,
                                  (value) {
                                    // Handle the changed text
                                    _maleMember = value;
                                    print('male member changed: $value');
                                  },
                                ),
                                const SizedBox(height: 16),
                                _buildTextField(
                                  'Female Members :',
                                  'Enter no.of Female',
                                  _feMaleMemberController,
                                  (value) {
                                    // Handle the changed text
                                    _feMaleMember = value;
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
                                  _pmkishanController,
                                  (value) {
                                    // Handle the changed text
                                    _pmKishansNumber = value;

                                    print('Email changed: $value');
                                  },
                                ),
                                const SizedBox(height: 16),
                                _buildTextField(
                                  'No of Children (Below 12 years):',
                                  'Enter no of children',
                                  _childrenNoController,
                                  (value) {
                                    // Handle the changed text
                                    _noOfChildNumber = value;
                                    print('Email changed: $value');
                                  },
                                ),
                              ]))),
                  const SizedBox(height: 16),

                  const SizedBox(height: 36),
                  const Text(
                    'Account Details',
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
                                  'Account Number (Max size: 20) :',
                                  'Enter Account Number',
                                  _accountNoController,
                                      (value) {
                                    // Handle the changed text
                                    _accountNumber = value;
                                    print('male member changed: $value');
                                  },
                                ),
                                const SizedBox(height: 16),
                                _buildTextField(
                                  'Account Holder Name :',
                                  'Enter Account Holder Name ',
                                  _accountHolderNameController,
                                      (value) {
                                    // Handle the changed text
                                    _accountHolderName = value;
                                    print('Email changed: $value');
                                  },
                                ),

                                const SizedBox(height: 16),
                                _buildTextField('IFSC Code (Max size: 11) :', 'Enter IFSC Code ', _ifscCodeController,
                                      (value) {
                                    // Handle the changed text
                                    _IFSCcode = value;
                                    print('Email changed: $value');
                                  },
                                ),

                                const SizedBox(height: 16),
                                _buildTextField(
                                  'Bank Name :',
                                  'Bank Name ',
                                  _bankNameController,
                                      (value) {
                                    // Handle the changed text
                                    _BankName = value;

                                    print('Email changed: $value');
                                  },
                                ),
                                const SizedBox(height: 16),
                                _buildTextField(
                                  'Branch Name :',
                                  'Branch Name',
                                  _branchNameController,
                                      (value) {
                                    // Handle the changed text
                                        _BranchName = value;
                                    print('Email changed: $value');
                                  },


                                ),
                                const SizedBox(height: 16),
                                 Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      _buildImageUploadSection(
                                        title: 'Passbook Image',
                                        buttonText: 'Upload Passbook',
                                        imageFile: _passbookImage,
                                        onUpload: () =>
                                            _pickImage(ImageSource.camera, 'passbook'),
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
                                                onUpload: () =>
                                                    _pickImage(ImageSource.camera, 'aadhar'),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 8), // Add space between the containers
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.all(
                                                  8.0), // Add margin to provide space
                                              child: _buildImageUploadSection(
                                                title: 'Upload Voter ID Card',
                                                buttonText: 'Browse Image',
                                                imageFile: _voterIdImage,
                                                onUpload: () => _pickImage(
                                                    ImageSource.camera, 'voterId'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ]
                          ),
                      ),


                  ),

                  const SizedBox(height: 16),
                  _buildSectionTitle("Save")
                ],
              )),
        ));
  }




  Widget _buildDropdown(
      String label, String? selectedValue, List<String> items, ValueChanged<String?> onChanged) {
    // Ensure that selectedValue is either null or matches one of the items
    String? validatedSelectedValue =
    items.contains(selectedValue) ? selectedValue : null;

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
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: validatedSelectedValue,
              isExpanded: true,
              onChanged: (String? newValue) {
                onChanged(newValue);
              },
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
      TextEditingController controller,
      ValueChanged<String?> onChanged, {
        bool isPhone = false,
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
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
            ),
            keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }



/*  Widget _buildDropdown(String label, String? selectedValue, List<String> items, ValueChanged<String?> onChanged) {
    // Ensure that selectedValue is either null or matches one of the items
    String? validatedSelectedValue =
    items.contains(selectedValue) ? selectedValue : null;

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
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: validatedSelectedValue,
              isExpanded: true,
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
  }*/

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
                _CreateFarmer();
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
//  Future<String> downloadandsave(String uri)async{
//    final Directory directory = await getApplicationDocumentsDirectory();
//    final String filePath = '${directory.path}/shop';
//    final http.Response response = await http.get(Uri.parse(uri));
//    final File file = File(filePath);
//    await file.writeAsBytes(response.bodyBytes);
//    return filePath;
//  }
}
