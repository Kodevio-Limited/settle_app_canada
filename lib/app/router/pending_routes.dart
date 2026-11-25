import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PendingRouteScreen extends StatelessWidget {
  final String title;
  final String routePath;

  const PendingRouteScreen({
    super.key,
    required this.title,
    required this.routePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: BackButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/home');
            }
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.construction, size: 48, color: Colors.orange),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Route: $routePath',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<RouteBase> pendingS10Routes = [
  GoRoute(
    path: '/all-professions',
    name: 'allprofessions',
    builder: (context, state) => PendingRouteScreen(
      title: "22.0 Work \u00b7 All regulated jobs (index)",
      routePath: '/all-professions',
    ),
  ),
  GoRoute(
    path: '/budget-planner',
    name: 'budgetplanner',
    builder: (context, state) => PendingRouteScreen(
      title: "6.14 Budget planner (phase 2)",
      routePath: '/budget-planner',
    ),
  ),
  GoRoute(
    path: '/data-export',
    name: 'dataexport',
    builder: (context, state) => PendingRouteScreen(
      title: "8.4 Download my data",
      routePath: '/data-export',
    ),
  ),
  GoRoute(
    path: '/deactivate',
    name: 'deactivate',
    builder: (context, state) => PendingRouteScreen(
      title: "8.7 Pause or delete",
      routePath: '/deactivate',
    ),
  ),
  GoRoute(
    path: '/delete-confirm',
    name: 'deleteconfirm',
    builder: (context, state) => PendingRouteScreen(
      title: "8.10 Confirm deletion",
      routePath: '/delete-confirm',
    ),
  ),
  GoRoute(
    path: '/deleted',
    name: 'deleted',
    builder: (context, state) => PendingRouteScreen(
      title: "8.11 Account deleted",
      routePath: '/deleted',
    ),
  ),
  GoRoute(
    path: '/event-skate',
    name: 'eventskate',
    builder: (context, state) => PendingRouteScreen(
      title: "23.7 Event \u00b7 Fun skate",
      routePath: '/event-skate',
    ),
  ),
  GoRoute(
    path: '/event-welcome',
    name: 'eventwelcome',
    builder: (context, state) => PendingRouteScreen(
      title: "23.8 Event \u00b7 Newcomer welcome",
      routePath: '/event-welcome',
    ),
  ),
  GoRoute(
    path: '/event-winter-walk',
    name: 'eventwinterwalk',
    builder: (context, state) => PendingRouteScreen(
      title: "23.9 Event \u00b7 Winter walk",
      routePath: '/event-winter-walk',
    ),
  ),
  GoRoute(
    path: '/exp-cities',
    name: 'expcities',
    builder: (context, state) => PendingRouteScreen(
      title: "16.11 Task \u00b7 compare cities and living costs",
      routePath: '/exp-cities',
    ),
  ),
  GoRoute(
    path: '/exp-options',
    name: 'expoptions',
    builder: (context, state) => PendingRouteScreen(
      title: "16.9 Task \u00b7 learn the official ways to immigrate",
      routePath: '/exp-options',
    ),
  ),
  GoRoute(
    path: '/exp-representative',
    name: 'exprepresentative',
    builder: (context, state) => PendingRouteScreen(
      title: "16.10 Task \u00b7 check a consultant or lawyer is licensed",
      routePath: '/exp-representative',
    ),
  ),
  GoRoute(
    path: '/explore-canoo',
    name: 'explorecanoo',
    builder: (context, state) => PendingRouteScreen(
      title: "20.3 Explore \u00b7 Canoo free year",
      routePath: '/explore-canoo',
    ),
  ),
  GoRoute(
    path: '/explore-city',
    name: 'explorecity',
    builder: (context, state) => PendingRouteScreen(
      title: "20.12 Explore \u00b7 Choose city (location off)",
      routePath: '/explore-city',
    ),
  ),
  GoRoute(
    path: '/explore-event',
    name: 'exploreevent',
    builder: (context, state) => PendingRouteScreen(
      title: "21.2 Explore \u00b7 Event detail",
      routePath: '/explore-event',
    ),
  ),
  GoRoute(
    path: '/explore-events',
    name: 'exploreevents',
    builder: (context, state) => PendingRouteScreen(
      title: "20.6 Explore \u00b7 Events",
      routePath: '/explore-events',
    ),
  ),
  GoRoute(
    path: '/explore-filters',
    name: 'explorefilters',
    builder: (context, state) => PendingRouteScreen(
      title: "20.10 Explore \u00b7 Filters sheet",
      routePath: '/explore-filters',
    ),
  ),
  GoRoute(
    path: '/explore-free-passes',
    name: 'explorefreepasses',
    builder: (context, state) => PendingRouteScreen(
      title: "20.2 Explore \u00b7 Free passes",
      routePath: '/explore-free-passes',
    ),
  ),
  GoRoute(
    path: '/explore-offers',
    name: 'exploreoffers',
    builder: (context, state) => PendingRouteScreen(
      title: "20.7 Explore \u00b7 Offers",
      routePath: '/explore-offers',
    ),
  ),
  GoRoute(
    path: '/explore-pass',
    name: 'explorepass',
    builder: (context, state) => PendingRouteScreen(
      title: "21.3 Explore \u00b7 Library pass detail",
      routePath: '/explore-pass',
    ),
  ),
  GoRoute(
    path: '/explore-place',
    name: 'exploreplace',
    builder: (context, state) => PendingRouteScreen(
      title: "20.5 Explore \u00b7 Place detail",
      routePath: '/explore-place',
    ),
  ),
  GoRoute(
    path: '/explore-places',
    name: 'exploreplaces',
    builder: (context, state) => PendingRouteScreen(
      title: "20.4 Explore \u00b7 Places list",
      routePath: '/explore-places',
    ),
  ),
  GoRoute(
    path: '/explore-saved',
    name: 'exploresaved',
    builder: (context, state) => PendingRouteScreen(
      title: "20.9 Explore \u00b7 Saved",
      routePath: '/explore-saved',
    ),
  ),
  GoRoute(
    path: '/explore-winter',
    name: 'explorewinter',
    builder: (context, state) => PendingRouteScreen(
      title: "20.11 Explore \u00b7 First winter",
      routePath: '/explore-winter',
    ),
  ),
  GoRoute(
    path: '/home-a-r',
    name: 'homear',
    builder: (context, state) => PendingRouteScreen(
      title: "21.15 RTL \u00b7 Home in Arabic",
      routePath: '/home-a-r',
    ),
  ),
  GoRoute(
    path: '/home-approved',
    name: 'homeapproved',
    builder: (context, state) => PendingRouteScreen(
      title: "16.6 Home \u00b7 Approved (countdown)",
      routePath: '/home-approved',
    ),
  ),
  GoRoute(
    path: '/home-exploring',
    name: 'homeexploring',
    builder: (context, state) => PendingRouteScreen(
      title: "16.2 Home \u00b7 Exploring",
      routePath: '/home-exploring',
    ),
  ),
  GoRoute(
    path: '/home-waiting',
    name: 'homewaiting',
    builder: (context, state) => PendingRouteScreen(
      title: "16.4 Home \u00b7 Waiting",
      routePath: '/home-waiting',
    ),
  ),
  GoRoute(
    path: '/how-partners',
    name: 'howpartners',
    builder: (context, state) => PendingRouteScreen(
      title: "13.2 How we choose partners",
      routePath: '/how-partners',
    ),
  ),
  GoRoute(
    path: '/join-household',
    name: 'joinhousehold',
    builder: (context, state) => PendingRouteScreen(
      title: "6.15 Join a household (invitee)",
      routePath: '/join-household',
    ),
  ),
  GoRoute(
    path: '/journey-approved',
    name: 'journeyapproved',
    builder: (context, state) => PendingRouteScreen(
      title: "16.7 Journey \u00b7 Before you move",
      routePath: '/journey-approved',
    ),
  ),
  GoRoute(
    path: '/language-access',
    name: 'languageaccess',
    builder: (context, state) => PendingRouteScreen(
      title: "8.5 Language & accessibility",
      routePath: '/language-access',
    ),
  ),
  GoRoute(
    path: '/language-restart',
    name: 'languagerestart',
    builder: (context, state) => PendingRouteScreen(
      title: "21.5 Settings \u00b7 Language restart (RTL)",
      routePath: '/language-restart',
    ),
  ),
  GoRoute(
    path: '/leave-quickly',
    name: 'leavequickly',
    builder: (context, state) => PendingRouteScreen(
      title: "21.4 Crisis \u00b7 Leave quickly \u2192 neutral page",
      routePath: '/leave-quickly',
    ),
  ),
  GoRoute(
    path: '/legal-help',
    name: 'legalhelp',
    builder: (context, state) => PendingRouteScreen(
      title: "13.3 Legal help (free + licensed)",
      routePath: '/legal-help',
    ),
  ),
  GoRoute(
    path: '/location-denied',
    name: 'locationdenied',
    builder: (context, state) => PendingRouteScreen(
      title: "9.3 Location turned off",
      routePath: '/location-denied',
    ),
  ),
  GoRoute(
    path: '/offer-bank',
    name: 'offerbank',
    builder: (context, state) => PendingRouteScreen(
      title: "23.14 Offer \u00b7 Newcomer banking",
      routePath: '/offer-bank',
    ),
  ),
  GoRoute(
    path: '/offer-detail',
    name: 'offerdetail',
    builder: (context, state) => PendingRouteScreen(
      title: "20.8 Explore \u00b7 Offer / coupon",
      routePath: '/offer-detail',
    ),
  ),
  GoRoute(
    path: '/offer-furniture',
    name: 'offerfurniture',
    builder: (context, state) => PendingRouteScreen(
      title: "23.16 Offer \u00b7 Furniture",
      routePath: '/offer-furniture',
    ),
  ),
  GoRoute(
    path: '/offer-phone',
    name: 'offerphone',
    builder: (context, state) => PendingRouteScreen(
      title: "23.15 Offer \u00b7 Phone plan",
      routePath: '/offer-phone',
    ),
  ),
  GoRoute(
    path: '/offline',
    name: 'offline',
    builder: (context, state) => PendingRouteScreen(
      title: "9.2 Offline",
      routePath: '/offline',
    ),
  ),
  GoRoute(
    path: '/partner-detail',
    name: 'partnerdetail',
    builder: (context, state) => PendingRouteScreen(
      title: "13.1 Partner detail (sponsored)",
      routePath: '/partner-detail',
    ),
  ),
  GoRoute(
    path: '/pass-conservation',
    name: 'passconservation',
    builder: (context, state) => PendingRouteScreen(
      title: "23.11 Pass \u00b7 Conservation parks",
      routePath: '/pass-conservation',
    ),
  ),
  GoRoute(
    path: '/pass-ontario-parks',
    name: 'passontarioparks',
    builder: (context, state) => PendingRouteScreen(
      title: "23.10 Pass \u00b7 Ontario Parks",
      routePath: '/pass-ontario-parks',
    ),
  ),
  GoRoute(
    path: '/pass-p-a-m-a',
    name: 'passpama',
    builder: (context, state) => PendingRouteScreen(
      title: "23.12 Pass \u00b7 PAMA family",
      routePath: '/pass-p-a-m-a',
    ),
  ),
  GoRoute(
    path: '/pass-swim-skate',
    name: 'passswimskate',
    builder: (context, state) => PendingRouteScreen(
      title: "23.13 Pass \u00b7 Swim & skate",
      routePath: '/pass-swim-skate',
    ),
  ),
  GoRoute(
    path: '/pathway-architect',
    name: 'pathwayarchitect',
    builder: (context, state) => PendingRouteScreen(
      title: "22.19 Pathway \u00b7 Architect",
      routePath: '/pathway-architect',
    ),
  ),
  GoRoute(
    path: '/pathway-audiologist-s-l-p',
    name: 'pathwayaudiologistslp',
    builder: (context, state) => PendingRouteScreen(
      title: "22.16 Pathway \u00b7 Audiologist or speech-language pathologist",
      routePath: '/pathway-audiologist-s-l-p',
    ),
  ),
  GoRoute(
    path: '/pathway-auto-body',
    name: 'pathwayautobody',
    builder: (context, state) => PendingRouteScreen(
      title: "22.30 Pathway \u00b7 Auto body and collision repairer",
      routePath: '/pathway-auto-body',
    ),
  ),
  GoRoute(
    path: '/pathway-auto-tech',
    name: 'pathwayautotech',
    builder: (context, state) => PendingRouteScreen(
      title: "22.29 Pathway \u00b7 Automotive service technician",
      routePath: '/pathway-auto-tech',
    ),
  ),
  GoRoute(
    path: '/pathway-c-p-a',
    name: 'pathwaycpa',
    builder: (context, state) => PendingRouteScreen(
      title: "4.47 Pathway \u00b7 Accountant (CPA)",
      routePath: '/pathway-c-p-a',
    ),
  ),
  GoRoute(
    path: '/pathway-chiropractor',
    name: 'pathwaychiropractor',
    builder: (context, state) => PendingRouteScreen(
      title: "22.13 Pathway \u00b7 Chiropractor",
      routePath: '/pathway-chiropractor',
    ),
  ),
  GoRoute(
    path: '/pathway-crane',
    name: 'pathwaycrane',
    builder: (context, state) => PendingRouteScreen(
      title: "22.33 Pathway \u00b7 Mobile crane operator (hoisting engineer)",
      routePath: '/pathway-crane',
    ),
  ),
  GoRoute(
    path: '/pathway-dental-hygienist',
    name: 'pathwaydentalhygienist',
    builder: (context, state) => PendingRouteScreen(
      title: "22.1 Pathway \u00b7 Dental hygienist",
      routePath: '/pathway-dental-hygienist',
    ),
  ),
  GoRoute(
    path: '/pathway-dentist',
    name: 'pathwaydentist',
    builder: (context, state) => PendingRouteScreen(
      title: "4.42 Pathway \u00b7 Dentist",
      routePath: '/pathway-dentist',
    ),
  ),
  GoRoute(
    path: '/pathway-denturist',
    name: 'pathwaydenturist',
    builder: (context, state) => PendingRouteScreen(
      title: "22.17 Pathway \u00b7 Denturist",
      routePath: '/pathway-denturist',
    ),
  ),
  GoRoute(
    path: '/pathway-dietitian',
    name: 'pathwaydietitian',
    builder: (context, state) => PendingRouteScreen(
      title: "22.8 Pathway \u00b7 Dietitian",
      routePath: '/pathway-dietitian',
    ),
  ),
  GoRoute(
    path: '/pathway-e-c-e',
    name: 'pathwayece',
    builder: (context, state) => PendingRouteScreen(
      title: "4.44 Pathway \u00b7 Early childhood educator",
      routePath: '/pathway-e-c-e',
    ),
  ),
  GoRoute(
    path: '/pathway-electrician',
    name: 'pathwayelectrician',
    builder: (context, state) => PendingRouteScreen(
      title: "4.48 Pathway \u00b7 Electrician",
      routePath: '/pathway-electrician',
    ),
  ),
  GoRoute(
    path: '/pathway-geoscientist',
    name: 'pathwaygeoscientist',
    builder: (context, state) => PendingRouteScreen(
      title: "22.22 Pathway \u00b7 Geoscientist",
      routePath: '/pathway-geoscientist',
    ),
  ),
  GoRoute(
    path: '/pathway-hairstylist',
    name: 'pathwayhairstylist',
    builder: (context, state) => PendingRouteScreen(
      title: "22.32 Pathway \u00b7 Hairstylist",
      routePath: '/pathway-hairstylist',
    ),
  ),
  GoRoute(
    path: '/pathway-insurance',
    name: 'pathwayinsurance',
    builder: (context, state) => PendingRouteScreen(
      title: "22.24 Pathway \u00b7 Life insurance agent",
      routePath: '/pathway-insurance',
    ),
  ),
  GoRoute(
    path: '/pathway-kinesiologist',
    name: 'pathwaykinesiologist',
    builder: (context, state) => PendingRouteScreen(
      title: "22.15 Pathway \u00b7 Kinesiologist",
      routePath: '/pathway-kinesiologist',
    ),
  ),
  GoRoute(
    path: '/pathway-lawyer',
    name: 'pathwaylawyer',
    builder: (context, state) => PendingRouteScreen(
      title: "4.46 Pathway \u00b7 Lawyer",
      routePath: '/pathway-lawyer',
    ),
  ),
  GoRoute(
    path: '/pathway-m-l-t',
    name: 'pathwaymlt',
    builder: (context, state) => PendingRouteScreen(
      title: "22.4 Pathway \u00b7 Medical laboratory technologist",
      routePath: '/pathway-m-l-t',
    ),
  ),
  GoRoute(
    path: '/pathway-m-r-t',
    name: 'pathwaymrt',
    builder: (context, state) => PendingRouteScreen(
      title: "22.5 Pathway \u00b7 Medical radiation technologist",
      routePath: '/pathway-m-r-t',
    ),
  ),
  GoRoute(
    path: '/pathway-massage',
    name: 'pathwaymassage',
    builder: (context, state) => PendingRouteScreen(
      title: "22.14 Pathway \u00b7 Massage therapist",
      routePath: '/pathway-massage',
    ),
  ),
  GoRoute(
    path: '/pathway-midwife',
    name: 'pathwaymidwife',
    builder: (context, state) => PendingRouteScreen(
      title: "22.7 Pathway \u00b7 Midwife",
      routePath: '/pathway-midwife',
    ),
  ),
  GoRoute(
    path: '/pathway-mortgage',
    name: 'pathwaymortgage',
    builder: (context, state) => PendingRouteScreen(
      title: "22.25 Pathway \u00b7 Mortgage agent",
      routePath: '/pathway-mortgage',
    ),
  ),
  GoRoute(
    path: '/pathway-nurse',
    name: 'pathwaynurse',
    builder: (context, state) => PendingRouteScreen(
      title: "4.39 Pathway \u00b7 Registered nurse",
      routePath: '/pathway-nurse',
    ),
  ),
  GoRoute(
    path: '/pathway-o-t',
    name: 'pathwayot',
    builder: (context, state) => PendingRouteScreen(
      title: "22.3 Pathway \u00b7 Occupational therapist",
      routePath: '/pathway-o-t',
    ),
  ),
  GoRoute(
    path: '/pathway-optician',
    name: 'pathwayoptician',
    builder: (context, state) => PendingRouteScreen(
      title: "22.12 Pathway \u00b7 Optician",
      routePath: '/pathway-optician',
    ),
  ),
  GoRoute(
    path: '/pathway-optometrist',
    name: 'pathwayoptometrist',
    builder: (context, state) => PendingRouteScreen(
      title: "22.11 Pathway \u00b7 Optometrist",
      routePath: '/pathway-optometrist',
    ),
  ),
  GoRoute(
    path: '/pathway-paralegal',
    name: 'pathwayparalegal',
    builder: (context, state) => PendingRouteScreen(
      title: "22.18 Pathway \u00b7 Paralegal",
      routePath: '/pathway-paralegal',
    ),
  ),
  GoRoute(
    path: '/pathway-pharmacist',
    name: 'pathwaypharmacist',
    builder: (context, state) => PendingRouteScreen(
      title: "4.41 Pathway \u00b7 Pharmacist",
      routePath: '/pathway-pharmacist',
    ),
  ),
  GoRoute(
    path: '/pathway-physician',
    name: 'pathwayphysician',
    builder: (context, state) => PendingRouteScreen(
      title: "4.40 Pathway \u00b7 Physician",
      routePath: '/pathway-physician',
    ),
  ),
  GoRoute(
    path: '/pathway-physio',
    name: 'pathwayphysio',
    builder: (context, state) => PendingRouteScreen(
      title: "22.2 Pathway \u00b7 Physiotherapist",
      routePath: '/pathway-physio',
    ),
  ),
  GoRoute(
    path: '/pathway-plumber',
    name: 'pathwayplumber',
    builder: (context, state) => PendingRouteScreen(
      title: "4.49 Pathway \u00b7 Plumber",
      routePath: '/pathway-plumber',
    ),
  ),
  GoRoute(
    path: '/pathway-psychologist',
    name: 'pathwaypsychologist',
    builder: (context, state) => PendingRouteScreen(
      title: "22.9 Pathway \u00b7 Psychologist",
      routePath: '/pathway-psychologist',
    ),
  ),
  GoRoute(
    path: '/pathway-psychotherapist',
    name: 'pathwaypsychotherapist',
    builder: (context, state) => PendingRouteScreen(
      title: "22.10 Pathway \u00b7 Psychotherapist",
      routePath: '/pathway-psychotherapist',
    ),
  ),
  GoRoute(
    path: '/pathway-r-t',
    name: 'pathwayrt',
    builder: (context, state) => PendingRouteScreen(
      title: "22.6 Pathway \u00b7 Respiratory therapist",
      routePath: '/pathway-r-t',
    ),
  ),
  GoRoute(
    path: '/pathway-real-estate',
    name: 'pathwayrealestate',
    builder: (context, state) => PendingRouteScreen(
      title: "22.23 Pathway \u00b7 Real estate agent",
      routePath: '/pathway-real-estate',
    ),
  ),
  GoRoute(
    path: '/pathway-refrigeration',
    name: 'pathwayrefrigeration',
    builder: (context, state) => PendingRouteScreen(
      title: "22.26 Pathway \u00b7 Refrigeration and air conditioning mechanic",
      routePath: '/pathway-refrigeration',
    ),
  ),
  GoRoute(
    path: '/pathway-sheet-metal',
    name: 'pathwaysheetmetal',
    builder: (context, state) => PendingRouteScreen(
      title: "22.27 Pathway \u00b7 Sheet metal worker",
      routePath: '/pathway-sheet-metal',
    ),
  ),
  GoRoute(
    path: '/pathway-social-worker',
    name: 'pathwaysocialworker',
    builder: (context, state) => PendingRouteScreen(
      title: "4.45 Pathway \u00b7 Social worker",
      routePath: '/pathway-social-worker',
    ),
  ),
  GoRoute(
    path: '/pathway-steamfitter',
    name: 'pathwaysteamfitter',
    builder: (context, state) => PendingRouteScreen(
      title: "22.28 Pathway \u00b7 Steamfitter",
      routePath: '/pathway-steamfitter',
    ),
  ),
  GoRoute(
    path: '/pathway-surveyor',
    name: 'pathwaysurveyor',
    builder: (context, state) => PendingRouteScreen(
      title: "22.21 Pathway \u00b7 Land surveyor",
      routePath: '/pathway-surveyor',
    ),
  ),
  GoRoute(
    path: '/pathway-teacher',
    name: 'pathwayteacher',
    builder: (context, state) => PendingRouteScreen(
      title: "4.43 Pathway \u00b7 Teacher (K\u201312)",
      routePath: '/pathway-teacher',
    ),
  ),
  GoRoute(
    path: '/pathway-truck-coach',
    name: 'pathwaytruckcoach',
    builder: (context, state) => PendingRouteScreen(
      title: "22.31 Pathway \u00b7 Truck and coach technician",
      routePath: '/pathway-truck-coach',
    ),
  ),
  GoRoute(
    path: '/pathway-vet',
    name: 'pathwayvet',
    builder: (context, state) => PendingRouteScreen(
      title: "22.20 Pathway \u00b7 Veterinarian",
      routePath: '/pathway-vet',
    ),
  ),
  GoRoute(
    path: '/paused',
    name: 'paused',
    builder: (context, state) => PendingRouteScreen(
      title: "8.8 Account paused",
      routePath: '/paused',
    ),
  ),
  GoRoute(
    path: '/place-kariya',
    name: 'placekariya',
    builder: (context, state) => PendingRouteScreen(
      title: "23.3 Place \u00b7 Kariya Park",
      routePath: '/place-kariya',
    ),
  ),
  GoRoute(
    path: '/place-niagara',
    name: 'placeniagara',
    builder: (context, state) => PendingRouteScreen(
      title: "23.6 Place \u00b7 Niagara Falls",
      routePath: '/place-niagara',
    ),
  ),
  GoRoute(
    path: '/place-p-a-m-a',
    name: 'placepama',
    builder: (context, state) => PendingRouteScreen(
      title: "23.5 Place \u00b7 PAMA",
      routePath: '/place-p-a-m-a',
    ),
  ),
  GoRoute(
    path: '/place-port-credit',
    name: 'placeportcredit',
    builder: (context, state) => PendingRouteScreen(
      title: "23.2 Place \u00b7 Port Credit waterfront",
      routePath: '/place-port-credit',
    ),
  ),
  GoRoute(
    path: '/place-rattray',
    name: 'placerattray',
    builder: (context, state) => PendingRouteScreen(
      title: "23.1 Place \u00b7 Rattray Marsh",
      routePath: '/place-rattray',
    ),
  ),
  GoRoute(
    path: '/place-riverwood',
    name: 'placeriverwood',
    builder: (context, state) => PendingRouteScreen(
      title: "23.4 Place \u00b7 The Riverwood Conservancy",
      routePath: '/place-riverwood',
    ),
  ),
  GoRoute(
    path: '/pre-arrival-day',
    name: 'prearrivalday',
    builder: (context, state) => PendingRouteScreen(
      title: "16.22 Task \u00b7 know what happens at the airport",
      routePath: '/pre-arrival-day',
    ),
  ),
  GoRoute(
    path: '/pre-first72',
    name: 'prefirst72',
    builder: (context, state) => PendingRouteScreen(
      title: "16.23 Task \u00b7 plan your first 72 hours",
      routePath: '/pre-first72',
    ),
  ),
  GoRoute(
    path: '/pre-goods',
    name: 'pregoods',
    builder: (context, state) => PendingRouteScreen(
      title: "16.18 Task \u00b7 list what you\\",
      routePath: '/pre-goods',
    ),
  ),
  GoRoute(
    path: '/pre-kids-records',
    name: 'prekidsrecords',
    builder: (context, state) => PendingRouteScreen(
      title: "16.19 Task \u00b7 get children\\",
      routePath: '/pre-kids-records',
    ),
  ),
  GoRoute(
    path: '/pre-medications',
    name: 'premedications',
    builder: (context, state) => PendingRouteScreen(
      title: "16.20 Task \u00b7 plan your medications",
      routePath: '/pre-medications',
    ),
  ),
  GoRoute(
    path: '/pre-services',
    name: 'preservices',
    builder: (context, state) => PendingRouteScreen(
      title: "16.16 Task \u00b7 sign up for free pre-arrival services",
      routePath: '/pre-services',
    ),
  ),
  GoRoute(
    path: '/pre-temp-housing',
    name: 'pretemphousing',
    builder: (context, state) => PendingRouteScreen(
      title: "16.21 Task \u00b7 book a place for your first weeks",
      routePath: '/pre-temp-housing',
    ),
  ),
  GoRoute(
    path: '/pre-travel-docs',
    name: 'pretraveldocs',
    builder: (context, state) => PendingRouteScreen(
      title: "16.17 Task \u00b7 get your travel documents ready",
      routePath: '/pre-travel-docs',
    ),
  ),
  GoRoute(
    path: '/privacy-data',
    name: 'privacydata',
    builder: (context, state) => PendingRouteScreen(
      title: "8.3 Privacy & my data",
      routePath: '/privacy-data',
    ),
  ),
  GoRoute(
    path: '/sign-out-confirm',
    name: 'signoutconfirm',
    builder: (context, state) => PendingRouteScreen(
      title: "8.6 Sign out",
      routePath: '/sign-out-confirm',
    ),
  ),
  GoRoute(
    path: '/task-address-change',
    name: 'taskaddresschange',
    builder: (context, state) => PendingRouteScreen(
      title: "4.53 Task \u00b7 update your address everywhere",
      routePath: '/task-address-change',
    ),
  ),
  GoRoute(
    path: '/task-after-care',
    name: 'taskaftercare',
    builder: (context, state) => PendingRouteScreen(
      title: "4.26 Task \u00b7 Before/after-school care",
      routePath: '/task-after-care',
    ),
  ),
  GoRoute(
    path: '/task-bank',
    name: 'taskbank',
    builder: (context, state) => PendingRouteScreen(
      title: "4.35 Task \u00b7 Bank account (with partners)",
      routePath: '/task-bank',
    ),
  ),
  GoRoute(
    path: '/task-bridging',
    name: 'taskbridging',
    builder: (context, state) => PendingRouteScreen(
      title: "4.83 Task \u00b7 join a bridging program or mentorship",
      routePath: '/task-bridging',
    ),
  ),
  GoRoute(
    path: '/task-business',
    name: 'taskbusiness',
    builder: (context, state) => PendingRouteScreen(
      title: "4.84 Task \u00b7 start a business or work for yourself",
      routePath: '/task-business',
    ),
  ),
  GoRoute(
    path: '/task-buy-car',
    name: 'taskbuycar',
    builder: (context, state) => PendingRouteScreen(
      title: "4.63 Task \u00b7 buy a used car safely",
      routePath: '/task-buy-car',
    ),
  ),
  GoRoute(
    path: '/task-c-l-b',
    name: 'taskclb',
    builder: (context, state) => PendingRouteScreen(
      title: "4.76 Task \u00b7 get the Canada Learning Bond",
      routePath: '/task-c-l-b',
    ),
  ),
  GoRoute(
    path: '/task-c-r-a',
    name: 'taskcra',
    builder: (context, state) => PendingRouteScreen(
      title: "4.18 Task \u00b7 CRA account (locked)",
      routePath: '/task-c-r-a',
    ),
  ),
  GoRoute(
    path: '/task-c-r-a-scams',
    name: 'taskcrascams',
    builder: (context, state) => PendingRouteScreen(
      title: "4.78 Task \u00b7 spot government and money scams",
      routePath: '/task-c-r-a-scams',
    ),
  ),
  GoRoute(
    path: '/task-campus-services',
    name: 'taskcampusservices',
    builder: (context, state) => PendingRouteScreen(
      title: "4.30 Task \u00b7 Campus services (locked)",
      routePath: '/task-campus-services',
    ),
  ),
  GoRoute(
    path: '/task-car-costs',
    name: 'taskcarcosts',
    builder: (context, state) => PendingRouteScreen(
      title: "4.50 Task \u00b7 Plan car costs (optional)",
      routePath: '/task-car-costs',
    ),
  ),
  GoRoute(
    path: '/task-car-seats',
    name: 'taskcarseats',
    builder: (context, state) => PendingRouteScreen(
      title: "4.65 Task \u00b7 use the right car seat",
      routePath: '/task-car-seats',
    ),
  ),
  GoRoute(
    path: '/task-child-care',
    name: 'taskchildcare',
    builder: (context, state) => PendingRouteScreen(
      title: "4.57 Task \u00b7 find licensed child care",
      routePath: '/task-child-care',
    ),
  ),
  GoRoute(
    path: '/task-child-care-subsidy',
    name: 'taskchildcaresubsidy',
    builder: (context, state) => PendingRouteScreen(
      title: "4.58 Task \u00b7 apply for a child care subsidy",
      routePath: '/task-child-care-subsidy',
    ),
  ),
  GoRoute(
    path: '/task-credential-assess',
    name: 'taskcredentialassess',
    builder: (context, state) => PendingRouteScreen(
      title: "4.27 Task \u00b7 Assess past studies",
      routePath: '/task-credential-assess',
    ),
  ),
  GoRoute(
    path: '/task-credit',
    name: 'taskcredit',
    builder: (context, state) => PendingRouteScreen(
      title: "4.36 Task \u00b7 Build credit",
      routePath: '/task-credit',
    ),
  ),
  GoRoute(
    path: '/task-dental-plan',
    name: 'taskdentalplan',
    builder: (context, state) => PendingRouteScreen(
      title: "4.71 Task \u00b7 apply for the Canadian Dental Care Plan",
      routePath: '/task-dental-plan',
    ),
  ),
  GoRoute(
    path: '/task-domestic-tuition',
    name: 'taskdomestictuition',
    builder: (context, state) => PendingRouteScreen(
      title: "4.29 Task \u00b7 Domestic tuition",
      routePath: '/task-domestic-tuition',
    ),
  ),
  GoRoute(
    path: '/task-driving-record',
    name: 'taskdrivingrecord',
    builder: (context, state) => PendingRouteScreen(
      title: "4.31 Task \u00b7 Driving record",
      routePath: '/task-driving-record',
    ),
  ),
  GoRoute(
    path: '/task-e-s-l',
    name: 'taskesl',
    builder: (context, state) => PendingRouteScreen(
      title: "4.25 Task \u00b7 English support",
      routePath: '/task-e-s-l',
    ),
  ),
  GoRoute(
    path: '/task-early-o-n',
    name: 'taskearlyon',
    builder: (context, state) => PendingRouteScreen(
      title: "4.59 Task \u00b7 visit a free EarlyON centre",
      routePath: '/task-early-o-n',
    ),
  ),
  GoRoute(
    path: '/task-english-test',
    name: 'taskenglishtest',
    builder: (context, state) => PendingRouteScreen(
      title: "4.28 Task \u00b7 English test",
      routePath: '/task-english-test',
    ),
  ),
  GoRoute(
    path: '/task-g-s-t-credit',
    name: 'taskgstcredit',
    builder: (context, state) => PendingRouteScreen(
      title: "4.74 Task \u00b7 apply for the GST/HST credit",
      routePath: '/task-g-s-t-credit',
    ),
  ),
  GoRoute(
    path: '/task-groups',
    name: 'taskgroups',
    builder: (context, state) => PendingRouteScreen(
      title: "4.38 Task \u00b7 Find a group",
      routePath: '/task-groups',
    ),
  ),
  GoRoute(
    path: '/task-health-card',
    name: 'taskhealthcard',
    builder: (context, state) => PendingRouteScreen(
      title: "4.17 Task \u00b7 Ontario health cards",
      routePath: '/task-health-card',
    ),
  ),
  GoRoute(
    path: '/task-health-gap',
    name: 'taskhealthgap',
    builder: (context, state) => PendingRouteScreen(
      title: "4.33 Task \u00b7 Health coverage gaps",
      routePath: '/task-health-gap',
    ),
  ),
  GoRoute(
    path: '/task-housing-help',
    name: 'taskhousinghelp',
    builder: (context, state) => PendingRouteScreen(
      title: "4.56 Task \u00b7 get help if rent is too high or you have nowhere to stay",
      routePath: '/task-housing-help',
    ),
  ),
  GoRoute(
    path: '/task-immunization',
    name: 'taskimmunization',
    builder: (context, state) => PendingRouteScreen(
      title: "4.24 Task \u00b7 School vaccines",
      routePath: '/task-immunization',
    ),
  ),
  GoRoute(
    path: '/task-insurance-history',
    name: 'taskinsurancehistory',
    builder: (context, state) => PendingRouteScreen(
      title: "4.67 Task \u00b7 bring proof of your insurance history",
      routePath: '/task-insurance-history',
    ),
  ),
  GoRoute(
    path: '/task-job-scams',
    name: 'taskjobscams',
    builder: (context, state) => PendingRouteScreen(
      title: "4.82 Task \u00b7 spot job scams",
      routePath: '/task-job-scams',
    ),
  ),
  GoRoute(
    path: '/task-job-search',
    name: 'taskjobsearch',
    builder: (context, state) => PendingRouteScreen(
      title: "4.80 Task \u00b7 search for jobs",
      routePath: '/task-job-search',
    ),
  ),
  GoRoute(
    path: '/task-kids-dental',
    name: 'taskkidsdental',
    builder: (context, state) => PendingRouteScreen(
      title: "4.34 Task \u00b7 Kids dental & eyes",
      routePath: '/task-kids-dental',
    ),
  ),
  GoRoute(
    path: '/task-landing-docs',
    name: 'tasklandingdocs',
    builder: (context, state) => PendingRouteScreen(
      title: "4.15 Task \u00b7 Landing documents",
      routePath: '/task-landing-docs',
    ),
  ),
  GoRoute(
    path: '/task-lease',
    name: 'tasklease',
    builder: (context, state) => PendingRouteScreen(
      title: "4.21 Task \u00b7 Standard lease",
      routePath: '/task-lease',
    ),
  ),
  GoRoute(
    path: '/task-mental-health',
    name: 'taskmentalhealth',
    builder: (context, state) => PendingRouteScreen(
      title: "4.72 Task \u00b7 find free mental health support",
      routePath: '/task-mental-health',
    ),
  ),
  GoRoute(
    path: '/task-more',
    name: 'taskmore',
    builder: (context, state) => PendingRouteScreen(
      title: "21.1 Task \u00b7 More options (\u22ef sheet)",
      routePath: '/task-more',
    ),
  ),
  GoRoute(
    path: '/task-move-in',
    name: 'taskmovein',
    builder: (context, state) => PendingRouteScreen(
      title: "4.55 Task \u00b7 move in and check the unit",
      routePath: '/task-move-in',
    ),
  ),
  GoRoute(
    path: '/task-o-t-b',
    name: 'taskotb',
    builder: (context, state) => PendingRouteScreen(
      title: "4.75 Task \u00b7 get the Ontario Trillium Benefit",
      routePath: '/task-o-t-b',
    ),
  ),
  GoRoute(
    path: '/task-p-r-basics',
    name: 'taskprbasics',
    builder: (context, state) => PendingRouteScreen(
      title: "4.16 Task \u00b7 Keeping PR status",
      routePath: '/task-p-r-basics',
    ),
  ),
  GoRoute(
    path: '/task-photo-card',
    name: 'taskphotocard',
    builder: (context, state) => PendingRouteScreen(
      title: "4.51 Task \u00b7 get an Ontario Photo Card",
      routePath: '/task-photo-card',
    ),
  ),
  GoRoute(
    path: '/task-pregnancy',
    name: 'taskpregnancy',
    builder: (context, state) => PendingRouteScreen(
      title: "4.73 Task \u00b7 pregnancy and a new baby",
      routePath: '/task-pregnancy',
    ),
  ),
  GoRoute(
    path: '/task-prescriptions',
    name: 'taskprescriptions',
    builder: (context, state) => PendingRouteScreen(
      title: "4.70 Task \u00b7 pay less for prescriptions",
      routePath: '/task-prescriptions',
    ),
  ),
  GoRoute(
    path: '/task-presto',
    name: 'taskpresto',
    builder: (context, state) => PendingRouteScreen(
      title: "4.19 Task \u00b7 PRESTO card",
      routePath: '/task-presto',
    ),
  ),
  GoRoute(
    path: '/task-register-car',
    name: 'taskregistercar',
    builder: (context, state) => PendingRouteScreen(
      title: "4.64 Task \u00b7 register your car and get plates",
      routePath: '/task-register-car',
    ),
  ),
  GoRoute(
    path: '/task-rental-search',
    name: 'taskrentalsearch',
    builder: (context, state) => PendingRouteScreen(
      title: "4.54 Task \u00b7 find and apply for a rental",
      routePath: '/task-rental-search',
    ),
  ),
  GoRoute(
    path: '/task-resume',
    name: 'taskresume',
    builder: (context, state) => PendingRouteScreen(
      title: "4.79 Task \u00b7 make a Canadian-style r\u00e9sum\u00e9",
      routePath: '/task-resume',
    ),
  ),
  GoRoute(
    path: '/task-road-test',
    name: 'taskroadtest',
    builder: (context, state) => PendingRouteScreen(
      title: "4.32 Task \u00b7 Knowledge or road test",
      routePath: '/task-road-test',
    ),
  ),
  GoRoute(
    path: '/task-scams',
    name: 'taskscams',
    builder: (context, state) => PendingRouteScreen(
      title: "4.20 Task \u00b7 Rental scams",
      routePath: '/task-scams',
    ),
  ),
  GoRoute(
    path: '/task-school-bus',
    name: 'taskschoolbus',
    builder: (context, state) => PendingRouteScreen(
      title: "4.60 Task \u00b7 check if your child gets a school bus",
      routePath: '/task-school-bus',
    ),
  ),
  GoRoute(
    path: '/task-send-money',
    name: 'tasksendmoney',
    builder: (context, state) => PendingRouteScreen(
      title: "4.77 Task \u00b7 send money home safely",
      routePath: '/task-send-money',
    ),
  ),
  GoRoute(
    path: '/task-special-ed',
    name: 'taskspecialed',
    builder: (context, state) => PendingRouteScreen(
      title: "4.61 Task \u00b7 get support for learning needs",
      routePath: '/task-special-ed',
    ),
  ),
  GoRoute(
    path: '/task-tax-return',
    name: 'tasktaxreturn',
    builder: (context, state) => PendingRouteScreen(
      title: "4.37 Task \u00b7 First tax return (new)",
      routePath: '/task-tax-return',
    ),
  ),
  GoRoute(
    path: '/task-teen-credits',
    name: 'taskteencredits',
    builder: (context, state) => PendingRouteScreen(
      title: "4.62 Task \u00b7 get credit for past high school",
      routePath: '/task-teen-credits',
    ),
  ),
  GoRoute(
    path: '/task-tenant-insurance',
    name: 'tasktenantinsurance',
    builder: (context, state) => PendingRouteScreen(
      title: "4.23 Task \u00b7 Tenant insurance",
      routePath: '/task-tenant-insurance',
    ),
  ),
  GoRoute(
    path: '/task-translations',
    name: 'tasktranslations',
    builder: (context, state) => PendingRouteScreen(
      title: "4.52 Task \u00b7 get certified translations",
      routePath: '/task-translations',
    ),
  ),
  GoRoute(
    path: '/task-utilities',
    name: 'taskutilities',
    builder: (context, state) => PendingRouteScreen(
      title: "4.22 Task \u00b7 Hydro, gas & internet",
      routePath: '/task-utilities',
    ),
  ),
  GoRoute(
    path: '/task-where-care',
    name: 'taskwherecare',
    builder: (context, state) => PendingRouteScreen(
      title: "4.69 Task \u00b7 know where to go when someone is sick",
      routePath: '/task-where-care',
    ),
  ),
  GoRoute(
    path: '/task-winter-driving',
    name: 'taskwinterdriving',
    builder: (context, state) => PendingRouteScreen(
      title: "4.66 Task \u00b7 get ready for winter driving",
      routePath: '/task-winter-driving',
    ),
  ),
  GoRoute(
    path: '/task-work-benefits',
    name: 'taskworkbenefits',
    builder: (context, state) => PendingRouteScreen(
      title: "4.68 Task \u00b7 understand your workplace benefits",
      routePath: '/task-work-benefits',
    ),
  ),
  GoRoute(
    path: '/task-work-rights',
    name: 'taskworkrights',
    builder: (context, state) => PendingRouteScreen(
      title: "4.81 Task \u00b7 know your rights at work",
      routePath: '/task-work-rights',
    ),
  ),
  GoRoute(
    path: '/var-b-c-health',
    name: 'varbchealth',
    builder: (context, state) => PendingRouteScreen(
      title: "12.1 BC \u00b7 MSP wait period",
      routePath: '/var-b-c-health',
    ),
  ),
  GoRoute(
    path: '/var-b-c-health-gap',
    name: 'varbchealthgap',
    builder: (context, state) => PendingRouteScreen(
      title: "12.2 BC \u00b7 Cover the wait",
      routePath: '/var-b-c-health-gap',
    ),
  ),
  GoRoute(
    path: '/var-b-c-i-c-b-c',
    name: 'varbcicbc',
    builder: (context, state) => PendingRouteScreen(
      title: "12.3 BC \u00b7 ICBC licence + insurance",
      routePath: '/var-b-c-i-c-b-c',
    ),
  ),
  GoRoute(
    path: '/var-m-b-not-eligible',
    name: 'varmbnoteligible',
    builder: (context, state) => PendingRouteScreen(
      title: "12.7 MB \u00b7 Not covered for your status",
      routePath: '/var-m-b-not-eligible',
    ),
  ),
  GoRoute(
    path: '/var-q-c-health',
    name: 'varqchealth',
    builder: (context, state) => PendingRouteScreen(
      title: "12.4 QC \u00b7 RAMQ (children exempt)",
      routePath: '/var-q-c-health',
    ),
  ),
  GoRoute(
    path: '/var-q-c-lease',
    name: 'varqclease',
    builder: (context, state) => PendingRouteScreen(
      title: "12.5 QC \u00b7 Lease & no deposit",
      routePath: '/var-q-c-lease',
    ),
  ),
  GoRoute(
    path: '/var-q-c-school',
    name: 'varqcschool',
    builder: (context, state) => PendingRouteScreen(
      title: "12.6 QC \u00b7 French-language school",
      routePath: '/var-q-c-school',
    ),
  ),
  GoRoute(
    path: '/wait-docs',
    name: 'waitdocs',
    builder: (context, state) => PendingRouteScreen(
      title: "16.13 Task \u00b7 gather your family\\",
      routePath: '/wait-docs',
    ),
  ),
  GoRoute(
    path: '/wait-savings',
    name: 'waitsavings',
    builder: (context, state) => PendingRouteScreen(
      title: "16.14 Task \u00b7 plan money for your first months",
      routePath: '/wait-savings',
    ),
  ),
  GoRoute(
    path: '/wait-track',
    name: 'waittrack',
    builder: (context, state) => PendingRouteScreen(
      title: "16.12 Task \u00b7 check your application status",
      routePath: '/wait-track',
    ),
  ),
  GoRoute(
    path: '/wait-wellbeing',
    name: 'waitwellbeing',
    builder: (context, state) => PendingRouteScreen(
      title: "16.15 Task \u00b7 when waiting feels hard",
      routePath: '/wait-wellbeing',
    ),
  ),
  GoRoute(
    path: '/web-delete-account',
    name: 'webdeleteaccount',
    builder: (context, state) => PendingRouteScreen(
      title: "21.9 Web \u00b7 Delete account (Google Play)",
      routePath: '/web-delete-account',
    ),
  ),
];
