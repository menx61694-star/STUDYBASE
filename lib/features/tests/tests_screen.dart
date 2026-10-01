import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../../core/widgets/primary_button.dart';

class MockQuestion {
  const MockQuestion(this.text, this.options, this.answer, this.explanation);
  final String text;
  final List<String> options;
  final int answer;
  final String explanation;
}

class MockTest {
  const MockTest(this.title, this.subject, this.minutes, this.questions);
  final String title;
  final String subject;
  final int minutes;
  final List<MockQuestion> questions;
}

const studyBaseMockTests = <MockTest>[
  MockTest('General Knowledge — Practice 01', 'General Knowledge', 10, [
    MockQuestion('Which part of the Constitution contains Fundamental Rights?', ['Part I', 'Part II', 'Part III', 'Part IV'], 2, 'Fundamental Rights are provided in Part III of the Constitution.'),
    MockQuestion('What is the capital of Madhya Pradesh?', ['Indore', 'Bhopal', 'Jabalpur', 'Gwalior'], 1, 'Bhopal is the capital of Madhya Pradesh.'),
    MockQuestion('Which planet is known as the Red Planet?', ['Venus', 'Mars', 'Jupiter', 'Mercury'], 1, 'Mars appears reddish because of iron-rich dust.'),
    MockQuestion('The Reserve Bank of India was established in which year?', ['1935', '1947', '1950', '1928'], 0, 'The RBI began operations on 1 April 1935.'),
    MockQuestion('Which is the largest ocean on Earth?', ['Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean', 'Pacific Ocean'], 3, 'The Pacific Ocean is the largest ocean.'),
  ]),
  MockTest('Mathematics — Quick Practice', 'Mathematics', 8, [
    MockQuestion('What is 15% of 200?', ['15', '20', '30', '35'], 2, '15% of 200 = 0.15 × 200 = 30.'),
    MockQuestion('What is the square of 13?', ['156', '169', '179', '196'], 1, '13 × 13 = 169.'),
    MockQuestion('If 5x = 45, what is x?', ['5', '8', '9', '10'], 2, 'x = 45 ÷ 5 = 9.'),
  ]),
  MockTest('Reasoning — Starter Set', 'Reasoning', 8, [
    MockQuestion('Choose the next number: 2, 4, 8, 16, ...', ['18', '24', '30', '32'], 3, 'Each number is doubled, so the next number is 32.'),
    MockQuestion('Which one is different?', ['Triangle', 'Square', 'Circle', 'Rectangle'], 2, 'A circle has no straight sides or corners.'),
    MockQuestion('If CAT is coded as DBU, how is DOG coded?', ['EPH', 'EOG', 'DPH', 'FPI'], 0, 'Each letter moves one step forward: DOG becomes EPH.'),
  ]),
];

class TestsScreen extends StatelessWidget {
  const TestsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Mock Tests')),
        body: ListView(
          padding: AppSpacing.page,
          children: [
            Text('Practice and grow', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.xs),
            Text('Attempt a practice set and review your answers instantly.', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: AppSpacing.lg),
            ...studyBaseMockTests.map((test) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(children: [
                          const Icon(Icons.quiz_outlined, size: 28),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(child: Text(test.title, style: Theme.of(context).textTheme.titleMedium)),
                        ]),
                        const SizedBox(height: AppSpacing.sm),
                        Text('${test.subject}  •  ${test.questions.length} questions'),
                        const SizedBox(height: AppSpacing.xs),
                        Text('${test.minutes} min  •  Instant score and explanations'),
                        const SizedBox(height: AppSpacing.md),
                        StudyBasePrimaryButton(
                          label: 'Start test',
                          icon: Icons.play_arrow_rounded,
                          onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => MockQuizScreen(test: test))),
                        ),
                      ]),
                    ),
                  ),
                )),
          ],
        ),
      );
}

class MockQuizScreen extends StatefulWidget {
  const MockQuizScreen({super.key, required this.test});
  final MockTest test;

  @override
  State<MockQuizScreen> createState() => _MockQuizScreenState();
}

class _MockQuizScreenState extends State<MockQuizScreen> {
  int _index = 0;
  final Map<int, int> _answers = {};
  bool _submitted = false;

  int get _score => _answers.entries.where((e) => widget.test.questions[e.key].answer == e.value).length;

  @override
  Widget build(BuildContext context) {
    final questions = widget.test.questions;
    final q = questions[_index];
    final selected = _answers[_index];
    return Scaffold(
      appBar: AppBar(title: Text(widget.test.subject)),
      body: ListView(
        padding: AppSpacing.page,
        children: [
          if (_submitted) ...[
            const Icon(Icons.emoji_events_outlined, size: 56),
            const SizedBox(height: AppSpacing.md),
            Text('Test completed', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.xs),
            Text('Your score: $_score / ${questions.length}', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.md),
            ...questions.asMap().entries.map((e) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('${e.key + 1}. ${e.value.text}', style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: AppSpacing.xs),
                      Text('Correct answer: ${e.value.options[e.value.answer]}'),
                      if (_answers[e.key] != null && _answers[e.key] != e.value.answer)
                        Text('Your answer: ${e.value.options[_answers[e.key]!]}'),
                      const SizedBox(height: AppSpacing.xs),
                      Text(e.value.explanation),
                    ]),
                  ),
                )),
            const SizedBox(height: AppSpacing.md),
            StudyBasePrimaryButton(label: 'Back to mock tests', icon: Icons.arrow_back_rounded, onPressed: () => Navigator.of(context).pop()),
          ] else ...[
            Text(widget.test.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.md),
            LinearProgressIndicator(value: (_index + 1) / questions.length),
            const SizedBox(height: AppSpacing.sm),
            Text('Question ${_index + 1} of ${questions.length}'),
            const SizedBox(height: AppSpacing.lg),
            Text(q.text, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.md),
            RadioGroup<int>(
              groupValue: selected,
              onChanged: (value) {
                if (value != null) setState(() => _answers[_index] = value);
              },
              child: Column(
                children: q.options.asMap().entries.map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: Card(
                        child: RadioListTile<int>(
                          value: e.key,
                          title: Text(e.value),
                        ),
                      ),
                    )).toList(),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            StudyBasePrimaryButton(
              label: _index == questions.length - 1 ? 'Submit test' : 'Next question',
              icon: _index == questions.length - 1 ? Icons.check_circle_outline_rounded : Icons.arrow_forward_rounded,
              onPressed: selected == null ? null : () {
                if (_index == questions.length - 1) {
                  setState(() => _submitted = true);
                } else {
                  setState(() => _index++);
                }
              },
            ),
          ],
        ],
      ),
    );
  }
}
