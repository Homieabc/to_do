import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
            fillColor: Colors.black,
            contentPadding: EdgeInsets.all(13),
            prefixIcon: Icon(
              Icons.search_rounded,
              size: 25,
              color: Colors.black,
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Colors.black,
            )),
      ),
    );
  }
}
