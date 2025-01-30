import 'dart:convert';
import 'package:clip_cuts/src/features/sign_in_screen/presentation/sign_in_scren.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> petsData = [];
  List<dynamic> filteredPets = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadPetsData();
  }

  Future<void> loadPetsData() async {
    String jsonString = await rootBundle.loadString('assets/json/pets.json');
    List<dynamic> data = json.decode(jsonString);
    setState(() {
      petsData = data;
      filteredPets = data;
    });
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredPets = petsData;
      });
      return;
    }
    setState(() {
      filteredPets = petsData.where((pet) {
        return pet['name'].toLowerCase().contains(query.toLowerCase()) ||
            pet['id'].toString().contains(query);
      }).toList();
    });
  }

  void _showLogoutModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: const Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(MediaQuery.of(context).size.width * 0.05),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Are you sure you want to log out?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xff100f0f),
                  fontSize: MediaQuery.of(context).size.height * 0.0325,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.withOpacity(
                        0.2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01,
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          color: const Color(0xff004961),
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff004961),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01,
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Text(
                        "No",
                        style: TextStyle(
                          color: const Color(0xffffffff),
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0xff00B4BF),
                borderRadius: BorderRadius.only(
                  bottomLeft:
                      Radius.circular(MediaQuery.of(context).size.width * 0.15),
                  bottomRight:
                      Radius.circular(MediaQuery.of(context).size.width * 0.15),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.025),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/images/img_profile.png',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.175,
                            height: MediaQuery.of(context).size.width * 0.175,
                          ),
                        ),
                        Text(
                          "ClipCuts",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.075,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Pattaya',
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.logout_outlined,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.075,
                          ),
                          onPressed: () {
                            _showLogoutModal(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * 0.025,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: filterSearchResults,
                  decoration: InputDecoration(
                    hintText: "Search by Name or Pet ID",
                    hintStyle: TextStyle(
                      color: const Color(0xffbfbfbf),
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                    suffixIcon: Icon(
                      Icons.search_rounded,
                      color: const Color(0xffbfbfbf),
                      size: MediaQuery.of(context).size.height * 0.03,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.025,
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredPets.length,
                itemBuilder: (context, index) {
                  var pet = filteredPets[index];

                  return Container(
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.02),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.025),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/images/img_pet.png",
                                width: MediaQuery.of(context).size.width * 0.1,
                                height: MediaQuery.of(context).size.width * 0.1,
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.025),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pet['name'],
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.017,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff545454),
                                    ),
                                  ),
                                  Text(
                                    "ID: ${pet['id']}",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015,
                                      color: const Color(0xff888888),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.025),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffDEE5FF),
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.height *
                                          0.025),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.width *
                                            0.01,
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.02,
                                  ),
                                  child: Text(
                                    pet['gender'],
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015,
                                      color: const Color(0xff6B8CFF),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(color: Color(0xffe0e0e0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mating Date",
                                    style: TextStyle(
                                      color: const Color(0xff999999),
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    pet['mating_date'],
                                    style: TextStyle(
                                      color: const Color(0xff545454),
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Breeding Partner",
                                    style: TextStyle(
                                      color: const Color(0xff999999),
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    pet['breeding_partner'],
                                    style: TextStyle(
                                      color: const Color(0xff545454),
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pregnancy",
                                    style: TextStyle(
                                      color: const Color(0xff999999),
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    pet['pregnancy'],
                                    style: TextStyle(
                                      color: const Color(0xff545454),
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.015,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
