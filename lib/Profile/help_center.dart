import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/Appointment/appointment_screen.dart';
import 'profile.dart';
import 'package:healthcare/Record/record_password.dart';
import 'package:healthcare/mainscreen/booking.dart';
import 'package:healthcare/mainscreen/newfeed.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  int _selectedIndex = 4; // Track selected tab index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false, // This removes all previous routes
      );
    } else if (index == 1) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BookingPage()),
        (route) => false, // This removes all previous routes
      );
    } else if (index == 3) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => RecordPassword()),
        (route) => false, // This removes all previous routes
      );
    } else if (index == 2) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => AppointmentScreen()),
        (route) => false, // This removes all previous routes
      );
    } else if (index == 4) {
      // Profile screen
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
        (route) => false, // This removes all previous routes
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> faqs = [
    {
      "question": "How do I update my personal information?",
      "answer":
          "Go to 'Profile' > 'Edit Profile,' make your changes, and save.",
    },
    {
      "question": "How do I change my password?",
      "answer": "Go to Settings > Change Password.",
    },
    {
      "question": "How do I book an appointment with a doctor?",
      "answer":
          "Go to 'Booking' > Select a Doctor > Choose a Date & Time > Confirm.",
    },
    {
      "question": "Can I access my medical records?",
      "answer": "Yes, go to 'Records' in the menu.",
    },
    {
      "question": "I am not receiving notifications. How do I fix it?",
      "answer":
          "Check your notification settings in the app and enable notifications.",
    },
  ];
  List<Map<String, String>> filteredFaqs = [];

  @override
  void initState() {
    super.initState();
    filteredFaqs = faqs;
    _searchController.addListener(_filterFaqs);
  }

  void _filterFaqs() {
    setState(() {
      String query = _searchController.text.toLowerCase();
      filteredFaqs =
          faqs
              .where((faq) => faq["question"]!.toLowerCase().contains(query))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //     leading: IconButton(
      //                icon: Icon(Icons.arrow_back_ios),
      //                color: Colors.white,
      //                onPressed: () {
      //                   Navigator.pop(context);
      //                 },
      //                   ),
      //     title: Center(child: Text("Help center",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
      //     backgroundColor: Color.fromARGB(255, 50, 105, 201),

      //   ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 118, 198),
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        title: Text(
          "Jeon Jungkook",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "How Can I Help You?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredFaqs.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ExpansionTile(
                      title: Text(
                        filteredFaqs[index]["question"]!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(filteredFaqs[index]["answer"]!),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 12), // Adjust text size
        unselectedLabelStyle: TextStyle(
          fontSize: 10,
        ), // Ensures all icons are shown
        currentIndex: _selectedIndex, // Active tab index
        selectedItemColor: Colors.blue, // Color of selected item
        unselectedItemColor: Colors.grey, // Color of unselected items
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_sharp),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_outlined),
            label: 'Record',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
