// GENERATED EXPLORE SCREENS DATA
class ExploreItem {
  final String title;
  final String sub;
  final String badge;
  final String href;
  const ExploreItem({required this.title, required this.sub, required this.badge, required this.href});
}

class ExploreSection {
  final String title;
  final List<ExploreItem> items;
  const ExploreSection({required this.title, required this.items});
}

class ExploreScreenModel {
  final String id;
  final String title;
  final String tag;
  final String desc;
  final List<ExploreSection> sections;
  const ExploreScreenModel({required this.id, required this.title, required this.tag, required this.desc, required this.sections});
}

const Map<String, ExploreScreenModel> allExploreScreens = {
  'Explore': ExploreScreenModel(
    id: 'Explore',
    title: 'Things to do and save on',
    tag: 'Free for newcomers',
    desc: 'Free places, family days out and newcomer offers near you. Based on your city, not your exact location.',
    sections: [
      ExploreSection(
        title: 'This weekend',
        items: [
          ExploreItem(title: 'See all', sub: '', badge: '', href: 'ExploreEvents.dc.html'),
        ],
      ),
      ExploreSection(
        title: 'Places to visit',
        items: [
          ExploreItem(title: 'See all', sub: '', badge: '', href: 'ExplorePlaces.dc.html'),
        ],
      ),
      ExploreSection(
        title: 'Newcomer offers',
        items: [
          ExploreItem(title: 'See all', sub: '', badge: '', href: 'ExploreOffers.dc.html'),
        ],
      ),
    ],
  ),
  'ExploreCanoo': ExploreScreenModel(
    id: 'ExploreCanoo',
    title: 'Canoo: free entry for your first year',
    tag: 'Free for newcomers',
    desc: '',
    sections: [
      ExploreSection(
        title: 'What it includes',
        items: [
          ExploreItem(title: 'Free admission to Parks Canada national parks and historic sites', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Free entry to 1,400+ museums, galleries and attractions that take part', sub: '', badge: '', href: ''),
          ExploreItem(title: 'At Parks Canada, your membership also covers up to 4 children under 18', sub: '', badge: '', href: ''),
        ],
      ),
      ExploreSection(
        title: 'How to get it',
        items: [
          ExploreItem(title: '1Download the free Canoo app.', sub: '', badge: '', href: ''),
          ExploreItem(title: '2Create an account and verify your permanent resident status.', sub: '', badge: '', href: ''),
          ExploreItem(title: '3Check in with the app when you visit.', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
  'ExploreCity': ExploreScreenModel(
    id: 'ExploreCity',
    title: 'Where should we look?',
    tag: 'Explore',
    desc: 'Location is off, so we use the city you choose. Settle only ever uses your approximate area.',
    sections: [
      ExploreSection(
        title: 'From your plan',
        items: [
        ],
      ),
      ExploreSection(
        title: 'Nearby cities',
        items: [
        ],
      ),
    ],
  ),
  'ExploreEvents': ExploreScreenModel(
    id: 'ExploreEvents',
    title: 'This weekend',
    tag: 'Explore · Mississauga',
    desc: 'From city, library and settlement-agency calendars.',
    sections: [
      ExploreSection(
        title: 'Saturday [date]',
        items: [
        ],
      ),
      ExploreSection(
        title: 'Sunday [date]',
        items: [
        ],
      ),
    ],
  ),
  'ExploreFilters': ExploreScreenModel(
    id: 'ExploreFilters',
    title: 'Filter',
    tag: '',
    desc: '',
    sections: [
      ExploreSection(
        title: 'Show',
        items: [
          ExploreItem(title: 'Reset', sub: '', badge: '', href: 'Explore.dc.html'),
          ExploreItem(title: 'Show 18 results', sub: '', badge: '', href: 'Explore.dc.html'),
        ],
      ),
      ExploreSection(
        title: 'Cost',
        items: [
          ExploreItem(title: 'Reset', sub: '', badge: '', href: 'Explore.dc.html'),
          ExploreItem(title: 'Show 18 results', sub: '', badge: '', href: 'Explore.dc.html'),
        ],
      ),
      ExploreSection(
        title: 'Good for',
        items: [
          ExploreItem(title: 'Reset', sub: '', badge: '', href: 'Explore.dc.html'),
          ExploreItem(title: 'Show 18 results', sub: '', badge: '', href: 'Explore.dc.html'),
        ],
      ),
      ExploreSection(
        title: 'Getting there',
        items: [
          ExploreItem(title: 'Reset', sub: '', badge: '', href: 'Explore.dc.html'),
          ExploreItem(title: 'Show 18 results', sub: '', badge: '', href: 'Explore.dc.html'),
        ],
      ),
      ExploreSection(
        title: 'Distance',
        items: [
          ExploreItem(title: 'Reset', sub: '', badge: '', href: 'Explore.dc.html'),
          ExploreItem(title: 'Show 18 results', sub: '', badge: '', href: 'Explore.dc.html'),
        ],
      ),
    ],
  ),
  'ExploreFreePasses': ExploreScreenModel(
    id: 'ExploreFreePasses',
    title: 'Free passes you can use now',
    tag: 'Free for newcomers',
    desc: 'Official and library programs. No sign-up with Settle needed.',
    sections: [
      ExploreSection(
        title: 'Borrow with a Mississauga library card',
        items: [
        ],
      ),
    ],
  ),
  'ExploreOffers': ExploreScreenModel(
    id: 'ExploreOffers',
    title: 'Newcomer offers',
    tag: 'Explore · Offers',
    desc: 'Offers are paid placements from partners and are always labelled Sponsored. Partners never see your answers or your family details.',
    sections: [
      ExploreSection(
        title: 'How offers work',
        items: [
          ExploreItem(title: 'Learn more', sub: '', badge: '', href: 'HowPartners.dc.html'),
        ],
      ),
    ],
  ),
  'ExplorePlace': ExploreScreenModel(
    id: 'ExplorePlace',
    title: 'Mississauga Celebration Square',
    tag: 'Place · Mississauga',
    desc: '',
    sections: [
      ExploreSection(
        title: 'Why newcomers go',
        items: [
          ExploreItem(title: 'Free concerts, festivals and cultural events through the year', sub: '', badge: '', href: ''),
          ExploreItem(title: 'An outdoor skating rink in winter — try your first skate', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Next to the Central Library and Square One', sub: '', badge: '', href: ''),
        ],
      ),
      ExploreSection(
        title: 'Before you go',
        items: [
          ExploreItem(title: 'Check the events calendar for dates and rink hours', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Skate rental or bring your own — dress warmly', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Accessible paths and washrooms nearby [confirm]', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
  'ExplorePlaces': ExploreScreenModel(
    id: 'ExplorePlaces',
    title: 'Places to visit',
    tag: 'Explore · Mississauga',
    desc: '',
    sections: [
    ],
  ),
  'ExploreSaved': ExploreScreenModel(
    id: 'ExploreSaved',
    title: 'Saved',
    tag: 'Explore',
    desc: '',
    sections: [
    ],
  ),
  'ExploreWinter': ExploreScreenModel(
    id: 'ExploreWinter',
    title: 'Make winter something to look forward to',
    tag: 'Your first winter',
    desc: 'Many newcomers find the first winter hard. Getting outside, even for a short time, and meeting people both help.',
    sections: [
    ],
  ),
  'OfferDetail': ExploreScreenModel(
    id: 'OfferDetail',
    title: '[Offer] on winter coats and boots',
    tag: 'Offer',
    desc: 'From [Partner store]. For newcomer families in Ontario.',
    sections: [
      ExploreSection(
        title: 'Terms',
        items: [
          ExploreItem(title: '[Partner terms — supplied by the partner, checked by Settle before publishing]', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Can\'t be combined with other offers [example]', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
  'EventSkate': ExploreScreenModel(
    id: 'EventSkate',
    title: 'Fun skate at Celebration Square',
    tag: 'Event · Saturday [date]',
    desc: '',
    sections: [
      ExploreSection(
        title: 'Good to know',
        items: [
          ExploreItem(title: 'Helmets recommended for children', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Dress in layers — it\'s colder standing still', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Your first time? Hold the boards and go slowly', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
  'EventWelcome': ExploreScreenModel(
    id: 'EventWelcome',
    title: 'Newcomer welcome coffee',
    tag: 'Event · Saturday [date]',
    desc: '',
    sections: [
      ExploreSection(
        title: 'Good to know',
        items: [
          ExploreItem(title: 'Meet other newcomers and a settlement worker', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Ask about free services you may qualify for', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Children welcome [confirm]', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
  'EventWinterWalk': ExploreScreenModel(
    id: 'EventWinterWalk',
    title: 'Guided winter walk at Riverwood',
    tag: 'Event · Sunday [date]',
    desc: '',
    sections: [
      ExploreSection(
        title: 'Good to know',
        items: [
          ExploreItem(title: 'Wear boots with grip', sub: '', badge: '', href: ''),
          ExploreItem(title: 'About an hour on easy trails', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Learn which animals stay active in winter', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
  'OfferBank': ExploreScreenModel(
    id: 'OfferBank',
    title: 'Newcomer banking package',
    tag: 'Offer',
    desc: 'From [Partner bank]. For people new to Canada.',
    sections: [
      ExploreSection(
        title: 'Terms',
        items: [
          ExploreItem(title: '[Partner terms — checked by Settle before publishing]', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Monthly fees may apply after the offer ends', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
  'OfferFurniture': ExploreScreenModel(
    id: 'OfferFurniture',
    title: '[Offer] for your first home',
    tag: 'Offer',
    desc: 'From [Partner furniture store]. Delivery in Peel.',
    sections: [
      ExploreSection(
        title: 'Terms',
        items: [
          ExploreItem(title: '[Partner terms]', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
  'OfferPhone': ExploreScreenModel(
    id: 'OfferPhone',
    title: 'Phone plan for newcomers',
    tag: 'Offer',
    desc: 'From [Partner telecom]. No Canadian credit history needed.',
    sections: [
      ExploreSection(
        title: 'Terms',
        items: [
          ExploreItem(title: '[Partner terms]', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Check the price after any promo period', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
  'PassConservation': ExploreScreenModel(
    id: 'PassConservation',
    title: 'Conservation parks pass',
    tag: 'Library pass · free',
    desc: '',
    sections: [
      ExploreSection(
        title: 'How to get it',
        items: [
          ExploreItem(title: '1Get free library cards for your family.', sub: '', badge: '', href: ''),
          ExploreItem(title: '2Borrow the pass online or at a branch. Up to 2 passes per card.', sub: '', badge: '', href: ''),
          ExploreItem(title: '3Return it within 7 days.', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
  'PassOntarioParks': ExploreScreenModel(
    id: 'PassOntarioParks',
    title: 'Ontario Parks day pass',
    tag: 'Library pass · free',
    desc: '',
    sections: [
      ExploreSection(
        title: 'How to get it',
        items: [
          ExploreItem(title: '1Get free library cards for your family.', sub: '', badge: '', href: ''),
          ExploreItem(title: '2Borrow the pass online or at a branch. Up to 2 passes per card.', sub: '', badge: '', href: ''),
          ExploreItem(title: '3Return it within 7 days.', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
  'PassPAMA': ExploreScreenModel(
    id: 'PassPAMA',
    title: 'PAMA family pass',
    tag: 'Library pass · free',
    desc: '',
    sections: [
      ExploreSection(
        title: 'How to get it',
        items: [
          ExploreItem(title: '1Get free library cards for your family.', sub: '', badge: '', href: ''),
          ExploreItem(title: '2Borrow the pass online or at a branch. Up to 2 passes per card.', sub: '', badge: '', href: ''),
          ExploreItem(title: '3Return it within 7 days.', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
  'PassSwimSkate': ExploreScreenModel(
    id: 'PassSwimSkate',
    title: 'City swim & skate pass',
    tag: 'Library pass · free',
    desc: '',
    sections: [
      ExploreSection(
        title: 'How to get it',
        items: [
          ExploreItem(title: '1An adult borrows it and signs a waiver.', sub: '', badge: '', href: ''),
          ExploreItem(title: '2Use it for drop-in fun swims and fun skates.', sub: '', badge: '', href: ''),
          ExploreItem(title: '3Return it within 7 days. It can\'t be put on hold.', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
  'PlaceKariya': ExploreScreenModel(
    id: 'PlaceKariya',
    title: 'Kariya Park',
    tag: 'Place',
    desc: '',
    sections: [
      ExploreSection(
        title: 'Why go',
        items: [
          ExploreItem(title: 'A Japanese-style garden honouring Mississauga\'s sister city, Kariya, Japan', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Ponds, bridges and cherry blossoms in spring', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Close to Square One and the Central Library', sub: '', badge: '', href: ''),
        ],
      ),
      ExploreSection(
        title: 'Before you go',
        items: [
          ExploreItem(title: 'Small park — about 30 minutes', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Seasonal hours [confirm]', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
  'PlaceNiagara': ExploreScreenModel(
    id: 'PlaceNiagara',
    title: 'Niagara Falls',
    tag: 'Place',
    desc: '',
    sections: [
      ExploreSection(
        title: 'Why go',
        items: [
          ExploreItem(title: 'See one of the world\'s best-known waterfalls', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Walk along the Niagara Parkway', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Boat tours and attractions cost extra', sub: '', badge: '', href: ''),
        ],
      ),
      ExploreSection(
        title: 'Before you go',
        items: [
          ExploreItem(title: 'Very busy in summer — go early', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Winter light displays are free [confirm dates]', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Parking can be expensive', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
  'PlacePAMA': ExploreScreenModel(
    id: 'PlacePAMA',
    title: 'PAMA — Peel Art Gallery, Museum + Archives',
    tag: 'Place',
    desc: '',
    sections: [
      ExploreSection(
        title: 'Why go',
        items: [
          ExploreItem(title: 'Exhibitions about Peel\'s history and its many communities', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Art gallery and family programs', sub: '', badge: '', href: ''),
          ExploreItem(title: 'A warm indoor day out in winter', sub: '', badge: '', href: ''),
        ],
      ),
      ExploreSection(
        title: 'Before you go',
        items: [
          ExploreItem(title: 'Borrow the PAMA family pass from Mississauga Library', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Check hours on the PAMA site', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
  'PlacePortCredit': ExploreScreenModel(
    id: 'PlacePortCredit',
    title: 'Port Credit waterfront',
    tag: 'Place',
    desc: '',
    sections: [
      ExploreSection(
        title: 'Why go',
        items: [
          ExploreItem(title: 'Lighthouse, pier and lakeside parks', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Walkable village with shops and restaurants', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Summer festivals on the water', sub: '', badge: '', href: ''),
        ],
      ),
      ExploreSection(
        title: 'Before you go',
        items: [
          ExploreItem(title: 'Windy and cold by the lake in winter — dress warmly', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Busy on summer weekends', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Event dates on the city site', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
  'PlaceRattray': ExploreScreenModel(
    id: 'PlaceRattray',
    title: 'Rattray Marsh Conservation Area',
    tag: 'Place',
    desc: '',
    sections: [
      ExploreSection(
        title: 'Why go',
        items: [
          ExploreItem(title: 'One of the last lakeside marshes on western Lake Ontario', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Flat boardwalk loop — easy with children', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Birds and wildlife all year', sub: '', badge: '', href: ''),
        ],
      ),
      ExploreSection(
        title: 'Before you go',
        items: [
          ExploreItem(title: 'Stay on the trail and boardwalk', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Parking nearby is limited — check before you go', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Dog and cycling rules: check the site [confirm]', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
  'PlaceRiverwood': ExploreScreenModel(
    id: 'PlaceRiverwood',
    title: 'The Riverwood Conservancy',
    tag: 'Place',
    desc: '',
    sections: [
      ExploreSection(
        title: 'Why go',
        items: [
          ExploreItem(title: 'Gardens and forest trails in the middle of the city', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Guided walks and nature programs, some free', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Good for a first autumn or winter walk', sub: '', badge: '', href: ''),
        ],
      ),
      ExploreSection(
        title: 'Before you go',
        items: [
          ExploreItem(title: 'Some programs need registration', sub: '', badge: '', href: ''),
          ExploreItem(title: 'Trails can be icy in winter', sub: '', badge: '', href: ''),
        ],
      ),
    ],
  ),
};