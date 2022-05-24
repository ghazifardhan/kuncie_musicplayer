import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {

  final Function(String value) onChanged;
  final Function(String value) onSubmitted;

  const SearchBarWidget({ 
    Key? key,
    required this.onChanged,
    required this.onSubmitted
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(
          vertical: 7.0, horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: const Color(0xff1F1A43),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.search,
              color: Color(0xff8A6EFF),
            ),
          ),
          Expanded(
            child: TextField(
              maxLines: 1,
              onChanged: onChanged,
              style: const TextStyle(
                fontSize: 14.0,
                color: Color(0xff857EB2)
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: onSubmitted,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for new music...',
                hintStyle: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xff857EB2)
                )),
            ),
          ),
        ],
      ),
    );
  }
}