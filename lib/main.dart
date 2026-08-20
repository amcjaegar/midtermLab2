import 'package:flutter/material.dart';

void main() {
  runApp(const StudentProfileApp());
}
 
class StudentProfileApp extends StatelessWidget {
  const StudentProfileApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF3F4F8),
      ),
      home: const ProfilePage(),
    );
  }
}
 
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
 
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _endorsements = 0;
  bool _showFullBio = false;


  //--sample student data----
  final String fullName ='Goddessee D. Pretty';
  final String nickname = 'Dy';
  final String age = '24 Years Old';
  final String birthday ='December 17, 2002';
  final String address='Around Somewhere sa Bakilid';
  final String hobby='playing Guitar';
  final String motto='Small steps everyday lead to big results';
  final String course ='BS Information Technology';
  final String yearLevel =' 3rd Year';
  final String section='BSIT 3-A';
//--Image from Google ------------
  final String profileImageUrl='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqDV5fttCcJCO2AthnhxAyQXchVG1MoRrXo3wh03xiBw&s=10';
  final String bannerImageUrl='https://cdn.vectorstock.com/i/500p/76/65/student-engagement-banner-vector-64827665.jpg';
  
  void _addEndorsement() {
    setState(() => _endorsements++);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Thanks for the endorsement! Total: $_endorsements'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

void _showContactDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Contact Information'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ListTile(
              leading: Icon(Icons.email, color: Colors.indigo),
              title: Text('LumpiangShanghai@gmail.com'),
              contentPadding: EdgeInsets.zero,
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.indigo),
              title: Text('+63 922 251 100'),
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            tooltip: 'Endorse',
            onPressed: _addEndorsement,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildActionRow(),
                  const SizedBox(height: 16),
                  _buildPersonalInfoCard(),
                  const SizedBox(height: 16),
                  _buildAcademicInfoCard(),
                  const SizedBox(height: 16),
                  _buildMottoCard(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo, Colors.indigoAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Decorative banner Image widget with graceful fallback
          Opacity(
            opacity: 0.25,
            child: Image.network(
              bannerImageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 180,
                color: Colors.indigo.shade300,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 51,
                    backgroundImage: NetworkImage(profileImageUrl),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  fullName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '"$nickname"  •  $course',
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
 
  // ---------------- ACTION ROW (Row + ElevatedButton + TextButton) ----------------
  Widget _buildActionRow() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: _showContactDialog,
            icon: const Icon(Icons.contact_mail),
            label: const Text('Contact Me'),
          ),
        ), 
        const SizedBox(width: 12),
        Expanded(
          child: TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.indigo,
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: Colors.indigo),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => setState(() => _showFullBio = !_showFullBio),
            icon: Icon(_showFullBio ? Icons.expand_less : Icons.expand_more),
            label: Text(_showFullBio ? 'Show Less' : 'Show More'),
          ),
        ),
      ],
    );
  }
 
  // ---------------- PERSONAL INFORMATION CARD ----------------
  Widget _buildPersonalInfoCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: Text(
                'Personal Information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(thickness: 1, indent: 16, endIndent: 16),
            _infoTile(Icons.badge, 'Nickname', nickname),
            _infoTile(Icons.cake, 'Age', age),
            _infoTile(Icons.calendar_today, 'Birthday', birthday),
            _infoTile(Icons.home, 'Address', address),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 250),
              crossFadeState: _showFullBio
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Column(
                children: [
                  _infoTile(Icons.sports_esports, 'Hobby', hobby),
                  _infoTile(Icons.school, 'Course/Program', course),
                  _infoTile(Icons.stairs, 'Year Level', yearLevel),
                  _infoTile(Icons.groups, 'Section', section),
                ],
              ),
              secondChild: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
 
  // ---------------- ACADEMIC INFORMATION CARD ----------------
  Widget _buildAcademicInfoCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: Text(
                'Academic Information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(thickness: 1, indent: 16, endIndent: 16),
            _infoTile(Icons.star, 'Favorite Subject', 'Mobile App Development'),
            _infoTile(Icons.code, 'Programming Language', 'Dart & Flutter'),
            _infoTile(Icons.build, 'Technical Skill', 'UI/UX Design & Prototyping'),
            _infoTile(Icons.flag, 'Career Goal', 'Full-Stack Software Developer'),
          ],
        ),
      ),
    );
  }
 
  // ---------------- MOTTO / QUOTE CARD ----------------
  Widget _buildMottoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.indigo.shade100),
      ),
      child: Row(
        children: [
          const Icon(Icons.format_quote, color: Colors.indigo, size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              motto,
              style: const TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: Colors.indigo,
              ),
            ),
          ),
        ],
      ),
    );
  }
 
  // ---------------- REUSABLE INFO ROW (ListTile + Icon) ----------------
  Widget _infoTile(IconData icon, String label, String value) {
    return ListTile(
      dense: true,
      leading: Icon(icon, color: Colors.indigo),
      title: Text(
        label,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    );
  }
}
