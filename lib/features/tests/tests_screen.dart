import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../../core/widgets/primary_button.dart';

class MockQuestion {
  const MockQuestion(this.text, this.options, this.answer, this.explanation,
      {required this.hindiText, required this.hindiOptions, required this.hindiExplanation});
  final String text;
  final List<String> options;
  final int answer;
  final String explanation;
  final String hindiText;
  final List<String> hindiOptions;
  final String hindiExplanation;
}

class MockTest {
  const MockTest(this.title, this.subject, this.minutes, this.questions,
      {required this.hindiTitle, required this.hindiSubject});
  final String title;
  final String subject;
  final int minutes;
  final List<MockQuestion> questions;
  final String hindiTitle;
  final String hindiSubject;
}

const studyBaseMockTests = <MockTest>[
  MockTest('General Knowledge — Practice 01', 'General Knowledge', 10, [
    MockQuestion('Which part of the Constitution contains Fundamental Rights?', ['Part I', 'Part II', 'Part III', 'Part IV'], 2, 'Fundamental Rights are provided in Part III of the Constitution.', hindiText: 'भारतीय संविधान के किस भाग में मौलिक अधिकार दिए गए हैं?', hindiOptions: ['भाग I', 'भाग II', 'भाग III', 'भाग IV'], hindiExplanation: 'संविधान के भाग III में मौलिक अधिकार दिए गए हैं।'),
    MockQuestion('What is the capital of Madhya Pradesh?', ['Indore', 'Bhopal', 'Jabalpur', 'Gwalior'], 1, 'Bhopal is the capital of Madhya Pradesh.', hindiText: 'मध्य प्रदेश की राजधानी क्या है?', hindiOptions: ['इंदौर', 'भोपाल', 'जबलपुर', 'ग्वालियर'], hindiExplanation: 'भोपाल मध्य प्रदेश की राजधानी है।'),
    MockQuestion('Which planet is known as the Red Planet?', ['Venus', 'Mars', 'Jupiter', 'Mercury'], 1, 'Mars appears reddish because of iron-rich dust.', hindiText: 'किस ग्रह को लाल ग्रह कहा जाता है?', hindiOptions: ['शुक्र', 'मंगल', 'बृहस्पति', 'बुध'], hindiExplanation: 'लौह-युक्त धूल के कारण मंगल ग्रह लाल दिखाई देता है।'),
    MockQuestion('The Reserve Bank of India was established in which year?', ['1935', '1947', '1950', '1928'], 0, 'The RBI began operations on 1 April 1935.', hindiText: 'भारतीय रिज़र्व बैंक की स्थापना किस वर्ष हुई?', hindiOptions: ['1935', '1947', '1950', '1928'], hindiExplanation: 'भारतीय रिज़र्व बैंक ने 1 अप्रैल 1935 को काम शुरू किया।'),
    MockQuestion('Which is the largest ocean on Earth?', ['Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean', 'Pacific Ocean'], 3, 'The Pacific Ocean is the largest ocean.', hindiText: 'पृथ्वी का सबसे बड़ा महासागर कौन-सा है?', hindiOptions: ['अटलांटिक महासागर', 'हिंद महासागर', 'आर्कटिक महासागर', 'प्रशांत महासागर'], hindiExplanation: 'प्रशांत महासागर पृथ्वी का सबसे बड़ा महासागर है।'),
  ], hindiTitle: 'सामान्य ज्ञान — अभ्यास 01', hindiSubject: 'सामान्य ज्ञान'),
  MockTest('Mathematics — Quick Practice', 'Mathematics', 8, [
    MockQuestion('What is 15% of 200?', ['15', '20', '30', '35'], 2, '15% of 200 = 0.15 × 200 = 30.', hindiText: '200 का 15% कितना है?', hindiOptions: ['15', '20', '30', '35'], hindiExplanation: '200 का 15% = 0.15 × 200 = 30।'),
    MockQuestion('What is the square of 13?', ['156', '169', '179', '196'], 1, '13 × 13 = 169.', hindiText: '13 का वर्ग कितना है?', hindiOptions: ['156', '169', '179', '196'], hindiExplanation: '13 × 13 = 169।'),
    MockQuestion('If 5x = 45, what is x?', ['5', '8', '9', '10'], 2, 'x = 45 ÷ 5 = 9.', hindiText: 'यदि 5x = 45, तो x का मान क्या है?', hindiOptions: ['5', '8', '9', '10'], hindiExplanation: 'x = 45 ÷ 5 = 9।'),
  ], hindiTitle: 'गणित — त्वरित अभ्यास', hindiSubject: 'गणित'),
  MockTest('Reasoning — Starter Set', 'Reasoning', 8, [
    MockQuestion('Choose the next number: 2, 4, 8, 16, ...', ['18', '24', '30', '32'], 3, 'Each number is doubled, so the next number is 32.', hindiText: 'अगली संख्या चुनें: 2, 4, 8, 16, ...', hindiOptions: ['18', '24', '30', '32'], hindiExplanation: 'हर संख्या दोगुनी हो रही है, इसलिए अगली संख्या 32 है।'),
    MockQuestion('Which one is different?', ['Triangle', 'Square', 'Circle', 'Rectangle'], 2, 'A circle has no straight sides or corners.', hindiText: 'इनमें से अलग आकृति कौन-सी है?', hindiOptions: ['त्रिभुज', 'वर्ग', 'वृत्त', 'आयत'], hindiExplanation: 'वृत्त की कोई सीधी भुजा या कोना नहीं होता।'),
    MockQuestion('If CAT is coded as DBU, how is DOG coded?', ['EPH', 'EOG', 'DPH', 'FPI'], 0, 'Each letter moves one step forward: DOG becomes EPH.', hindiText: 'यदि CAT को DBU लिखा जाता है, तो DOG को कैसे लिखेंगे?', hindiOptions: ['EPH', 'EOG', 'DPH', 'FPI'], hindiExplanation: 'हर अक्षर को एक स्थान आगे करने पर DOG, EPH बनता है।'),
  ], hindiTitle: 'रीजनिंग — प्रारंभिक अभ्यास', hindiSubject: 'रीजनिंग'),
];

