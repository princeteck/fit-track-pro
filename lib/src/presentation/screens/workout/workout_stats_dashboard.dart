import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/di.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../data/services/workout_api_service.dart';
import '../../../data/repositories/workout_session_repository.dart';
import '../../controllers/workout/workout_cubit.dart';
import '../../widgets/custom_painters/workout_chart_painter.dart';
import '../../widgets/workout_session/workout_session_details_bottom_sheet.dart';
import 'workout_detail_screen.dart';
import 'all_workouts_screen.dart';

class WorkoutStatsDashboard extends StatefulWidget {
  const WorkoutStatsDashboard({super.key});
  static const String name = 'workout-stats-dashboard';
  static const String path = '/workout-stats-dashboard';

  @override
  State<WorkoutStatsDashboard> createState() => _WorkoutStatsDashboardState();
}

class _WorkoutStatsDashboardState extends State<WorkoutStatsDashboard>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late final WorkoutCubit _cubit;
  late AnimationController _refreshController;
  late AnimationController _fabController;
  late AnimationController _statsAnimationController;
  late AnimationController _chartAnimationController;
  late AnimationController _staggeredController;

  late Animation<double> _statsAnimation;
  late Animation<double> _chartAnimation;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _cubit = locator<WorkoutCubit>();
    _setupAnimations();
    _startInitialAnimations();

    WidgetsBinding.instance.addObserver(this);

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted && !_cubit.isClosed) {
        _cubit.loadStats();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (mounted && !_cubit.isClosed) {
      debugPrint(
        '🔄 [WorkoutStatsDashboard] didChangeDependencies - refreshing stats',
      );
      _cubit.refreshStats();
    }
  }

  void _setupAnimations() {
    _refreshController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fabController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _statsAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _chartAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _staggeredController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _statsAnimation = CurvedAnimation(
      parent: _statsAnimationController,
      curve: Curves.easeOutCubic,
    );

    _chartAnimation = CurvedAnimation(
      parent: _chartAnimationController,
      curve: Curves.easeInOutCubic,
    );
  }

  void _startInitialAnimations() {
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        _staggeredController.forward();
        _statsAnimationController.forward();
      }
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _chartAnimationController.forward();
      }
    });
  }

  Future<void> _onRefresh() async {
    _refreshController.forward();
    await Future.delayed(const Duration(milliseconds: 800));
    _refreshController.reset();

    if (mounted && !_cubit.isClosed) {
      _cubit.refreshStats();
    }
  }

  void _clearAllData() {
    _cubit.clearAllData();
  }

  void _checkDatabaseIntegrity() {
    _cubit.checkDatabaseIntegrity();
  }

  void _forceRefreshStats() {
    debugPrint('🚀 [WorkoutStatsDashboard] Force refresh triggered manually');
    _cubit.forceRefreshStats();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    _refreshController.dispose();
    _fabController.dispose();
    _statsAnimationController.dispose();
    _chartAnimationController.dispose();
    _staggeredController.dispose();

    if (!_cubit.isClosed) {
      _cubit.close();
    }

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed && mounted && !_cubit.isClosed) {
      debugPrint('🔄 [WorkoutStatsDashboard] App resumed - refreshing stats');
      _cubit.forceRefreshStats();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _onRefresh,
        color: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            if (context.canPop()) _buildAppBar(),
            _buildChart(),
            _buildStatsCards(),
            _buildWorkoutPlans(),
            _buildRecentWorkouts(),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return SliverAppBar(
      floating: true,
      pinned: true,
      elevation: 0,
      backgroundColor: isDarkMode ? theme.colorScheme.surface : Colors.grey[50],
      title: AnimatedBuilder(
        animation: _staggeredController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, (1 - _staggeredController.value) * 50),
            child: Opacity(
              opacity: _staggeredController.value,
              child: Text(
                context.l10n?.workoutStatsTitle ?? 'Workout Stats',
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: theme.colorScheme.onSurface),
      actions: [
        AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            return Transform.scale(
              scale: _staggeredController.value,
              child: PopupMenuButton<String>(
                onSelected: (value) {
                  switch (value) {
                    case 'clear_data':
                      _clearAllData();
                      break;
                    case 'check_db':
                      _checkDatabaseIntegrity();
                      break;
                    case 'force_refresh':
                      _forceRefreshStats();
                      break;
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'force_refresh',
                    child: Text('Force Refresh'),
                  ),
                  PopupMenuItem(
                    value: 'clear_data',
                    child: Text(context.l10n?.clearData ?? 'Clear Data'),
                  ),
                  PopupMenuItem(
                    value: 'check_db',
                    child: Text(
                      context.l10n?.checkDatabase ?? 'Check Database',
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildStatsCards() {
    return SliverToBoxAdapter(
      child: StreamBuilder<WorkoutState>(
        stream: _cubit.stream,
        initialData: _cubit.state,
        builder: (context, snapshot) {
          final state = snapshot.data ?? _cubit.state;
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.2,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _staggeredController,
                  builder: (context, child) {
                    final delay = index * 0.15;
                    final animValue = Curves.easeOutCubic.transform(
                      math.max(
                        0,
                        (_staggeredController.value - delay) / (1 - delay),
                      ),
                    );

                    return Transform.translate(
                      offset: Offset(0, (1 - animValue) * 50),
                      child: Transform.scale(
                        scale: 0.8 + (animValue * 0.2),
                        child: Opacity(
                          opacity: animValue,
                          child: _buildStatCard(index, state),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatCard(int index, WorkoutState state) {
    final stats = [
      {
        'title': context.l10n?.totalWorkouts ?? 'Total Workouts',
        'value': state.totalWorkouts.toString(),
        'unit': context.l10n?.sessions ?? 'sessions',
        'icon': Icons.fitness_center,
        'color': Colors.blue,
        'gradient': [Colors.blue.shade400, Colors.blue.shade600],
      },
      {
        'title': context.l10n?.caloriesBurned ?? 'Calories Burned',
        'value': '${state.totalCalories}',
        'unit': context.l10n?.kcal ?? 'kcal',
        'icon': Icons.local_fire_department,
        'color': Colors.orange,
        'gradient': [Colors.orange.shade400, Colors.orange.shade600],
      },
      {
        'title': context.l10n?.activeMinutes ?? 'Active Minutes',
        'value': '${state.activeMinutes}',
        'unit': context.l10n?.min ?? 'min',
        'icon': Icons.timer,
        'color': Colors.green,
        'gradient': [Colors.green.shade400, Colors.green.shade600],
      },
      {
        'title': context.l10n?.thisWeek ?? 'This Week',
        'value': '${state.weeklyWorkouts}',
        'unit': context.l10n?.workoutsUnit ?? 'workouts',
        'icon': Icons.trending_up,
        'color': Colors.purple,
        'gradient': [Colors.purple.shade400, Colors.purple.shade600],
      },
    ];

    final stat = stats[index];
    final color = stat['color'] as Color;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: color.withValues(alpha: 0.15), width: 0.5),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned(
              top: -20,
              right: -20,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      color.withValues(alpha: 0.1),
                      color.withValues(alpha: 0.05),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(stat['icon'] as IconData, color: color, size: 24),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          AnimatedBuilder(
                            animation: _statsAnimation,
                            builder: (context, child) {
                              return AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: Text(
                                  stat['value'] as String,
                                  key: ValueKey(stat['value']),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                        fontSize: 28,
                                        height: 1.0,
                                      ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 6),
                          Text(
                            stat['unit'] as String,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: color,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),

                      Text(
                        stat['title'] as String,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChart() {
    return SliverToBoxAdapter(
      child: StreamBuilder<WorkoutState>(
        stream: _cubit.stream,
        initialData: _cubit.state,
        builder: (context, snapshot) {
          final state = snapshot.data ?? _cubit.state;
          return Container(
            height: 300,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weekly Progress',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: AnimatedBuilder(
                      animation: _chartAnimation,
                      builder: (context, child) {
                        return CustomPaint(
                          size: Size.infinite,
                          painter: WorkoutChartPainter(
                            data: state.weeklyData,
                            animationValue: _chartAnimation.value,
                            theme: Theme.of(context),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecentWorkouts() {
    return SliverToBoxAdapter(
      child: StreamBuilder<WorkoutState>(
        stream: _cubit.stream,
        initialData: _cubit.state,
        builder: (context, snapshot) {
          final state = snapshot.data ?? _cubit.state;
          return Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.l10n?.recentWorkouts ?? 'Recent Workouts',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(context.l10n?.viewAll ?? 'View All'),
                      ),
                    ],
                  ),
                ),
                ...state.recentWorkouts.asMap().entries.map(
                  (entry) => AnimatedBuilder(
                    animation: _staggeredController,
                    builder: (context, child) {
                      final delay = entry.key * 0.1;
                      final animValue = Curves.easeOutCubic.transform(
                        math.max(
                          0,
                          (_staggeredController.value - delay) / (1 - delay),
                        ),
                      );

                      return Transform.translate(
                        offset: Offset((1 - animValue) * 100, 0),
                        child: Opacity(
                          opacity: animValue,
                          child: _buildWorkoutListItem(entry.value),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildWorkoutListItem(WorkoutSummary workout) {
    return GestureDetector(
      onTap: () {
        _showSessionDetails(workout);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.surfaceContainerLow,
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: workout.color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(workout.icon, color: workout.color, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workout.name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${workout.duration} min • ${workout.calories} cal',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              workout.timeAgo,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSessionDetails(WorkoutSummary workout) async {
    if (workout.sessionId != null) {
      try {
        final sessionRepository = locator<WorkoutSessionRepository>();
        final session = await sessionRepository.getSessionById(
          workout.sessionId!,
        );

        if (session != null && mounted) {
          WorkoutSessionDetailsBottomSheet.show(context, session: session);
        } else {
          _showSimpleAlert(
            'Session not found',
            'Could not load session details.',
          );
        }
      } catch (e) {
        _showSimpleAlert('Error', 'Failed to load session details: $e');
      }
    } else {
      _showSimpleAlert(
        'Workout Details',
        'This is a sample workout entry.\n\n'
            'Name: ${workout.name}\n'
            'Duration: ${workout.duration} minutes\n'
            'Calories: ${workout.calories} cal\n'
            'Time: ${workout.timeAgo}',
      );
    }
  }

  void _showSimpleAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutPlans() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n?.workoutPlans ?? 'Workout Plans',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllWorkoutsScreen(),
                      ),
                    );
                  },
                  child: Text(context.l10n?.viewAll ?? 'View All'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 160,
              child: FutureBuilder<List<WorkoutPlan>>(
                future: locator<WorkoutApiService>().getWorkoutPlans(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError || !snapshot.hasData) {
                    return const Center(
                      child: Text('Failed to load workout plans'),
                    );
                  }

                  final workoutPlans = snapshot.data!;
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: math.min(workoutPlans.length, 3),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      return _buildWorkoutPlanCard(workoutPlans[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutPlanCard(WorkoutPlan workoutPlan) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkoutDetailScreen(workoutPlan: workoutPlan),
          ),
        );
      },
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              workoutPlan.color,
              workoutPlan.color.withValues(alpha: 0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: workoutPlan.color.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    workoutPlan.difficulty,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(
                  Icons.fitness_center,
                  color: Colors.white.withValues(alpha: 0.8),
                  size: 20,
                ),
              ],
            ),
            const Spacer(),
            Text(
              workoutPlan.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              workoutPlan.subtitle,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: Colors.white.withValues(alpha: 0.8),
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  workoutPlan.duration,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.local_fire_department,
                  color: Colors.white.withValues(alpha: 0.8),
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  workoutPlan.calories,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
