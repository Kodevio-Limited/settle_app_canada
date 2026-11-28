import 'package:flutter/material.dart';

class ExploreGridCell {
  final String label;
  final String value;
  const ExploreGridCell(this.label, this.value);
}

class ExploreCardEntry {
  final String route;
  final String title;
  final String subtitle;
  final List<String> tags;
  final IconData icon;
  final Color iconBg;
  final String? badge;
  const ExploreCardEntry({
    required this.route,
    required this.title,
    required this.subtitle,
    this.tags = const [],
    required this.icon,
    required this.iconBg,
    this.badge,
  });
}

class ExploreListGroup {
  final String? heading;
  final List<ExploreCardEntry> items;
  const ExploreListGroup({this.heading, required this.items});
}

class ExploreListPageData {
  final String eyebrow;
  final String title;
  final String subtitle;
  final List<String> chips;
  final List<ExploreListGroup> groups;
  final String footerNote;
  const ExploreListPageData({
    required this.eyebrow,
    required this.title,
    required this.subtitle,
    required this.chips,
    required this.groups,
    required this.footerNote,
  });
}

class ExploreDetailPageData {
  final String id;
  final String eyebrow;
  final String title;
  final List<String> tags;
  final Color bannerStart;
  final Color bannerEnd;
  final IconData bannerIcon;
  final List<ExploreGridCell> grid;
  final String sectionTitle;
  final List<String> bullets;
  final bool numbered;
  final String primaryLabel;
  final String? primaryRoute;
  final String secondaryLabel;
  final String sourceTitle;
  final String sourceSubtitle;
  final String? promoCode;
  final bool isSponsored;
  final bool showSecondarySave;

  const ExploreDetailPageData({
    required this.id,
    required this.eyebrow,
    required this.title,
    required this.tags,
    required this.bannerStart,
    required this.bannerEnd,
    required this.bannerIcon,
    required this.grid,
    required this.sectionTitle,
    required this.bullets,
    this.numbered = false,
    required this.primaryLabel,
    this.primaryRoute,
    this.secondaryLabel = 'Save',
    required this.sourceTitle,
    required this.sourceSubtitle,
    this.promoCode,
    this.isSponsored = false,
    this.showSecondarySave = true,
  });
}

