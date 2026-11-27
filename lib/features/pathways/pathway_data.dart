/// Category for regulated occupations (S22).
enum OccupationCategory { healthcare, trades, professions }

extension OccupationCategoryLabel on OccupationCategory {
  String get label => switch (this) {
        OccupationCategory.healthcare => 'Healthcare',
        OccupationCategory.trades => 'Trades',
        OccupationCategory.professions => 'Professions',
      };
}

class RegulatedOccupation {
  final String routePath;
  final String title;
  final OccupationCategory category;
  final String regulator;
  final String timeline;
  final List<String> steps;

  const RegulatedOccupation({
    required this.routePath,
    required this.title,
    required this.category,
    required this.regulator,
    this.timeline = '6–18 months typical',
    this.steps = const [
      'Credential assessment & document verification',
      'Language proficiency requirement',
      'Licensing or trade examination',
      'Provincial registration & supervised practice (if required)',
    ],
  });
}

const List<RegulatedOccupation> regulatedOccupations = [
  RegulatedOccupation(
    routePath: '/pathway-dental-hygienist',
    title: 'Dental hygienist',
    category: OccupationCategory.healthcare,
    regulator: 'Provincial Dental Hygienists Regulatory College (e.g. CDHO)',
  ),
  RegulatedOccupation(
    routePath: '/pathway-physio',
    title: 'Physiotherapist',
    category: OccupationCategory.healthcare,
    regulator: 'CAPR & Provincial College of Physiotherapists',
  ),
  RegulatedOccupation(
    routePath: '/pathway-o-t',
    title: 'Occupational therapist',
    category: OccupationCategory.healthcare,
    regulator: 'ACOTRO & Provincial College of Occupational Therapists',
  ),
  RegulatedOccupation(
    routePath: '/pathway-m-l-t',
    title: 'Medical laboratory technologist',
    category: OccupationCategory.healthcare,
    regulator: 'CSMLS & Provincial MLT College',
  ),
  RegulatedOccupation(
    routePath: '/pathway-m-r-t',
    title: 'Medical radiation technologist',
    category: OccupationCategory.healthcare,
    regulator: 'CAMRT & Provincial MRT College',
  ),
  RegulatedOccupation(
    routePath: '/pathway-r-t',
    title: 'Respiratory therapist',
    category: OccupationCategory.healthcare,
    regulator: 'NARTRB & Provincial Respiratory Therapy College',
  ),
  RegulatedOccupation(
    routePath: '/pathway-midwife',
    title: 'Midwife',
    category: OccupationCategory.healthcare,
    regulator: 'Provincial College of Midwives',
  ),
  RegulatedOccupation(
    routePath: '/pathway-dietitian',
    title: 'Dietitian',
    category: OccupationCategory.healthcare,
    regulator: 'Provincial College of Dietitians',
  ),
  RegulatedOccupation(
    routePath: '/pathway-psychologist',
    title: 'Psychologist',
    category: OccupationCategory.healthcare,
    regulator: 'Provincial College of Psychologists',
  ),
  RegulatedOccupation(
    routePath: '/pathway-psychotherapist',
    title: 'Psychotherapist',
    category: OccupationCategory.healthcare,
    regulator: 'Provincial College of Registered Psychotherapists',
  ),
  RegulatedOccupation(
    routePath: '/pathway-optometrist',
    title: 'Optometrist',
    category: OccupationCategory.healthcare,
    regulator: 'OEBC & Provincial College of Optometrists',
  ),
  RegulatedOccupation(
    routePath: '/pathway-optician',
    title: 'Optician',
    category: OccupationCategory.healthcare,
    regulator: 'NACOR & Provincial College of Opticians',
  ),
  RegulatedOccupation(
    routePath: '/pathway-chiropractor',
    title: 'Chiropractor',
    category: OccupationCategory.healthcare,
    regulator: 'CCEB & Provincial College of Chiropractors',
  ),
  RegulatedOccupation(
    routePath: '/pathway-massage',
    title: 'Massage therapist',
    category: OccupationCategory.healthcare,
    regulator: 'Provincial College of Massage Therapists',
  ),
  RegulatedOccupation(
    routePath: '/pathway-kinesiologist',
    title: 'Kinesiologist',
    category: OccupationCategory.healthcare,
    regulator: 'Provincial College of Kinesiologists',
  ),
  RegulatedOccupation(
    routePath: '/pathway-audiologist-s-l-p',
    title: 'Audiologist or speech-language pathologist',
    category: OccupationCategory.healthcare,
    regulator: 'Provincial College of Audiologists & SLPs',
  ),
  RegulatedOccupation(
    routePath: '/pathway-denturist',
    title: 'Denturist',
    category: OccupationCategory.healthcare,
    regulator: 'Provincial College of Denturists',
  ),
  RegulatedOccupation(
    routePath: '/pathway-paralegal',
    title: 'Paralegal',
    category: OccupationCategory.professions,
    regulator: 'Provincial Law Society (e.g. LSO in Ontario)',
  ),
  RegulatedOccupation(
    routePath: '/pathway-architect',
    title: 'Architect',
    category: OccupationCategory.professions,
    regulator: 'CACB & Provincial Association of Architects',
  ),
  RegulatedOccupation(
    routePath: '/pathway-vet',
    title: 'Veterinarian',
    category: OccupationCategory.professions,
    regulator: 'NEB (CVMA) & Provincial Veterinary College',
  ),
  RegulatedOccupation(
    routePath: '/pathway-surveyor',
    title: 'Land surveyor',
    category: OccupationCategory.professions,
    regulator: 'CBEPS & Provincial Land Surveyors Association',
  ),
  RegulatedOccupation(
    routePath: '/pathway-geoscientist',
    title: 'Geoscientist',
    category: OccupationCategory.professions,
    regulator: 'Geoscientists Canada & Provincial Regulator',
  ),
  RegulatedOccupation(
    routePath: '/pathway-real-estate',
    title: 'Real estate agent',
    category: OccupationCategory.professions,
    regulator: 'Provincial Real Estate Council (e.g. RECO, BCFSA)',
    timeline: '3–9 months typical',
  ),
  RegulatedOccupation(
    routePath: '/pathway-insurance',
    title: 'Life insurance agent',
    category: OccupationCategory.professions,
    regulator: 'Provincial Insurance Council (LLQP exam)',
    timeline: '2–6 months typical',
  ),
  RegulatedOccupation(
    routePath: '/pathway-mortgage',
    title: 'Mortgage agent',
    category: OccupationCategory.professions,
    regulator: 'Provincial Financial Services Regulator (e.g. FSRA)',
    timeline: '2–6 months typical',
  ),
  RegulatedOccupation(
    routePath: '/pathway-refrigeration',
    title: 'Refrigeration and air conditioning mechanic',
    category: OccupationCategory.trades,
    regulator: 'Red Seal / Provincial Apprenticeship Authority',
  ),
  RegulatedOccupation(
    routePath: '/pathway-sheet-metal',
    title: 'Sheet metal worker',
    category: OccupationCategory.trades,
    regulator: 'Red Seal / Provincial Apprenticeship Authority',
  ),
  RegulatedOccupation(
    routePath: '/pathway-steamfitter',
    title: 'Steamfitter',
    category: OccupationCategory.trades,
    regulator: 'Red Seal / Provincial Apprenticeship Authority',
  ),
  RegulatedOccupation(
    routePath: '/pathway-auto-tech',
    title: 'Automotive service technician',
    category: OccupationCategory.trades,
    regulator: 'Red Seal / Provincial Apprenticeship Authority',
  ),
  RegulatedOccupation(
    routePath: '/pathway-auto-body',
    title: 'Auto body and collision repairer',
    category: OccupationCategory.trades,
    regulator: 'Red Seal / Provincial Apprenticeship Authority',
  ),
  RegulatedOccupation(
    routePath: '/pathway-truck-coach',
    title: 'Truck and coach technician',
    category: OccupationCategory.trades,
    regulator: 'Red Seal / Provincial Apprenticeship Authority',
  ),
  RegulatedOccupation(
    routePath: '/pathway-hairstylist',
    title: 'Hairstylist',
    category: OccupationCategory.trades,
    regulator: 'Red Seal / Provincial Apprenticeship Authority',
    timeline: '3–9 months typical',
  ),
  RegulatedOccupation(
    routePath: '/pathway-crane',
    title: 'Mobile crane operator (hoisting engineer)',
    category: OccupationCategory.trades,
    regulator: 'Red Seal / Provincial Apprenticeship Authority',
  ),
];

final Map<String, RegulatedOccupation> regulatedOccupationByPath = {
  for (final occ in regulatedOccupations) occ.routePath: occ,
};
