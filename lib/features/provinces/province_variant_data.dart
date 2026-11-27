/// Data model for province-specific variant screens (S12).
class ProvinceVariantData {
  final String routePath;
  final String provinceCode;
  final String provinceName;
  final String title;
  final String subtitle;
  final String noticeText;
  final bool isWarmAlert;
  final List<ProvinceStepItem> items;
  final String officialSource;
  final String? primaryCtaLabel;
  final String? primaryCtaRoute;

  const ProvinceVariantData({
    required this.routePath,
    required this.provinceCode,
    required this.provinceName,
    required this.title,
    required this.subtitle,
    required this.noticeText,
    this.isWarmAlert = false,
    required this.items,
    required this.officialSource,
    this.primaryCtaLabel,
    this.primaryCtaRoute,
  });
}

class ProvinceStepItem {
  final String heading;
  final String detail;

  const ProvinceStepItem({required this.heading, required this.detail});
}

const Map<String, ProvinceVariantData> provinceVariants = {
  '/var-b-c-health': ProvinceVariantData(
    routePath: '/var-b-c-health',
    provinceCode: 'BC',
    provinceName: 'British Columbia',
    title: 'MSP wait period',
    subtitle: 'Medical Services Plan (MSP) coverage starts after a wait period.',
    noticeText:
        'In BC, MSP coverage begins the remainder of the month you arrive plus two full calendar months.',
    isWarmAlert: true,
    items: [
      ProvinceStepItem(
        heading: 'Apply as soon as you arrive',
        detail: 'Submit your MSP application online or by mail right away so the clock starts.',
      ),
      ProvinceStepItem(
        heading: 'Bridge the 2-to-3 month gap',
        detail: 'Consider temporary private health insurance until your BC Services Card arrives.',
      ),
      ProvinceStepItem(
        heading: 'Children & urgent care',
        detail: 'Community health centres and 8-1-1 HealthLink BC can advise on urgent needs.',
      ),
    ],
    officialSource: 'Official source: gov.bc.ca/MSP · General information, not legal advice.',
    primaryCtaLabel: 'How to cover the wait',
    primaryCtaRoute: '/var-b-c-health-gap',
  ),
  '/var-b-c-health-gap': ProvinceVariantData(
    routePath: '/var-b-c-health-gap',
    provinceCode: 'BC',
    provinceName: 'British Columbia',
    title: 'Cover the MSP wait',
    subtitle: 'Options while waiting for your BC Medical Services Plan.',
    noticeText:
        'A single emergency hospital visit without coverage can cost thousands of dollars.',
    isWarmAlert: true,
    items: [
      ProvinceStepItem(
        heading: '1. Official & community clinics',
        detail: 'Community Health Centres offer sliding-scale or free primary care for newcomers.',
      ),
      ProvinceStepItem(
        heading: '2. Employer benefits',
        detail: 'If you or your partner have a job offer, check if group benefits start on day one.',
      ),
      ProvinceStepItem(
        heading: '3. Private visitors/newcomers insurance',
        detail: 'Short-term plans can cover emergencies during the 2-3 month MSP wait.',
      ),
    ],
    officialSource: 'Official source: HealthLink BC (8-1-1) · General information, not medical advice.',
  ),
  '/var-b-c-i-c-b-c': ProvinceVariantData(
    routePath: '/var-b-c-i-c-b-c',
    provinceCode: 'BC',
    provinceName: 'British Columbia',
    title: 'ICBC licence + insurance',
    subtitle: 'Driving and auto insurance are both handled by ICBC in BC.',
    noticeText:
        'New residents must switch to a BC driver\'s licence within 90 days of moving.',
    items: [
      ProvinceStepItem(
        heading: 'Bring your driving record',
        detail: 'An official driving abstract or insurance history can lower your ICBC rates.',
      ),
      ProvinceStepItem(
        heading: 'Book an ICBC appointment',
        detail: 'Bring two pieces of ID, your current licence, and proof of BC residency.',
      ),
      ProvinceStepItem(
        heading: 'Basic Autoplan is mandatory',
        detail: 'Every vehicle in BC must carry ICBC Basic Autoplan insurance.',
      ),
    ],
    officialSource: 'Official source: icbc.com · General information, not legal advice.',
  ),
  '/var-q-c-health': ProvinceVariantData(
    routePath: '/var-q-c-health',
    provinceCode: 'QC',
    provinceName: 'Québec',
    title: 'RAMQ (children exempt)',
    subtitle: 'Régie de l\'assurance maladie du Québec (RAMQ) health coverage.',
    noticeText:
        'Most adults have a 3-month wait for RAMQ, but children under 18 and pregnant individuals may be exempt.',
    items: [
      ProvinceStepItem(
        heading: 'Register for RAMQ immediately',
        detail: 'Apply online or at a Service Québec point of service with your immigration documents.',
      ),
      ProvinceStepItem(
        heading: 'Children under 18',
        detail: 'Eligible children can receive RAMQ coverage without the 3-month waiting period.',
      ),
      ProvinceStepItem(
        heading: 'Prescription drug insurance',
        detail: 'In Québec, everyone must have prescription drug coverage (employer or RAMQ).',
      ),
    ],
    officialSource: 'Official source: ramq.gouv.qc.ca · General information, not legal advice.',
  ),
  '/var-q-c-lease': ProvinceVariantData(
    routePath: '/var-q-c-lease',
    provinceCode: 'QC',
    provinceName: 'Québec',
    title: 'Lease & no deposit',
    subtitle: 'Tenant rights and standard leases in Québec.',
    noticeText:
        'In Québec, landlords cannot legally require a security deposit or post-dated cheques.',
    isWarmAlert: true,
    items: [
      ProvinceStepItem(
        heading: 'Standard TAL lease',
        detail: 'Residential leases must use the official Tribunal administratif du logement (TAL) form.',
      ),
      ProvinceStepItem(
        heading: 'No security deposits',
        detail: 'A landlord can only ask for the first month\'s rent in advance—never a damage deposit.',
      ),
      ProvinceStepItem(
        heading: 'July 1 moving day',
        detail: 'Most Québec leases run July 1 to June 30; give 3-6 months notice if not renewing.',
      ),
    ],
    officialSource: 'Official source: tal.gouv.qc.ca · General information, not legal advice.',
  ),
  '/var-q-c-school': ProvinceVariantData(
    routePath: '/var-q-c-school',
    provinceCode: 'QC',
    provinceName: 'Québec',
    title: 'French-language school',
    subtitle: 'Public schooling rules in Québec (Charter of the French Language).',
    noticeText:
        'Most newcomer children attend French-language public school, with welcome classes (classes d\'accueil) to help them learn French.',
    items: [
      ProvinceStepItem(
        heading: 'Contact your local Centre de services scolaire',
        detail: 'Registration is based on your home address in Québec.',
      ),
      ProvinceStepItem(
        heading: 'Classes d\'accueil',
        detail: 'Free French immersion support is built into public schools for newcomer students.',
      ),
      ProvinceStepItem(
        heading: 'English eligibility',
        detail: 'English public schooling requires a specific Certificate of Eligibility.',
      ),
    ],
    officialSource: 'Official source: quebec.ca/education · General information, not legal advice.',
  ),
  '/var-m-b-not-eligible': ProvinceVariantData(
    routePath: '/var-m-b-not-eligible',
    provinceCode: 'MB',
    provinceName: 'Manitoba',
    title: 'Not covered for your status',
    subtitle: 'Manitoba Health coverage depends on your immigration status.',
    noticeText:
        'Some temporary permits or visitor statuses are not eligible for Manitoba Health.',
    isWarmAlert: true,
    items: [
      ProvinceStepItem(
        heading: 'Check permit requirements',
        detail: 'Work permits generally need to be valid for at least 12 months; study permits have specific rules.',
      ),
      ProvinceStepItem(
        heading: 'Community health access',
        detail: 'Mount Carmel Clinic and other community clinics serve newcomers regardless of coverage.',
      ),
      ProvinceStepItem(
        heading: 'Private coverage',
        detail: 'Arrange private health insurance until your status qualifies for Manitoba Health.',
      ),
    ],
    officialSource: 'Official source: gov.mb.ca/health · General information, not legal advice.',
  ),
};
