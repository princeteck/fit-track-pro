import 'package:flutter/material.dart';

import 'prelude/prelude.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  static const String name = 'dashboard';
  static const String path = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Dashboard Screen',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 20),
              Text(
                'This is the dashboard screen where you can see your stats and activities.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