const Map<String, ExploreListPageData> kExploreListPages = {
  'events': ExploreListPageData(
    eyebrow: 'EXPLORE · MISSISSAUGA',
    title: 'This weekend',
    subtitle: 'From city, library and settlement-agency calendars.',
    chips: ['This weekend', 'Free', 'Kids', 'Newcomer events'],
    groups: [
      ExploreListGroup(
        heading: 'Saturday [date]',
        items: [
          ExploreCardEntry(
            route: '/explore/fun-skate',
            title: 'Fun skate at Celebration Square',
            subtitle: '2–5 pm · free · bring warm layers',
            tags: ['Free', 'Winter', 'Kids'],
            icon: Icons.ice_skating_rounded,
            iconBg: Color(0xFF426A9E),
          ),
          ExploreCardEntry(
            route: '/explore/welcome-coffee',
            title: 'Newcomer welcome coffee',
            subtitle: 'Settlement agency · 10 am · free',
            tags: ['Free', 'Newcomers'],
            icon: Icons.event_rounded,
            iconBg: Color(0xFF123332),
          ),
        ],
      ),
      ExploreListGroup(
        heading: 'Sunday [date]',
        items: [
          ExploreCardEntry(
            route: '/explore/family-storytime',
            title: 'Family storytime in Arabic and English',
            subtitle: 'Central Library · 11 am',
            tags: ['Free', 'Kids', 'Indoor'],
            icon: Icons.event_rounded,
            iconBg: Color(0xFF6B538C),
          ),
          ExploreCardEntry(
            route: '/explore/winter-walk',
            title: 'Winter walk at Riverwood',
            subtitle: 'Guided · 1 pm · registration may be needed',
            tags: ['Free'],
            icon: Icons.park_rounded,
            iconBg: Color(0xFF2E6B4F),
          ),
        ],
      ),
    ],
    footerNote: 'Event details come from each organizer. Check before you go.',
  ),
  'places': ExploreListPageData(
    eyebrow: 'EXPLORE · MISSISSAUGA',
    title: 'Places to visit',
    subtitle: 'Free and low-cost places to get out and explore.',
    chips: ['All', 'Free', 'Kids', 'Indoor', 'Near transit', 'Winter'],
    groups: [
      ExploreListGroup(
        items: [
          ExploreCardEntry(
            route: '/explore/celebration-square',
            title: 'Mississauga Celebration Square',
            subtitle: 'Events all year · outdoor rink in winter · 2.1 km',
            tags: ['Free', 'Winter', 'Kids'],
            icon: Icons.ice_skating_rounded,
            iconBg: Color(0xFF426A9E),
          ),
          ExploreCardEntry(
            route: '/explore/rattray-marsh',
            title: 'Rattray Marsh Conservation Area',
            subtitle: 'Boardwalk trail by the lake · 6.8 km',
            tags: ['Free', 'Kids'],
            icon: Icons.park_rounded,
            iconBg: Color(0xFF2E6B4F),
          ),
          ExploreCardEntry(
            route: '/explore/port-credit',
            title: 'Port Credit waterfront',
            subtitle: 'Lighthouse, pier and lakeside parks · 7.4 km',
            tags: ['Free'],
            icon: Icons.directions_boat_rounded,
            iconBg: Color(0xFF3A7CA5),
          ),
          ExploreCardEntry(
            route: '/explore/kariya',
            title: 'Kariya Park',
            subtitle: 'Japanese garden near City Centre · 1.2 km',
            tags: ['Free'],
            icon: Icons.nature_rounded,
            iconBg: Color(0xFF2E6B4F),
          ),
          ExploreCardEntry(
            route: '/explore/riverwood',
            title: 'The Riverwood Conservancy',
            subtitle: 'Gardens and forest trails · 5.5 km',
            tags: ['Free', 'Kids'],
            icon: Icons.park_rounded,
            iconBg: Color(0xFF2E6B4F),
          ),
          ExploreCardEntry(
            route: '/explore/pama',
            title: 'PAMA — Peel Art Gallery, Museum + Archives',
            subtitle: 'Downtown Brampton · 18 km',
            tags: ['Library pass', 'Indoor'],
            icon: Icons.museum_rounded,
            iconBg: Color(0xFF6B538C),
          ),
          ExploreCardEntry(
            route: '/explore/niagara',
            title: 'Niagara Falls',
            subtitle: 'About 1.5 hours by car · family day trip',
            tags: ['Day trip'],
            icon: Icons.water_rounded,
            iconBg: Color(0xFF426A9E),
          ),
        ],
      ),
    ],
    footerNote: 'Distances are approximate from your city centre.',
  ),
  'free-passes': ExploreListPageData(
    eyebrow: 'FREE FOR NEWCOMERS',
    title: 'Free passes you can use now',
    subtitle: 'Official and library programs. No sign-up with Settle needed.',
    chips: ['All', 'Free', 'Newcomers', 'Library pass', 'Indoor'],
    groups: [
      ExploreListGroup(
        items: [
          ExploreCardEntry(
            route: '/explore/canoo',
            title: 'Canoo · free first-year membership',
            subtitle: 'New permanent residents and new citizens · Parks Canada + 1,400+ places',
            tags: ['Free', 'Newcomers'],
            icon: Icons.card_membership_rounded,
            iconBg: Color(0xFF123332),
          ),
        ],
      ),
      ExploreListGroup(
        heading: 'Borrow with a Mississauga library card',
        items: [
          ExploreCardEntry(
            route: '/explore/ontario-parks',
            title: 'Ontario Parks day pass',
            subtitle: 'Day-use for one vehicle at 100+ provincial parks',
            tags: ['Library pass', 'Free'],
            icon: Icons.park_rounded,
            iconBg: Color(0xFF2E6B4F),
          ),
          ExploreCardEntry(
            route: '/explore/conservation',
            title: 'Conservation parks pass',
            subtitle: 'Credit Valley + TRCA parks · up to 6 people in one car',
            tags: ['Library pass', 'Free'],
            icon: Icons.forest_rounded,
            iconBg: Color(0xFF2E6B4F),
          ),
          ExploreCardEntry(
            route: '/explore/pama-pass',
            title: 'PAMA family pass',
            subtitle: '2 adults and 5 children · Brampton',
            tags: ['Library pass', 'Indoor'],
            icon: Icons.museum_rounded,
            iconBg: Color(0xFF6B538C),
          ),
          ExploreCardEntry(
            route: '/explore/rom-pass',
            title: 'Royal Ontario Museum family pass',
            subtitle: 'Up to 4 visitors · Toronto',
            tags: ['Library pass', 'Indoor'],
            icon: Icons.account_balance_rounded,
            iconBg: Color(0xFFA82227),
          ),
          ExploreCardEntry(
            route: '/explore/swim-skate',
            title: 'City swim & skate pass',
            subtitle: 'Up to 5 people · city pools and arenas',
            tags: ['Library pass', 'Kids'],
            icon: Icons.ice_skating_rounded,
            iconBg: Color(0xFF426A9E),
          ),
        ],
      ),
    ],
    footerNote: 'Need a library card? Visit any Mississauga Library branch.',
  ),
  'offers': ExploreListPageData(
    eyebrow: 'EXPLORE · OFFERS',
    title: 'Newcomer offers',
    subtitle: 'Offers are paid placements from partners and are always labelled Sponsored. Partners never see your answers or your family details.',
    chips: ['All', 'Banking', 'Phone & internet', 'Home', 'Winter gear', 'Groceries'],
    groups: [
      ExploreListGroup(
        items: [
          ExploreCardEntry(
            route: '/explore/partner-winter-coats',
            title: '[Partner store] · winter coats and boots',
            subtitle: '[Offer] for newcomer families · ends [date]',
            badge: 'Sponsored',
            icon: Icons.local_offer_rounded,
            iconBg: Color(0xFF6B7280),
          ),
          ExploreCardEntry(
            route: '/explore/bank',
            title: 'Newcomer banking package',
            subtitle: 'From [Partner bank] · for people new to Canada',
            badge: 'Sponsored',
            icon: Icons.account_balance_wallet_rounded,
            iconBg: Color(0xFF123332),
          ),
          ExploreCardEntry(
            route: '/explore/telecom',
            title: 'Phone plan for newcomers',
            subtitle: 'From [Partner telecom] · no Canadian credit history needed',
            badge: 'Sponsored',
            icon: Icons.phone_android_rounded,
            iconBg: Color(0xFF426A9E),
          ),
          ExploreCardEntry(
            route: '/explore/furniture',
            title: '[Offer] for your first home',
            subtitle: 'From [Partner furniture store] · delivery in Peel',
            badge: 'Sponsored',
            icon: Icons.chair_rounded,
            iconBg: Color(0xFF2E6B4F),
          ),
        ],
      ),
    ],
    footerNote: 'Settle is paid to show Sponsored offers. We never sell your personal data.',
  ),
  'your-first-winter': ExploreListPageData(
    eyebrow: 'FIRST WINTER',
    title: 'Make winter something to look forward to',
    subtitle: 'Many newcomers find the first winter hard. Getting outside, even for a short time, and meeting people both help.',
    chips: ['All', 'Free', 'Kids', 'Indoor', 'Winter'],
    groups: [
      ExploreListGroup(
        items: [
          ExploreCardEntry(
            route: '/explore/swim-skate',
            title: 'Try skating for free',
            subtitle: 'Outdoor rinks and city fun skates · swim & skate pass from the library',
            tags: ['Free', 'Kids', 'Winter'],
            icon: Icons.ice_skating_rounded,
            iconBg: Color(0xFF426A9E),
          ),
          ExploreCardEntry(
            route: '/explore/places',
            title: 'Go tobogganing',
            subtitle: 'City hills · bring a sled or borrow one [confirm]',
            tags: ['Free', 'Kids'],
            icon: Icons.park_rounded,
            iconBg: Color(0xFF2E6B4F),
          ),
          ExploreCardEntry(
            route: '/explore/free-passes',
            title: 'Warm indoor days',
            subtitle: 'Libraries, museums and community centres',
            tags: ['Indoor'],
            icon: Icons.account_balance_rounded,
            iconBg: Color(0xFFA82227),
          ),
          ExploreCardEntry(
            route: '/help',
            title: 'Find winter clothing',
            subtitle: 'Free from community groups · offers from partners',
            tags: ['Free'],
            icon: Icons.checkroom_rounded,
            iconBg: Color(0xFF123332),
          ),
        ],
      ),
    ],
    footerNote: "Feeling low for weeks is common in winter. You don't have to manage it alone.",
  ),
};

