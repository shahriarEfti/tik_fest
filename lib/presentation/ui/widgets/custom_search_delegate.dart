
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  CustomSearchDelegate({
    required String hintText,
  }) : super(
    searchFieldLabel: hintText,
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.search,
  );

  final List<String> _suggestions = [
    'Dhaka',
    'BPL Concert 2025',
    'February Concert',
    'Movie Promotion Event',
    'Holiday',
    'Rock Music ',
    'Tahsan Concert',
  ];

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, ''),
    );
  }

  @override
  PreferredSizeWidget buildBottom(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56.0),
      child: Container(
        color: Colors.grey.shade200,
        child: Center(
          child: Text(
            'Search for location, ticket, or upcoming event',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final queryText = query.toLowerCase();
    final filteredSuggestions = _suggestions
        .where((suggestion) =>
        suggestion.toLowerCase().contains(queryText))
        .toList();

    return ListView.builder(
      itemCount: filteredSuggestions.length,
      itemBuilder: (context, index) {
        final suggestion = filteredSuggestions[index];

        return ListTile(
          leading: const Icon(Icons.search),
          title: Text(
            suggestion,
            style: const TextStyle(fontSize: 16.0),
          ),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text(
          'Enter a search term to see results',
          style: TextStyle(fontSize: 18.0),
        ),
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_outline,
            size: 80.0,
            color: Colors.green,
          ),
          const SizedBox(height: 16.0),
          Text(
            'You searched for: "$query"',
            style: const TextStyle(fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
    ];
  }
}