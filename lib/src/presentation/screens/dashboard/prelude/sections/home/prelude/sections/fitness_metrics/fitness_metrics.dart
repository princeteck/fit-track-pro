import 'package:fittrack_pro/src/core/constants/ui/assets_constants.dart';
import 'package:fittrack_pro/src/core/constants/ui/colors_constants.dart';
import 'package:fittrack_pro/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uih/uih.dart';

import '../../../../../../../screens.dart';
import '../../widgets/widgets.dart';

class FitnessMetrics extends StatelessWidget {
  const FitnessMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n?.fitnessMetricsTitle ?? 'Fitness Metrics',
                style: GoogleFonts.inter(
                  textStyle: Theme.of(context).textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  context.l10n?.viewAllText ?? 'View All',
                  style: GoogleFonts.inter(
                    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16, right: 16),
            children: [
              MetricCard(
                bgColor: KColors.orange50,
                title: context.l10n?.scoreLabel ?? 'Score',
                titleIcon: KIcons.logo,
                body: SvgPicture.asset(
                  KIcons.mcScore,
                  fit: BoxFit.fitWidth,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                footer: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '88',
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: ' %',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MetricCard(
                onTap: () => context.push(HeartStatsDashboard.path),
                bgColor: KColors.red50,
                title: context.l10n?.heartRateLabel ?? 'Heart Rate',
                titleIcon: KIcons.infinite,
                body: SvgPicture.asset(
                  KIcons.heartSolid,
                  width: 200,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                footer: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '93',
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: ' rate',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MetricCard(
                bgColor: KColors.blue50,
                title: context.l10n?.hydrationLabel ?? 'Hydration',
                titleIcon: KIcons.drop,
                body: SvgPicture.asset(
                  KIcons.mcHydration,
                  fit: BoxFit.fitWidth,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                footer: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '781',
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: ' ml',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MetricCard(
                bgColor: KColors.gray50,
                title: context.l10n?.caloriesLabel ?? 'Calories',
                titleIcon: KIcons.fire,
                body: SvgPicture.asset(
                  KIcons.mcCalories,
                  fit: BoxFit.fitWidth,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                footer: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '1,578',
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: ' kcal',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MetricCard(
                bgColor: KColors.green50,
                title: context.l10n?.distanceLabel ?? 'Distance',
                titleIcon: KIcons.sparkSolid,
                body: SvgPicture.asset(
                  KIcons.routing,
                  width: 180,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                footer: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '05',
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: ' km',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
