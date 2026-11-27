class OccupationItem {
  final String title;
  final String sub;
  final bool isRegulated;
  final String? badgeText;
  final bool isClickable;

  const OccupationItem({
    required this.title,
    required this.sub,
    this.isRegulated = true,
    this.badgeText,
    this.isClickable = false,
  });
}

class OccupationCategory {
  final String title;
  final List<OccupationItem> items;

  const OccupationCategory({required this.title, required this.items});
}

class PathwayStep {
  final int number;
  final String title;
  final String duration;
  final String description;

  const PathwayStep({
    required this.number,
    required this.title,
    required this.duration,
    required this.description,
  });
}

const List<OccupationCategory> kOccupationCategories = [
  OccupationCategory(
    title: 'Engineering & Trades',
    items: [
      OccupationItem(
        title: 'Professional Engineer (P.Eng.)',
        sub: 'Regulated by PEO · Licence required to use title',
        badgeText: 'Regulated',
        isClickable: true,
      ),
      OccupationItem(
        title: 'Electrician (Construction & Maintenance)',
        sub: 'Regulated by Skilled Trades Ontario · 309A',
        badgeText: 'Regulated',
      ),
      OccupationItem(
        title: 'Software Developer / Engineer',
        sub: 'Unregulated in most roles · No licence needed',
        isRegulated: false,
        badgeText: 'No licence',
      ),
    ],
  ),
  OccupationCategory(
    title: 'Healthcare',
    items: [
      OccupationItem(
        title: 'Registered Nurse (RN)',
        sub: 'Regulated by CNO · Registration required',
        badgeText: 'Regulated',
      ),
      OccupationItem(
        title: 'Physician / Surgeon',
        sub: 'Regulated by CPSO · Multi-step licensing',
        badgeText: 'Regulated',
      ),
      OccupationItem(
        title: 'Pharmacist',
        sub: 'Regulated by OCP · PEBC exams required',
        badgeText: 'Regulated',
      ),
    ],
  ),
  OccupationCategory(
    title: 'Education & Finance',
    items: [
      OccupationItem(
        title: 'Certified Teacher (OCT)',
        sub: 'Regulated by Ontario College of Teachers',
        badgeText: 'Regulated',
      ),
      OccupationItem(
        title: 'Chartered Professional Accountant (CPA)',
        sub: 'Regulated by CPA Ontario',
        badgeText: 'Regulated',
      ),
    ],
  ),
];

const List<PathwayStep> kPengPathwaySteps = [
  PathwayStep(
    number: 1,
    title: 'Academic assessment & application',
    duration: '2–4 months',
    description:
        'Submit your degree transcripts and course descriptions to PEO for academic equivalency review.',
  ),
  PathwayStep(
    number: 2,
    title: 'National Professional Practice Exam (NPPE)',
    duration: '1–2 months',
    description:
        'Pass the online ethics and law exam. Offered 4 times a year; can be taken while completing experience.',
  ),
  PathwayStep(
    number: 3,
    title: '48 months of engineering experience',
    duration: '12+ months in Canada',
    description:
        'Document 48 months of verifiable engineering work, including at least 12 months in a Canadian jurisdiction.',
  ),
  PathwayStep(
    number: 4,
    title: 'Licence issued (P.Eng.)',
    duration: 'Final review',
    description:
        'Once all requirements are verified, PEO issues your P.Eng. licence and you can legally use the title.',
  ),
];

const List<String> kPengChecklistItems = [
  'Official university transcripts (sealed or WES-verified)',
  'Detailed syllabus / course descriptions',
  'Record of 48 months engineering experience',
  '3–4 professional references (at least 2 P.Eng.)',
];
