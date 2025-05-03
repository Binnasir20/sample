import 'package:flutter/material.dart';

class ListLink extends StatefulWidget {
  const ListLink({super.key});

  @override
  State<ListLink> createState() => _ListLinkState();
}

class _ListLinkState extends State<ListLink> {
  final List<String> myContainers = [
    'assets/myImages/apple.png',
    'assets/myImages/google.png',
  ];
  final List<String> myText = ['Apple', 'Google'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: myContainers.asMap().entries.map((entry) {
        int index = entry.key;
        String imagePath = entry.value;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: InkWell(
            onTap: () {
              print("Tapped on: ${myText[index]}");
            },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  color: Colors.white, // Black for Apple
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      imagePath,
                      height: 30,
                      color: index == 0 ? Colors.black : null,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      myText[index],
                      style: TextStyle(
                        fontSize: 15,
                        color:Colors.black, // White text for Apple, Black for Google
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
          ),
        );
      }).toList(),
    );
  }
}
