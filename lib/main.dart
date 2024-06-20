import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Information',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _ngayCapController = TextEditingController();
  final TextEditingController _ngayCapCCCDController = TextEditingController();
  final TextEditingController _ngayKetNapController = TextEditingController();
  String _selectedDoanThe = 'Đoàn viên';
  bool _showFamilyInfo = false;

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Học kỳ 2 - 2023-2024'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phần đầu bên trái
            Card(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Phạm Văn Tuấn',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text('NGÀNH CHUYÊN NGÀNH KỸ THUẬT PHẦN MỀM (KỸ SƯ)'),
                  const Text('LỚP 20SE4 MSV 20IT344'),
                  const SizedBox(height: 20),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Thông tin cá nhân'),
                    onTap: () {
                      setState(() {
                        _showFamilyInfo = false;
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Thông tin gia đình'),
                    onTap: () {
                      setState(() {
                        _showFamilyInfo = true;
                      });
                    },
                  ),
                  const ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text('Địa chỉ và thường trú'),
                    // onTap: () {
                    //   setState(() {
                    //     _showFamilyInfo = false;
                    //   });
                    // },
                  ),
                  const ListTile(
                    leading: Icon(Icons.contact_phone),
                    title: Text('Thông tin liên hệ'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Phần thông tin cá nhân bên phải
            _showFamilyInfo
                ? _buildFamilyInfoCard()
                : _buildPersonalInfoCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInfoCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Thông tin cá nhân',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildResponsiveRow(
              context,
              children: [
                _buildTextField(
                    label: 'Họ và tên',
                    initialValue: 'Phạm Văn Tuấn',
                    enabled: false),
                _buildTextField(
                    label: 'Giới tính',
                    initialValue: 'Nam',
                    enabled: false),
                _buildTextField(
                    label: 'Ngày sinh',
                    initialValue: '20-02-2002',
                    enabled: false),
              ],
            ),
            _buildResponsiveRow(
              context,
              children: [
                _buildTextField(
                    label: 'Nơi sinh',
                    initialValue: 'Quảng Nam',
                    enabled: false),
                _buildTextField(
                    label: 'Dân tộc',
                    initialValue: 'Kinh',
                    enabled: false),
              ],
            ),
            _buildResponsiveRow(
              context,
              children: [
                _buildTextField(
                    label: 'CMND',
                    initialValue: '206379271',
                    enabled: false),
                _buildDateField(context,
                    label: 'Ngày cấp', controller: _ngayCapController),
              ],
            ),
            _buildTextField(label: 'Nơi cấp', initialValue: 'Quảng Nam'),
            _buildResponsiveRow(
              context,
              children: [
                _buildTextField(
                    label: 'CCCD',
                    initialValue: '049202013298',
                    enabled: false),
                _buildDateField(context,
                    label: 'Ngày cấp CCCD',
                    controller: _ngayCapCCCDController),
              ],
            ),
            _buildTextField(
                label: 'Nơi cấp CCCD',
                initialValue:
                'Cục Cảnh sát quản lý hành chính về trật tự xã hội'),
            _buildResponsiveRow(
              context,
              children: [
                _buildDropdownField(label: 'Đoàn thể'),
                _buildDateField(context,
                    label: 'Ngày kết nạp', controller: _ngayKetNapController),
                _buildTextField(label: 'Tôn giáo', initialValue: 'Không'),
              ],
            ),
            _buildResponsiveRow(
              context,
              children: [
                Expanded(
                  flex: 3,
                  child: _buildTextField(
                    label: 'Thuộc diện chính sách',
                    initialValue: 'Con liệt sĩ/thương bệnh binh',
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: _buildTextField(
                    label: 'Mã số bảo hiểm y tế',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Lưu'),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sinh viên liên hệ phòng công tác sinh viên hoặc 0236 3667 129 nếu có thay đổi chi tiết thông tin cá nhân (Áp dụng với các trường thông tin bị làm mờ)',
              style: TextStyle(color: Colors.blue),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFamilyInfoCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Thông tin gia đình',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildResponsiveRow(
              context,
              children: [
                _buildFamilyMemberInfo(
                  labelPrefix: '|Cha',
                  name: 'Phạm Văn Dũng',
                  yearOfBirth: '1968',
                  ethnicity: 'Kinh',
                  idNumber: '049060801712',
                  occupation: 'Nông',
                  residence: 'Phú Đông, Đại Hiệp, Đại Lộc, Quảng Nam',
                  workplace: '',
                  educationLevel: '',
                  email: '',
                  phoneNumber: '0379965269',
                ),
                _buildFamilyMemberInfo(
                  labelPrefix: '|Mẹ',
                  name: 'Trần Thị Thanh Xuân',
                  yearOfBirth: '1977',
                  ethnicity: 'Kinh',
                  idNumber: '04817700475',
                  occupation: 'Nông',
                  residence: 'Phú Đông, Đại Hiệp, Đại Lộc, Quảng Nam',
                  workplace: '',
                  educationLevel: '',
                  email: '',
                  phoneNumber: '0384902993',
                ),
              ],
            ),
            const Text('|Anh chị ruột',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildTextField(label: 'Anh chị em'),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Lưu'),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sinh viên liên hệ phòng công tác sinh viên hoặc 0236 3667 129 nếu có thay đổi chi tiết thông tin cá nhân (Áp dụng với các trường thông tin bị làm mờ)',
              style: TextStyle(color: Colors.blue),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String label, String? initialValue, bool enabled = true}) {
    return MouseRegion(
      cursor: enabled ? SystemMouseCursors.text : SystemMouseCursors.forbidden,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextFormField(
          initialValue: initialValue,
          enabled: enabled,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  Widget _buildDateField(BuildContext context,
      {required String label, required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () => _selectDate(context, controller),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
          child: Text(controller.text.isEmpty ? 'mm/dd/yyyy' : controller.text),
        ),
      ),
    );
  }

  Widget _buildDropdownField({required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: _selectedDoanThe,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        onChanged: (String? newValue) {
          setState(() {
            _selectedDoanThe = newValue!;
          });
        },
        items: <String>['Đoàn viên', 'Đảng viên', 'Không']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDropdownFieldFamily({required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        onChanged: (String? newValue) {
          setState(() {
            // Handle the new value if needed
          });
        },
        items: <String>['Cao đẳng', 'Đại học', 'Sau đại học', 'Khác']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildResponsiveRow(BuildContext context,
      {required List<Widget> children}) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children.map((child) => Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: child,
        )).toList(),
      );
    } else {
      return Row(
        children: children.map((child) => Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: child,
          ),
        )).toList(),
      );
    }
  }

  Widget _buildFamilyMemberInfo({
    required String labelPrefix,
    required String name,
    required String yearOfBirth,
    required String ethnicity,
    required String idNumber,
    required String occupation,
    required String residence,
    required String workplace,
    required String educationLevel,
    required String email,
    required String phoneNumber,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelPrefix,
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildTextField(label: 'Họ tên', initialValue: name),
          _buildTextField(label: 'Năm sinh', initialValue: yearOfBirth),
          _buildTextField(label: 'Dân tộc', initialValue: ethnicity),
          _buildTextField(label: 'CMND/CCCD', initialValue: idNumber),
          _buildTextField(label: 'Nghề nghiệp', initialValue: occupation),
          _buildTextField(label: 'Nơi cư trú', initialValue: residence),
          _buildTextField(label: 'Cơ quan công tác', initialValue: workplace),
          _buildDropdownFieldFamily(label: 'Trình độ'),
          _buildTextField(label: 'Email', initialValue: email),
          _buildTextField(label: 'SDT', initialValue: phoneNumber),
        ],
      ),
    );
  }
}
