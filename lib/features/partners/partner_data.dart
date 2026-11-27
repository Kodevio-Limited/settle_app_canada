/// Tier ordering per R5: Official -> Free help -> Sponsored.
enum ResourceTier { official, freeHelp, sponsored }

extension ResourceTierLabel on ResourceTier {
  String get label => switch (this) {
        ResourceTier.official => 'Official',
        ResourceTier.freeHelp => 'Free help',
        ResourceTier.sponsored => 'Sponsored',
      };
}

class LegalHelpResource {
  final String name;
  final String description;
  final ResourceTier tier;
  final String contactLabel;
  final String? routePath;

  const LegalHelpResource({
    required this.name,
    required this.description,
    required this.tier,
    required this.contactLabel,
    this.routePath,
  });
}

/// Ordered strictly: Official, then Free help, then Sponsored (R5).
const List<LegalHelpResource> legalHelpResources = [
  LegalHelpResource(
    name: 'IRCC Client Support Centre',
    description: 'Official federal immigration information, status checks, and application guides.',
    tier: ResourceTier.official,
    contactLabel: '1-888-242-2100 · canada.ca/immigration',
  ),
  LegalHelpResource(
    name: 'Provincial Legal Aid',
    description: 'Free or low-cost legal representation for eligible newcomers (e.g. Legal Aid Ontario, Legal Aid BC).',
    tier: ResourceTier.freeHelp,
    contactLabel: 'Free clinic intake',
  ),
  LegalHelpResource(
    name: 'Community Settlement Legal Clinics',
    description: 'Free tenant, employment, and immigration advice from community legal workers.',
    tier: ResourceTier.freeHelp,
    contactLabel: '2-1-1 · Free local referral',
  ),
  LegalHelpResource(
    name: 'Licensed Immigration Lawyers & RCICs',
    description: 'Vetted, licensed private practitioners. Always verify CICC or provincial law society registration.',
    tier: ResourceTier.sponsored,
    contactLabel: 'View partner details',
    routePath: '/partner-detail',
  ),
];

class PartnerDetailData {
  final String name;
  final String category;
  final String summary;
  final List<String> whatTheyOffer;
  final String disclosure;

  const PartnerDetailData({
    required this.name,
    required this.category,
    required this.summary,
    required this.whatTheyOffer,
    required this.disclosure,
  });
}

const PartnerDetailData defaultSponsoredPartner = PartnerDetailData(
  name: 'Newcomer Welcome Partner',
  category: 'Sponsored · Newcomer services',
  summary:
      'Licensed or vetted service provider offering newcomer-specific plans and support.',
  whatTheyOffer: [
    'Dedicated newcomer onboarding with no Canadian credit history required',
    'Transparent pricing with no hidden cancellation fees',
    'Multilingual customer support',
  ],
  disclosure:
      'Settle may receive a referral fee if you sign up. Official and free community options are always listed first.',
);
