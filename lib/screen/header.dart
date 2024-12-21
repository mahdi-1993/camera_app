import 'package:flutter/material.dart';

class MegaMenu extends StatefulWidget {
  @override
  _MegaMenuState createState() => _MegaMenuState();
}

class _MegaMenuState extends State<MegaMenu> {
  String _hoveredCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildCategory('Category 1',
              ['Subcategory 1.1', 'Subcategory 1.2', 'Subcategory 1.3']),
          _buildCategory('Category 2',
              ['Subcategory 2.1', 'Subcategory 2.2', 'Subcategory 2.3']),
          _buildCategory('Category 3',
              ['Subcategory 3.1', 'Subcategory 3.2', 'Subcategory 3.3']),
        ],
      ),
    );
  }

  Widget _buildCategory(String title, List<String> subcategories) {
    return MouseRegion(
      onEnter: (_) => _toggleHover(title),
      onExit: (_) => _toggleHover(''),
      child: ExpansionTile(
        key: PageStorageKey<String>(title), // Ensure the state is preserved
        title: Text(title),
        initiallyExpanded: _hoveredCategory == title,
        children: subcategories
            .map((subcategory) => ListTile(title: Text(subcategory)))
            .toList(),
      ),
    );
  }

  void _toggleHover(String category) {
    setState(() {
      _hoveredCategory = category;
    });
  }
}
