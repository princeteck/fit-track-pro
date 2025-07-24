import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uih/uih.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../controllers/controllers.dart';
import '../../../core/di/di.dart';
import '../../../core/locale/l10n.dart';
import '../../../core/locale/locale_utils.dart';

class LocaleSettingsScreen extends StatelessWidget {
  const LocaleSettingsScreen({super.key});
  static const path = '/settings/locale';
  static const name = 'localeSettings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n?.localeSettingsTitle ?? '')),
      body: BlocBuilder<LocaleCubit, LocaleState>(
        bloc: locator<LocaleCubit>(),
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Text(
                context.l10n?.selectLanguage ?? '',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ...L10n.supportedLocales.map((locale) {
                final isSelected = state.locale == locale;
                return Card(
                  child: ListTile(
                    leading: Radio<Locale>(
                      value: locale,
                      groupValue: state.locale,
                      onChanged: (Locale? value) {
                        if (value != null) {
                          locator<LocaleCubit>().setLocale(value);
                        }
                      },
                    ),
                    title: Text(LocaleUtils.getDisplayName(locale)),
                    subtitle: Text(LocaleUtils.getNativeDisplayName(locale)),
                    trailing: isSelected
                        ? const Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () {
                      locator<LocaleCubit>().setLocale(locale);
                    },
                  ),
                );
              }),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  locator<LocaleCubit>().resetToSystemLocale();
                  // Using the context extension for snackbar
                  context.showSnackBar('Reset to system default' as SnackBar);
                },
                child: const Text('Reset to System Default'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  locator<LocaleCubit>().clearLocalePreferences();
                  // Using the context extension for snackbar
                  context.showSnackBar('Preferences cleared' as SnackBar);
                },
                child: const Text('Clear Saved Preferences'),
              ),
              const SizedBox(height: 24),
              if (state.locale != null) ...[
                const Divider(),
                const SizedBox(height: 16),
                Text(
                  'Current Locale Information',
                  style: context.textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                _InfoRow('Language Code', state.locale!.languageCode),
                if (state.locale!.countryCode != null)
                  _InfoRow('Country Code', state.locale!.countryCode!),
                _InfoRow(
                  'Display Name',
                  LocaleUtils.getDisplayName(state.locale!),
                ),
                _InfoRow(
                  'Native Name',
                  LocaleUtils.getNativeDisplayName(state.locale!),
                ),
                _InfoRow('Is RTL', LocaleUtils.isRTL(state.locale!).toString()),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
