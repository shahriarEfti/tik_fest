import 'package:flutter/material.dart';
import '../widgets/profile_card.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Map<String, dynamic>> profileOptions = [
    {'icon': Icons.person, 'title': 'Profile'},
    {'icon': Icons.lock, 'title': 'Password'},
    {'icon': Icons.credit_card, 'title': 'My Cards'},
    {'icon': Icons.language, 'title': 'Language'},
    {'icon': Icons.settings, 'title': 'Settings'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_outlined),
        centerTitle: true,
        title: Text('My Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.redAccent,
                backgroundImage: AssetImage('assets/images/nurullah.jpg'),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Mohammad Nurullah",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "mohammadnurullah123@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, index) {
                  return ProfileCard(
                    icon: profileOptions[index]['icon'],
                    title: profileOptions[index]['title'],
                  );
                },
                separatorBuilder: (_, __) => SizedBox(height: 10),
                itemCount: profileOptions.length,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set the button background color
                foregroundColor: Colors.white, // Set the text and icon color
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Adjust padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),
              
                
                onPressed: (){},
                

                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Logout'),

                      SizedBox(width: 8),
                      Icon(Icons.logout,color: Colors.white,),

                    ],
                  ),
                )),

          ],
        ),
      ),
    );
  }
}
