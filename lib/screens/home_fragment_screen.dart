import 'package:flutter/material.dart';

class HomeFragmentScreen extends StatefulWidget {
  const HomeFragmentScreen({super.key});

  @override
  _HomeFragmentScreenState createState() => _HomeFragmentScreenState();
}

class _HomeFragmentScreenState extends State<HomeFragmentScreen>  {
  String? _selectedDistrict = 'All';
  String? _selectedBlock = 'All';
  String? _selectedVCDC = 'All';
  String? _selectedRevenueVillage = 'All';

  final List<String> _districts = ['All', 'District 1', 'District 2', 'District 3'];
  final List<String> _blocks = ['All', 'Block 1', 'Block 2', 'Block 3'];
  final List<String> _vcdcs = ['All', 'VCDC 1', 'VCDC 2', 'VCDC 3'];
  final List<String> _revenueVillages = ['All', 'Village 1', 'Village 2', 'Village 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Farmer'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('SuperAdministrator', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
              const SizedBox(height: 16),
              _buildDropdown('District', _selectedDistrict, _districts, (String? newValue) {
                setState(() {_selectedDistrict = newValue;});}),
              const SizedBox(height: 16),
              _buildDropdown('Block', _selectedBlock, _blocks, (String? newValue) {
                setState(() {_selectedBlock = newValue;});
              }),
              const SizedBox(height: 16),
              _buildDropdown('VCDC', _selectedVCDC, _vcdcs, (String? newValue) {
                setState(() {_selectedVCDC = newValue;});
              }),
              const SizedBox(height: 16),
              _buildDropdown('Revenue Village', _selectedRevenueVillage, _revenueVillages, (String? newValue) {
                setState(() {_selectedRevenueVillage = newValue;});
              }),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('Button Pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.indigo[400],
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    child: const Text('Filter'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildSectionTitle('TOTAL NUMBER OF FARMERS'),
              const SizedBox(height: 8),
              Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                elevation: 4,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TOTAL NUMBER OF FARMERS',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '28749',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'No. of farm families',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Color(0xFF28a745),
                            child: Text(
                              '28749',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildSectionTitle('FARMERS CATEGORY'),
              const SizedBox(height: 8),
              _buildDataTable([
                _buildDataRow('Farmer', '28428'),
                _buildDataRow('Farm worker', '35'),
                _buildDataRow('Processor', '8'),
                _buildDataRow('Non-farmer', '278'),
              ]),
              const SizedBox(height: 16),
              _buildSectionTitle('LAND TYPES'),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _buildDataTable([
                  _buildDataRowWithUnits('Agriculture', '25964', '109362.26', '14217.09'),
                  _buildDataRowWithUnits('Waste Land', '90', '325.5', '42.32'),
                  _buildDataRowWithUnits('PGR/VGR', '222', '816', '106.08'),
                  _buildDataRowWithUnits('Forest', '1378', '7672.52', '997.43'),
                ]),
              ),
              SizedBox(height: 16),
              // Expanded(
                // child: PieChart(
                //   PieChartData(
                //     sections: _buildPieChartSections(),
                //     sectionsSpace: 0,
                //     centerSpaceRadius: 40,
                //     pieTouchData: PieTouchData(
                //       touchCallback: (FlTouchEvent event, pieTouchResponse) {
                //         // Handle touch response here
                //       },
                //     ),
                //   ),
                // ),
              // ),
              SizedBox(height: 16),
              _buildLegend(),

            ],
          ),
        ),
      ),
    );
  }

  // List<PieChartSectionData> _buildPieChartSections() {
  //   return [
  //     PieChartSectionData(
  //       color: Colors.blue,
  //       value: 94,
  //       title: '94.0%',
  //       radius: 50,
  //       titleStyle: TextStyle(
  //         fontSize: 16,
  //         fontWeight: FontWeight.bold,
  //         color: Colors.white,
  //       ),
  //     ),
  //     PieChartSectionData(
  //       color: Colors.green,
  //       value: 5,
  //       title: '5.0%',
  //       radius: 50,
  //       titleStyle: TextStyle(
  //         fontSize: 16,
  //         fontWeight: FontWeight.bold,
  //         color: Colors.white,
  //       ),
  //     ),
  //     PieChartSectionData(
  //       color: Colors.orange,
  //       value: 1,
  //       title: '',
  //       radius: 50,
  //     ),
  //     PieChartSectionData(
  //       color: Colors.red,
  //       value: 0.5,
  //       title: '',
  //       radius: 50,
  //     ),
  //   ];
  // }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem(Colors.blue, 'Agriculture'),
        _buildLegendItem(Colors.green, 'Forest Land'),
        _buildLegendItem(Colors.orange, 'Waste Land'),
        _buildLegendItem(Colors.red, 'PGR/VGR'),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        SizedBox(width: 4),
        Text(text),
        SizedBox(width: 16),
      ],
    );
  }
}
  Widget _buildDropdown(String label, String? selectedValue, List<String> items, ValueChanged<String?> onChanged) {
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
              value: selectedValue,
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

  Widget _buildDataTable(List<DataRow> rows) {
    return DataTable(
      columns: const [
        DataColumn(
          label: Text(
            'Farmer Category',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Total Registered',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
      rows: rows,
    );
  }

  DataRow _buildDataRow(String category, String total) {
    return DataRow(
      cells: [
        DataCell(Text(category)),
        DataCell(Text(total)),
      ],
    );
  }

  DataRow _buildDataRowWithUnits(String category, String totalFarmers, String bighas, String hectares) {
    return DataRow(
      cells: [
        DataCell(Text(category)),
        DataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Farmers: $totalFarmers'),
              Text('Bighas: $bighas'),
              // Text('Hectares: $hectares'),
            ],
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
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

