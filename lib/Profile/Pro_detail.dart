import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/Appointment/appointment_screen.dart';
import 'profile.dart';
import 'package:healthcare/Record/record_password.dart';
import 'package:healthcare/mainscreen/booking.dart';
import 'package:healthcare/mainscreen/newfeed.dart';

class Pro_detail extends StatefulWidget {
  const Pro_detail({super.key});

  @override
  State<Pro_detail> createState() => _ProfileState();
}

class _ProfileState extends State<Pro_detail> {
  int _selectedIndex = 4; // Track selected tab index
  final TextEditingController __controller1 = TextEditingController(
    text: "Jeon Jungkook",
  );
  final TextEditingController __controller2 = TextEditingController(
    text: "+855 123 456 78",
  );
  final TextEditingController __controller3 = TextEditingController(
    text: "JungkookJeon@gmail.com",
  );
  final TextEditingController __controller4 = TextEditingController(
    text: "09-01-1997",
  );

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
        MaterialPageRoute(builder: (context) => const RecordPassword()),
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

  @override
  Widget build(BuildContext context) {
    return
    // debugShowCheckedModeBanner: false,
    Scaffold(
      // appBar: AppBar(

      // leading: IconButton(
      //              icon: Icon(Icons.arrow_back_ios),
      //              color: Colors.white,
      //              onPressed: () {
      //                 Navigator.pop(context);
      //               },
      //                 ),
      //   title: Center(child: Text("Jeon Jungkook",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
      //   backgroundColor: Color.fromARGB(255, 50, 105, 201),
      // ),
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
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 120,
                    width:
                        double
                            .infinity, // Ensures it takes full width if necessary
                    child: Image.asset(
                      "images/cat1.png",
                      fit:
                          BoxFit
                              .cover, // Makes the image fill the SizedBox completely
                    ),
                  ),
                  Container(height: 80),
                ],
              ),
              Positioned(
                top: 60,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  // child: CircleAvatar(
                  //   radius: 48,
                  backgroundImage: AssetImage("images/profile.png"),
                  // ),
                ),
              ),
            ],
          ),

          // SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      controller: __controller1,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        // labelText: "Full Name",
                        filled: true,
                        fillColor: Colors.blue[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Phone Number",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      controller: __controller2,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        // labelText: "Full Name",
                        filled: true,
                        fillColor: Colors.blue[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Email",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      controller: __controller3,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        // labelText: "Full Name",
                        filled: true,
                        fillColor: Colors.blue[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Date of Birth",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      controller: __controller4,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        // labelText: "Full Name",
                        filled: true,
                        fillColor: Colors.blue[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      // width: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 50, 105, 201),
                        ),
                        child: Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
