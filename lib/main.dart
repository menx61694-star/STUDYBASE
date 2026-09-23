import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/theme/app_spacing.dart';
import 'core/widgets/primary_button.dart';
import 'core/widgets/studybase_logo.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const StudyBaseApp());
}

class StudyBaseApp extends StatelessWidget {
  const StudyBaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyBase',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: const StudyBaseLaunchFlow(),
    );
  }
}

class StudyBaseLaunchFlow extends StatefulWidget {
  const StudyBaseLaunchFlow({super.key});

  @override
  State<StudyBaseLaunchFlow> createState() => _StudyBaseLaunchFlowState();
}

class _StudyBaseLaunchFlowState extends State<StudyBaseLaunchFlow> {
  bool _showSplash = true;
  bool _showOnboarding = true;

  @override
  void initState() {
    super.initState();
    _resolveLaunchState();
  }

  Future<void> _resolveLaunchState() async {
    final preferences = await SharedPreferences.getInstance();
    final onboardingComplete =
        preferences.getBool('onboarding_complete') ?? false;

    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;

    setState(() {
      _showSplash = false;
      _showOnboarding = !onboardingComplete;
    });
  }

  Future<void> _completeOnboarding() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool('onboarding_complete', true);
    if (!mounted) return;
    setState(() => _showOnboarding = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_showSplash) return const _StudyBaseSplashScreen();
    if (_showOnboarding) {
      return _StudyBaseOnboarding(onComplete: _completeOnboarding);
    }
    return const _StudyBaseReadyScreen();
  }
}

class _StudyBaseSplashScreen extends StatelessWidget {
  const _StudyBaseSplashScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: StudyBaseLogo(size: 112, showWordmark: true),
      ),
    );
  }
}

class _StudyBaseOnboarding extends StatefulWidget {
  const _StudyBaseOnboarding({required this.onComplete});

  final Future<void> Function() onComplete;

  @override
  State<_StudyBaseOnboarding> createState() => _StudyBaseOnboardingState();
}

class _StudyBaseOnboardingState extends State<_StudyBaseOnboarding> {
  final _controller = PageController();
  int _page = 0;

  static const _pages = [
    (
      icon: Icons.menu_book_rounded,
      title: 'Learn smarter',
      body: 'Find organized study notes and learning resources in one place.'
    ),
    (
      icon: Icons.picture_as_pdf_rounded,
      title: 'Keep your notes close',
      body: 'Read PDFs in-app and save useful notes for quick access later.'
    ),
    (
      icon: Icons.quiz_rounded,
      title: 'Practice and grow',
      body: 'Prepare with mock tests and track your study journey with StudyBase.'
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _next() async {
    if (_page == _pages.length - 1) {
      await widget.onComplete();
      return;
    }
    await _controller.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _page == _pages.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.page,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: widget.onComplete,
                  child: const Text('Skip'),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageChanged: (value) => setState(() => _page = value),
                  itemBuilder: (context, index) {
                    final item = _pages[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 112,
                          height: 112,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withValues(alpha: 0.10),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            item.icon,
                            size: 52,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xxl),
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 360),
                          child: Text(
                            item.body,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: index == _page ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: index == _page
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.outlineVariant,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              StudyBasePrimaryButton(
                label: isLast ? 'Get Started' : 'Continue',
                onPressed: _next,
              ),
              const SizedBox(height: AppSpacing.sm),
            ],
          ),
        ),
      ),
    );
  }
}

class _StudyBaseReadyScreen extends StatelessWidget {
  const _StudyBaseReadyScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('StudyBase'),
      ),
    );
  }
}
