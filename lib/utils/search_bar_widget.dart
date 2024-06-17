import 'package:flutter/material.dart';
import 'package:kinetic_kanvas/main.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(26))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(26))),
          hintText: '  Find a course you want ...',
          hintStyle: const TextStyle(color: Colors.white),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _searchQuery = _controller.text;
                // Do something with the search query
                print('Searched for: $_searchQuery');
              });
            },
          ),
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(26)),
        border: Border.all(width: 2.0, color: Colors.white),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(Icons.search, color: Colors.white),
              ),
              Text(
                'Find a course you want..',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(6.0),
            child: Icon(Icons.filter_alt_outlined, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
