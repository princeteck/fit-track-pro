import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/bottom_navbar/bottom_navbar_cubit.dart';
import '../../../core/di/di.dart';
import 'prelude/prelude.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  static const String name = 'dashboard';
  static const String path = '/dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _setupControllers();

    locator<BottomNavbarCubit>().reset();
  }

  void _setupControllers() {
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onTabChanged(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBarWidget(
        scrollController: _scrollController,
        onTabChanged: _onTabChanged,
      ),
      body: SafeArea(
        child: BlocBuilder<BottomNavbarCubit, BottomNavbarState>(
          bloc: locator<BottomNavbarCubit>(),
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: _buildCurrentSection(state.selectedIndex),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCurrentSection(int index) {
    return Container(
      key: ValueKey(index),
      child: DashboardSectionManager.getSectionByIndex(index),
    );
  }
}
