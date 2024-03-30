import 'package:flutter/material.dart';

class StateSelectionDrawer extends StatelessWidget {
  const StateSelectionDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 212, 200, 89),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Select State',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Andhra Pradesh'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Arunachal Pradesh'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Assam'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Bihar'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Chhattisgarh'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Goa'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Gujrat'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Haryana'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Himachal Pradesh'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Jharkhand'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Karnataka'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Keral'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Madhya Pradesh'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Maharashtra'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Manipur'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Meghalaya'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Mizoram'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Nagaland'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Odisha'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Punjab'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Rajasthan'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Sikkim'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Tamil Nadu'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Telangana'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Tripura'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Uttar Pradesh'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Uttarakhand'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('West Bengal'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  const Text(
                    'Union territories in India',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    title: const Text('Andaman and Nicobar Islands'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Chandigarh'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title:
                        const Text('Dadra and Nagar Haveli and Daman and Diu'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Lakshadweep'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text(
                        'Delhi (National Capital Territory of Delhi)'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                  ListTile(
                    title: const Text('Puducherry'),
                    onTap: () {
                      Navigator.of(context)
                          .pop(); // Close the modal bottom sheet
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
