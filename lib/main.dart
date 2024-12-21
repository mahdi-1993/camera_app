import 'package:flutter/material.dart';

void main() {
  runApp(MegaMenuApp());
}

class MegaMenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mega Menu Example'),
          backgroundColor: Colors.amber[600],
        ),
        body: Center(child: MegaMenuWidget()),
      ),
    );
  }
}

class MegaMenuWidget extends StatefulWidget {
  @override
  _MegaMenuWidgetState createState() => _MegaMenuWidgetState();
}

class _MegaMenuWidgetState extends State<MegaMenuWidget> {
  bool _showMegaMenu = false;

  // Example menu structure
  final Map<String, List<String>> menuItems = {
    "طلا زنانه": ["گردنبند", "طوق", "دستبند", "النگو", "انگشتر"],
    "طلا مردانه": ["دستبند", "انگشتر", "پلاک طلای مردانه"],
    "برند طلا": ["فلایمیگو", "البرنادو", "ورساچی"],
    "طلا کودک": ["سنچاق طلا", "انگشتر بچگانه", "گوشواره بچگانه"],
    "محصولات دیگر": ["حلقه نامزدی", "ست حلقه ازدواج"],
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Menu Bar
        GestureDetector(
          onTap: () {
            setState(() {
              _showMegaMenu = !_showMegaMenu; // Toggle menu on mobile tap
            });
          },
          child: MouseRegion(
            onEnter: (_) {
              setState(() {
                _showMegaMenu = true;
              });
            },
            onExit: (_) {
              setState(() {
                _showMegaMenu = false;
              });
            },
            child: Column(
              children: [
                Container(
                  color: Colors.amber[700],
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'دسته بندی محصولات',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Icon(
                        _showMegaMenu
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                if (_showMegaMenu)
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: menuItems.entries.map((entry) {
                          return Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  entry.key,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.amber[800],
                                  ),
                                ),
                                SizedBox(height: 8),
                                ...entry.value.map((item) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 4),
                                    child: Text(
                                      item,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        // Mega Menu Content

        Text('dddd')
      ],
    );
  }
}