const Map<String, ExploreDetailPageData> kExploreDetailPages = {
  'fun-skate': ExploreDetailPageData(
    id: 'fun-skate',
    eyebrow: 'EVENT · SATURDAY [DATE]',
    title: 'Fun skate at Celebration Square',
    tags: ['Free', 'Winter', 'Kids'],
    bannerStart: Color(0xFF3E639C),
    bannerEnd: Color(0xFF123332),
    bannerIcon: Icons.ice_skating_rounded,
    grid: [
      ExploreGridCell('When', 'Sat [date] · 2–5 pm'),
      ExploreGridCell('Where', 'Celebration Square'),
      ExploreGridCell('Cost', 'Free'),
      ExploreGridCell('Skates', 'Bring or rent [confirm]'),
    ],
    sectionTitle: 'Good to know',
    bullets: [
      'Helmets recommended for children',
      "Dress in layers — it's colder standing still",
      'Your first time? Hold the boards and go slowly',
    ],
    primaryLabel: 'Add to calendar',
    primaryRoute: '/calendar',
    sourceTitle: 'Organizer · City of Mississauga',
    sourceSubtitle: 'Events calendar · Last verified [DATE]',
  ),
  'welcome-coffee': ExploreDetailPageData(
    id: 'welcome-coffee',
    eyebrow: 'EVENT · SATURDAY [DATE]',
    title: 'Newcomer welcome coffee',
    tags: ['Free', 'Newcomers'],
    bannerStart: Color(0xFF123332),
    bannerEnd: Color(0xFF0B2221),
    bannerIcon: Icons.calendar_today_rounded,
    grid: [
      ExploreGridCell('When', 'Sat [date] · 10 am'),
      ExploreGridCell('Where', '[Settlement agency]'),
      ExploreGridCell('Cost', 'Free'),
      ExploreGridCell('Language', '[Languages offered]'),
    ],
    sectionTitle: 'Good to know',
    bullets: [
      'Meet other newcomers and a settlement worker',
      'Ask about free services you may qualify for',
      'Children welcome [confirm]',
    ],
    primaryLabel: 'Add to calendar',
    primaryRoute: '/calendar',
    sourceTitle: 'Organizer · [Settlement agency]',
    sourceSubtitle: 'Events calendar · Last verified [DATE]',
  ),
  'family-storytime': ExploreDetailPageData(
    id: 'family-storytime',
    eyebrow: 'EVENT · SUNDAY [DATE]',
    title: 'Family storytime in Arabic and English',
    tags: ['Free', 'Kids', 'Indoor'],
    bannerStart: Color(0xFF5A4E7C),
    bannerEnd: Color(0xFF123332),
    bannerIcon: Icons.calendar_today_rounded,
    grid: [
      ExploreGridCell('When', 'Sun [date] · 11 am'),
      ExploreGridCell('Where', 'Central Library'),
      ExploreGridCell('Cost', 'Free'),
      ExploreGridCell('Ages', '[Ages from organizer]'),
    ],
    sectionTitle: 'Good to know',
    bullets: [
      'Registration: [from organizer]',
      'Children must come with an adult [example]',
      'Next to Celebration Square — MiWay City Centre terminal',
    ],
    primaryLabel: 'Add to calendar',
    primaryRoute: '/calendar',
    sourceTitle: 'Organizer · Mississauga Library',
    sourceSubtitle: 'Events calendar · Last verified [DATE]',
  ),
  'winter-walk': ExploreDetailPageData(
    id: 'winter-walk',
    eyebrow: 'EVENT · SUNDAY [DATE]',
    title: 'Guided winter walk at Riverwood',
    tags: ['Free'],
    bannerStart: Color(0xFF2E6B4F),
    bannerEnd: Color(0xFF123332),
    bannerIcon: Icons.park_rounded,
    grid: [
      ExploreGridCell('When', 'Sun [date] · 1 pm'),
      ExploreGridCell('Where', 'The Riverwood Conservancy'),
      ExploreGridCell('Cost', 'Free'),
      ExploreGridCell('Sign-up', 'May be needed'),
    ],
    sectionTitle: 'Good to know',
    bullets: [
      'Wear boots with grip',
      'About an hour on easy trails',
      'Learn which animals stay active in winter',
    ],
    primaryLabel: 'Add to calendar',
    primaryRoute: '/calendar',
    sourceTitle: 'Organizer · The Riverwood Conservancy',
    sourceSubtitle: 'Events calendar · Last verified [DATE]',
  ),
  'celebration-square': ExploreDetailPageData(
    id: 'celebration-square',
    eyebrow: 'PLACE · MISSISSAUGA',
    title: 'Mississauga Celebration Square',
    tags: ['Free', 'Winter', 'Kids'],
    bannerStart: Color(0xFF3E639C),
    bannerEnd: Color(0xFF123332),
    bannerIcon: Icons.ice_skating_rounded,
    grid: [
      ExploreGridCell('Cost', 'Free entry'),
      ExploreGridCell('Distance', '2.1 km'),
      ExploreGridCell('Transit', 'MiWay · City Centre terminal'),
      ExploreGridCell('Good for', 'Families, all ages'),
    ],
    sectionTitle: 'Why newcomers go',
    bullets: [
      'Free outdoor skating rink in winter and wading pool in summer',
      'Free festivals, movies and concerts all year',
      'Right beside Central Library and Square One',
    ],
    primaryLabel: 'Directions',
    sourceTitle: 'Official site · City of Mississauga',
    sourceSubtitle: 'Celebration Square · Last verified [DATE]',
  ),
  'rattray-marsh': ExploreDetailPageData(
    id: 'rattray-marsh',
    eyebrow: 'PLACE · MISSISSAUGA',
    title: 'Rattray Marsh Conservation Area',
    tags: ['Free', 'Kids'],
    bannerStart: Color(0xFF2E6B4F),
    bannerEnd: Color(0xFF123332),
    bannerIcon: Icons.park_rounded,
    grid: [
      ExploreGridCell('Cost', 'Free'),
      ExploreGridCell('Distance', '6.8 km'),
      ExploreGridCell('Trail', 'Boardwalk by the lake'),
      ExploreGridCell('Run by', 'Credit Valley Conservation'),
    ],
    sectionTitle: 'Why go',
    bullets: [
      'One of the last lakeside marshes on western Lake Ontario',
      'Flat boardwalk loop — easy with children',
    ],
    primaryLabel: 'Directions',
    sourceTitle: 'Official site · Credit Valley Conservation',
    sourceSubtitle: 'Park page · Last verified [DATE]',
  ),
  'port-credit': ExploreDetailPageData(
    id: 'port-credit',
    eyebrow: 'PLACE · MISSISSAUGA',
    title: 'Port Credit waterfront',
    tags: ['Free'],
    bannerStart: Color(0xFF3A7CA5),
    bannerEnd: Color(0xFF123332),
    bannerIcon: Icons.directions_boat_rounded,
    grid: [
      ExploreGridCell('Cost', 'Free'),
      ExploreGridCell('Distance', '7.4 km'),
      ExploreGridCell('Transit', 'GO Lakeshore West · Port Credit'),
      ExploreGridCell('Good for', 'Walks, sunsets, cafés'),
    ],
    sectionTitle: 'Why go',
    bullets: [
      'Lighthouse, pier and lakeside parks',
      'Walkable village with shops and restaurants',
      'Summer festivals on the water',
    ],
    primaryLabel: 'Directions',
    sourceTitle: 'Official site · Visit Mississauga',
    sourceSubtitle: 'Port Credit guide · Last verified [DATE]',
  ),
  'kariya': ExploreDetailPageData(
    id: 'kariya',
    eyebrow: 'PLACE · MISSISSAUGA',
    title: 'Kariya Park',
    tags: ['Free'],
    bannerStart: Color(0xFF2E6B4F),
    bannerEnd: Color(0xFF123332),
    bannerIcon: Icons.nature_rounded,
    grid: [
      ExploreGridCell('Cost', 'Free'),
      ExploreGridCell('Distance', '1.2 km'),
      ExploreGridCell('Transit', 'Near City Centre'),
      ExploreGridCell('Good for', 'A quiet walk'),
    ],
    sectionTitle: 'Why go',
    bullets: [
      "A Japanese-style garden honouring Mississauga's sister city, Kariya, Japan",
      'Ponds, bridges and cherry blossoms in spring',
      'Close to Square One and the Central Library',
    ],
    primaryLabel: 'Directions',
    sourceTitle: 'Official site · City of Mississauga',
    sourceSubtitle: 'Kariya Park · Last verified [DATE]',
  ),
  'riverwood': ExploreDetailPageData(
    id: 'riverwood',
    eyebrow: 'PLACE · MISSISSAUGA',
    title: 'The Riverwood Conservancy',
    tags: ['Free', 'Kids'],
    bannerStart: Color(0xFF2E6B4F),
    bannerEnd: Color(0xFF123332),
    bannerIcon: Icons.park_rounded,
    grid: [
      ExploreGridCell('Cost', 'Free'),
      ExploreGridCell('Distance', '5.5 km'),
      ExploreGridCell('Where', 'On the Credit River'),
      ExploreGridCell('Good for', 'Gardens and trails'),
    ],
    sectionTitle: 'Why go',
    bullets: [
      'Gardens and forest trails in the middle of the city',
      'Guided walks and nature programs, some free',
    ],
    primaryLabel: 'Directions',
    sourceTitle: 'Official site · The Riverwood Conservancy',
    sourceSubtitle: 'Visit page · Last verified [DATE]',
  ),
  'pama': ExploreDetailPageData(
    id: 'pama',
    eyebrow: 'PLACE · BRAMPTON',
    title: 'PAMA — Peel Art Gallery, Museum + Archives',
    tags: ['Library pass', 'Indoor'],
    bannerStart: Color(0xFF6B538C),
    bannerEnd: Color(0xFF123332),
    bannerIcon: Icons.museum_rounded,
    grid: [
      ExploreGridCell('Cost', 'Free with a library pass'),
      ExploreGridCell('Where', 'Downtown Brampton'),
      ExploreGridCell('Distance', '18 km'),
      ExploreGridCell('Good for', 'Art and Peel history'),
    ],
    sectionTitle: 'Why go',
    bullets: [
      "Exhibitions about Peel's history and its many communities",
      'Family workshops and indoor activities on weekends',
    ],
    primaryLabel: 'Directions',
    sourceTitle: 'Official site · PAMA',
    sourceSubtitle: 'Hours and admission · Last verified [DATE]',
  ),
  'niagara': ExploreDetailPageData(
    id: 'niagara',
    eyebrow: 'PLACE · DAY TRIP',
    title: 'Niagara Falls',
    tags: ['Day trip'],
    bannerStart: Color(0xFF426A9E),
    bannerEnd: Color(0xFF123332),
    bannerIcon: Icons.water_rounded,
    grid: [
      ExploreGridCell('Cost', 'Free to see the falls'),
      ExploreGridCell('Distance', 'About 1.5 hours by car'),
      ExploreGridCell('Transit', 'GO train or bus from Toronto [confirm]'),
      ExploreGridCell('Good for', 'A family day trip'),
    ],
    sectionTitle: 'Why go',
    bullets: [
      "See one of the world's best-known waterfalls",
      'Walk along the Niagara Parkway',
    ],
    primaryLabel: 'Directions',
    sourceTitle: 'Official site · Niagara Parks',
    sourceSubtitle: 'Visitor guide · Last verified [DATE]',
  ),
  'canoo': ExploreDetailPageData(
    id: 'canoo',
    eyebrow: 'FREE FOR NEWCOMERS',
    title: 'Canoo: free entry for your first year',
    tags: ['Free', 'Newcomers'],
    bannerStart: Color(0xFF123332),
    bannerEnd: Color(0xFF0A1F1E),
    bannerIcon: Icons.card_membership_rounded,
    grid: [
      ExploreGridCell('For', 'New PRs & citizens'),
      ExploreGridCell('Cost', 'Free'),
      ExploreGridCell('Lasts', '1 year'),
      ExploreGridCell('Places', '1,400+ & Parks Canada'),
    ],
    sectionTitle: 'What it includes',
    bullets: [
      'Free admission to Parks Canada places for you and up to 4 children',
      'Free or discounted entry to 1,400+ museums, galleries and science centres',
      'Discounts on VIA Rail and other Canadian experiences',
    ],
    primaryLabel: 'Get Canoo',
    sourceTitle: 'Official source · Institute for Canadian Citizenship',
    sourceSubtitle: 'Canoo program · Last verified [DATE]',
  ),
  'ontario-parks': ExploreDetailPageData(
    id: 'ontario-parks',
    eyebrow: 'LIBRARY PASS · FREE',
    title: 'Ontario Parks day pass',
    tags: ['Library pass', 'Free'],
    bannerStart: Color(0xFF2E6B4F),
    bannerEnd: Color(0xFF123332),
    bannerIcon: Icons.park_rounded,
    grid: [
      ExploreGridCell('Covers', 'One vehicle and everyone in it'),
      ExploreGridCell('Where', '100+ provincial parks'),
      ExploreGridCell('Loan', '7 days'),
      ExploreGridCell('Cost', 'Free'),
    ],
    sectionTitle: 'How to get it',
    numbered: true,
    bullets: [
      'Get free library cards for your family.',
      'Borrow the pass online or at a branch. Up to 2 passes per card.',
      'Return it within 7 days.',
    ],
    primaryLabel: 'Get free library cards',
    primaryRoute: '/task/library',
    sourceTitle: 'Official source · Mississauga Library',
    sourceSubtitle: 'Park and PAMA passes · Last verified [DATE]',
  ),
  'conservation': ExploreDetailPageData(
    id: 'conservation',
    eyebrow: 'LIBRARY PASS · FREE',
    title: 'Conservation parks pass',
    tags: ['Library pass', 'Free'],
    bannerStart: Color(0xFF2E6B4F),
    bannerEnd: Color(0xFF123332),
    bannerIcon: Icons.forest_rounded,
    grid: [
      ExploreGridCell('Covers', 'Up to 6 people in one vehicle'),
      ExploreGridCell('Where', 'Credit Valley and TRCA parks'),
      ExploreGridCell('Loan', '7 days'),
      ExploreGridCell('Cost', 'Free'),
    ],
    sectionTitle: 'How to get it',
    numbered: true,
    bullets: [
      'Get free library cards for your family.',
      'Borrow the pass online or at a branch. Up to 2 passes per card.',
      'Return it within 7 days.',
    ],
    primaryLabel: 'Get free library cards',
    primaryRoute: '/task/library',
    sourceTitle: 'Official source · Mississauga Library',
    sourceSubtitle: 'Park and PAMA passes · Last verified [DATE]',
  ),
  'pama-pass': ExploreDetailPageData(
    id: 'pama-pass',
    eyebrow: 'LIBRARY PASS · FREE',
    title: 'PAMA family pass',
    tags: ['Library pass', 'Indoor'],
    bannerStart: Color(0xFF6B538C),
    bannerEnd: Color(0xFF123332),
    bannerIcon: Icons.museum_rounded,
    grid: [
      ExploreGridCell('Covers', '2 adults and 5 children'),
      ExploreGridCell('Where', 'PAMA, Brampton'),
      ExploreGridCell('Loan', '7 days'),
      ExploreGridCell('Cost', 'Free'),
    ],
    sectionTitle: 'How to get it',
    numbered: true,
    bullets: [
      'Get free library cards for your family.',
      'Borrow the pass online or at a branch. Up to 2 passes per card.',
      'Return it within 7 days.',
    ],
    primaryLabel: 'Get free library cards',
    primaryRoute: '/task/library',
    sourceTitle: 'Official source · Mississauga Library',
    sourceSubtitle: 'Park and PAMA passes · Last verified [DATE]',
  ),
  'rom-pass': ExploreDetailPageData(
    id: 'rom-pass',
    eyebrow: 'LIBRARY PASS · FREE',
    title: 'Royal Ontario Museum family pass',
    tags: ['Indoor'],
    bannerStart: Color(0xFFA82227),
    bannerEnd: Color(0xFF123332),
    bannerIcon: Icons.account_balance_rounded,
    grid: [
      ExploreGridCell('Covers', 'Up to 4 visitors'),
      ExploreGridCell('Loan', '7 days'),
      ExploreGridCell('Limit', '2 passes per card'),
      ExploreGridCell('Cost', 'Free'),
    ],
    sectionTitle: 'How to get it',
    numbered: true,
    bullets: [
      'Get free library cards for your family.',
      'Borrow the pass in the library app or at a branch.',
      'Show your checkout receipt and ID at the museum.',
    ],
    primaryLabel: 'Get free library cards',
    primaryRoute: '/task/library',
    sourceTitle: 'Official source · Mississauga Library',
    sourceSubtitle: 'Park and PAMA passes · Last verified [DATE]',
  ),
  'swim-skate': ExploreDetailPageData(
    id: 'swim-skate',
    eyebrow: 'LIBRARY PASS · FREE',
    title: 'City swim & skate pass',
    tags: ['Library pass', 'Kids'],
    bannerStart: Color(0xFF426A9E),
    bannerEnd: Color(0xFF123332),
    bannerIcon: Icons.ice_skating_rounded,
    grid: [
      ExploreGridCell('Covers', '5 people'),
      ExploreGridCell('Where', 'City pools and arenas'),
      ExploreGridCell('Loan', '7 days'),
      ExploreGridCell('Cost', 'Free'),
    ],
    sectionTitle: 'How to get it',
    numbered: true,
    bullets: [
      'An adult borrows it and signs a waiver.',
      'Use it for drop-in fun swims and fun skates.',
      "Return it within 7 days. It can't be put on hold.",
    ],
    primaryLabel: 'Get free library cards',
    primaryRoute: '/task/library',
    sourceTitle: 'Official source · Mississauga Library',
    sourceSubtitle: 'Park and PAMA passes · Last verified [DATE]',
  ),
  'partner-winter-coats': ExploreDetailPageData(
    id: 'partner-winter-coats',
    eyebrow: 'OFFER',
    title: '[Offer] on winter coats and boots',
    tags: ['Sponsored'],
    bannerStart: Color(0xFF4B5563),
    bannerEnd: Color(0xFF1F2937),
    bannerIcon: Icons.local_offer_rounded,
    promoCode: '[CODE]',
    isSponsored: true,
    grid: [
      ExploreGridCell('Ends', '[date]'),
      ExploreGridCell('Where', 'In store and online'),
      ExploreGridCell('Who', 'Anyone with the code'),
      ExploreGridCell('From', '[Partner store]'),
    ],
    sectionTitle: 'Terms',
    bullets: [
      '[Partner terms — checked by Settle before publishing]',
      'Show at checkout or enter online',
    ],
    primaryLabel: 'Go to partner site',
    primaryRoute: '/partner-detail',
    sourceTitle: 'How we choose partners',
    sourceSubtitle: 'Settle editorial policy',
  ),
  'bank': ExploreDetailPageData(
    id: 'bank',
    eyebrow: 'OFFER',
    title: 'Newcomer banking package',
    tags: ['Sponsored'],
    bannerStart: Color(0xFF123332),
    bannerEnd: Color(0xFF0A1F1E),
    bannerIcon: Icons.account_balance_wallet_rounded,
    isSponsored: true,
    grid: [
      ExploreGridCell('Ends', '[date]'),
      ExploreGridCell('How', 'Open an account in branch or online'),
      ExploreGridCell('Who', '[Eligibility from partner]'),
      ExploreGridCell('Proof needed', '[From partner]'),
    ],
    sectionTitle: 'Terms',
    bullets: [
      '[Partner terms — checked by Settle before publishing]',
      'Monthly fees may apply after the offer ends',
    ],
    primaryLabel: 'Open a bank account',
    primaryRoute: '/task/bank',
    sourceTitle: 'How we choose partners',
    sourceSubtitle: 'Settle is paid to show this offer.',
  ),
  'telecom': ExploreDetailPageData(
    id: 'telecom',
    eyebrow: 'OFFER',
    title: 'Phone plan for newcomers',
    tags: ['Sponsored'],
    bannerStart: Color(0xFF426A9E),
    bannerEnd: Color(0xFF123332),
    bannerIcon: Icons.phone_android_rounded,
    isSponsored: true,
    grid: [
      ExploreGridCell('Ends', '[date]'),
      ExploreGridCell('Plan', '[Data and price]'),
      ExploreGridCell('Contract', '[Length]'),
      ExploreGridCell('Credit check', '[Yes/No]'),
    ],
    sectionTitle: 'Terms',
    bullets: [
      '[Partner terms]',
      'Check the price after any promo period',
    ],
    primaryLabel: 'Go to partner site',
    primaryRoute: '/partner-detail',
    sourceTitle: 'How we choose partners',
    sourceSubtitle: 'Settle is paid to show this offer.',
  ),
  'furniture': ExploreDetailPageData(
    id: 'furniture',
    eyebrow: 'OFFER',
    title: '[Offer] for your first home',
    tags: ['Sponsored'],
    bannerStart: Color(0xFF2E6B4F),
    bannerEnd: Color(0xFF123332),
    bannerIcon: Icons.chair_rounded,
    isSponsored: true,
    grid: [
      ExploreGridCell('Ends', '[date]'),
      ExploreGridCell('Where', 'In store and online'),
      ExploreGridCell('Delivery', 'Peel Region'),
      ExploreGridCell('Code', 'Shown at checkout'),
    ],
    sectionTitle: 'Terms',
    bullets: [
      '[Partner terms]',
      'Free furniture is often available through community groups and settlement agencies.',
    ],
    primaryLabel: 'Ask for free help',
    primaryRoute: '/help',
    sourceTitle: 'How we choose partners',
    sourceSubtitle: 'Settle is paid to show this offer.',
  ),
};