class TestsScreen extends StatelessWidget {
  const TestsScreen({super.key});

  bool _h(BuildContext context) => Localizations.localeOf(context).languageCode == 'hi';

  @override
  Widget build(BuildContext context) {
    final hindi = _h(context);
    return Scaffold(
      appBar: AppBar(title: Text(hindi ? 'मॉक टेस्ट' : 'Mock Tests')),
      body: ListView(
        padding: AppSpacing.page,
        children: [
          Text(hindi ? 'अभ्यास करें और आगे बढ़ें' : 'Practice and grow', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: AppSpacing.xs),
          Text(hindi ? 'प्रश्न हल करें और जमा करने के बाद उत्तरों की व्याख्या देखें।' : 'Attempt a practice set and review your answers instantly.', style: Theme.of(context).textTheme.bodyMedium),
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
                    Expanded(child: Text(hindi ? test.hindiTitle : test.title, style: Theme.of(context).textTheme.titleMedium)),
                  ]),
                  const SizedBox(height: AppSpacing.sm),
                  Text('${hindi ? test.hindiSubject : test.subject}  •  ${test.questions.length} ${hindi ? 'प्रश्न' : 'questions'}'),
                  const SizedBox(height: AppSpacing.xs),
                  Text('${test.minutes} ${hindi ? 'मिनट' : 'min'}  •  ${hindi ? 'तुरंत स्कोर और व्याख्या' : 'Instant score and explanations'}'),
                  const SizedBox(height: AppSpacing.md),
                  StudyBasePrimaryButton(
                    label: hindi ? 'टेस्ट शुरू करें' : 'Start test',
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

  bool get _hindi => Localizations.localeOf(context).languageCode == 'hi';
  int get _score => _answers.entries.where((e) => widget.test.questions[e.key].answer == e.value).length;

  @override
  Widget build(BuildContext context) {
    final hindi = _hindi;
    final questions = widget.test.questions;
    final q = questions[_index];
    final options = hindi ? q.hindiOptions : q.options;
    final selected = _answers[_index];
    return Scaffold(
      appBar: AppBar(title: Text(hindi ? widget.test.hindiSubject : widget.test.subject)),
      body: ListView(
        padding: AppSpacing.page,
        children: [
          if (_submitted) ...[
            const Icon(Icons.emoji_events_outlined, size: 56),
            const SizedBox(height: AppSpacing.md),
            Text(hindi ? 'टेस्ट पूरा हुआ' : 'Test completed', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.xs),
            Text('${hindi ? 'आपका स्कोर' : 'Your score'}: $_score / ${questions.length}', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.md),
            ...questions.asMap().entries.map((e) {
              final questionOptions = hindi ? e.value.hindiOptions : e.value.options;
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('${e.key + 1}. ${hindi ? e.value.hindiText : e.value.text}', style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: AppSpacing.xs),
                    Text('${hindi ? 'सही उत्तर' : 'Correct answer'}: ${questionOptions[e.value.answer]}'),
                    if (_answers[e.key] != null && _answers[e.key] != e.value.answer)
                      Text('${hindi ? 'आपका उत्तर' : 'Your answer'}: ${questionOptions[_answers[e.key]!]}'),
                    const SizedBox(height: AppSpacing.xs),
                    Text(hindi ? e.value.hindiExplanation : e.value.explanation),
                  ]),
                ),
              );
            }),
            const SizedBox(height: AppSpacing.md),
            StudyBasePrimaryButton(label: hindi ? 'मॉक टेस्ट पर वापस जाएँ' : 'Back to mock tests', icon: Icons.arrow_back_rounded, onPressed: () => Navigator.of(context).pop()),
          ] else ...[
            Text(hindi ? widget.test.hindiTitle : widget.test.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.md),
            LinearProgressIndicator(value: (_index + 1) / questions.length),
            const SizedBox(height: AppSpacing.sm),
            Text(hindi ? 'प्रश्न ${_index + 1} / ${questions.length}' : 'Question ${_index + 1} of ${questions.length}'),
            const SizedBox(height: AppSpacing.lg),
            Text(hindi ? q.hindiText : q.text, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.md),
            RadioGroup<int>(
              groupValue: selected,
              onChanged: (value) { if (value != null) setState(() => _answers[_index] = value); },
              child: Column(
                children: options.asMap().entries.map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: Card(child: RadioListTile<int>(value: e.key, title: Text(e.value))),
                )).toList(),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            StudyBasePrimaryButton(
              label: _index == questions.length - 1
                  ? (hindi ? 'टेस्ट जमा करें' : 'Submit test')
                  : (hindi ? 'अगला प्रश्न' : 'Next question'),
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
