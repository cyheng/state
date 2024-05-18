
import 'package:flutter/material.dart';

class UIPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('信息布局'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: _buildSection('患者信息', [
                      _buildRow('姓名',
                          'PatientLastnameQTP-41cf5a142aPatientNameQTP-41cf5a142a',
                          isLink: true),
                      _buildRow('出生日期', '1980年3月4日'),
                      _buildRow('邮箱', 'patientqtp-41cf5a142a@bioserenity.com'),
                    ])),
                SizedBox(width: 16),
                Expanded(
                    child: _buildSection('采集任务配置', [
                      _buildRow('采集任务创建日期', '2024年5月15日星期三中午12点00分'),
                      _buildRow('持续时间', '5 分钟'),
                      _buildRow('采集模式', '250 Hz'),
                      _buildRow('上传模式', '离线模式（非持续推流）'),
                    ])),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: _buildSection('采集任务创建人', [
                      _buildRow('姓名',
                          'DoctorLastnameQTP-d6d394e855DoctorNameQTP-d6d394e855 医生'),
                      _buildRow('邮箱', 'doctorqtp+d6d394e855@bioserenity.com'),
                    ])),
                SizedBox(width: 16),
                Expanded(
                    child: _buildSection('采集任务信息', [
                      _buildRow('患者编号', '10999'),
                      _buildRow('采集任务编号', '12912'),
                      _buildRow('记录器序列号', 'WEMU120QTP1 Neuronaute Pro',
                          isLink: true),
                    ])),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> rows) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange),
          ),
          SizedBox(height: 8),
          ...rows,
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isLink = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 8),
          Expanded(
            child: isLink
                ? GestureDetector(
              onTap: () {
                // Handle link tap
              },
              child: Text(
                value,
                style: TextStyle(color: Colors.blue),
              ),
            )
                : Text(value),
          ),
        ],
      ),
    );
  }
}
