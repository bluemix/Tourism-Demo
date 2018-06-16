
import 'package:iraqiairways_demo/models/models.dart';

List<Destination> getDestinations() {
  List<Destination> destinations = new List();

  // 1) Turkey
  destinations.add(Destination(
      title: 'Turkey',
      titleAr: 'تركيا',
      emoji: '🇹🇷',
      photo: 'images/gamze-bozkaya-561150-unsplash.jpg',
      price: 650,
      numDays: 8,
      airlines: 'Turkish Airlines',
      airlnesAr: 'الخطوط الجوية التركية',
      food: 'Breakfast and dinner',
      foodAr: 'فطور و عشاء',
      hotelStars: 5,
      shortDescription: '',
      shortDescriptionAr: 'مناطق تراثية في إسطنبول و سياحية في بورصا',
      dateFrom: new DateTime(2018, 06, 13),
      dateTo: new DateTime(2018, 06, 21),
      cityActivities: [
        new CityActivity(
            cityName: 'Istanbul',
            cityNameAr: 'إسطنبول',
            dateFrom: new DateTime(2018, 06, 13),
            dateTo: new DateTime(2018, 06, 15),
            activitys: '',
            activitiesAr: '',
            photos: ['images/istanbul.jpg']),
        new CityActivity(
            cityName: 'Bursa',
            cityNameAr: 'بورصا',
            dateFrom: new DateTime(2018, 06, 16),
            dateTo: new DateTime(2018, 06, 20),
            activitys: '',
            activitiesAr: '',
            photos: ['images/bursa-02.jpg'])
      ]));

  // 2) Turkey
  destinations.add(Destination(
      title: 'Turkey',
      titleAr: 'تركيا',
      emoji: '🇹🇷',
      photo: 'images/TURKEY-COUNTRY-IMAGE.jpg',
      price: 900,
      numDays: 8,
      airlines: 'Turkish Airlines',
      airlnesAr: 'الخطوط الجوية التركية',
      food: 'Breakfast',
      foodAr: 'فطور',
      hotelStars: 4,
      shortDescription: '8 days in a 4-star hotels/ Turkish Airlines',
      shortDescriptionAr: '8 أيام في فندق أربع نجوم /  الخطوط الجوية التركية ',
      dateFrom: new DateTime(2018, 06, 13),
      dateTo: new DateTime(2018, 06, 21),
      cityActivities: [
        new CityActivity(
            cityName: 'Istanbul',
            cityNameAr: 'إسطنبول',
            dateFrom: new DateTime(2018, 06, 13),
            dateTo: new DateTime(2018, 06, 16),
            activitys: '',
            activitiesAr: '',
            photos: ['images/istanbul-2.jpg']),
        new CityActivity(
            cityName: 'Trabzon',
            cityNameAr: 'طرابزون',
            dateFrom: new DateTime(2018, 06, 17),
            dateTo: new DateTime(2018, 06, 20),
            activitys: '',
            activitiesAr: '',
            photos: ['images/Trabzon.jpg']),
        new CityActivity(
            cityName: 'Giresun',
            cityNameAr: 'غريسون',
            dateFrom: new DateTime(2018, 06, 17),
            dateTo: new DateTime(2018, 06, 20),
            activitys: '',
            activitiesAr: '',
            photos: ['images/giresun_turkey__by_bigzoso-dc0xmin.jpg']),
        new CityActivity(
            cityName: 'Ordu',
            cityNameAr: 'أُردو',
            dateFrom: new DateTime(2018, 06, 17),
            dateTo: new DateTime(2018, 06, 20),
            activitys: '',
            activitiesAr: '',
            photos: ['images/Ordu.jpg']),
      ]));

  // 3) Turkey
  destinations.add(Destination(
      title: 'Turkey',
      titleAr: 'تركيا',
      emoji: '🇹🇷',
      photo: 'images/Bodrum.jpg',
      price: 780,
      numDays: 8,
      airlines: 'Iraqi Airlines (Charter)',
      airlnesAr: 'الخطوط الجوية العراقية (چارتر)',
      food: 'Breakfast',
      foodAr: 'فطور',
      hotelStars: 5,
      shortDescription: '8 days - five-star hotels / Iraqi Airlines (Charter)',
      shortDescriptionAr:
          '8 أيام في فندق خمس نجوم /  الخطوط الجوية العراقية (جارتر)',
      dateFrom: new DateTime(2018, 06, 15),
      dateTo: new DateTime(2018, 06, 21),
      cityActivities: [
        new CityActivity(
            cityName: 'Istanbul',
            cityNameAr: 'إسطنبول',
            dateFrom: new DateTime(2018, 06, 13),
            dateTo: new DateTime(2018, 06, 15),
            activitys: '',
            activitiesAr: '',
            photos: []),
        new CityActivity(
            cityName: 'Marmaris',
            cityNameAr: 'مرمريس',
            dateFrom: new DateTime(2018, 06, 16),
            dateTo: new DateTime(2018, 06, 20),
            activitys: '',
            activitiesAr: '',
            photos: []),
        new CityActivity(
            cityName: 'Fethiye',
            cityNameAr: 'فتحية',
            dateFrom: new DateTime(2018, 06, 16),
            dateTo: new DateTime(2018, 06, 20),
            activitys: '',
            activitiesAr: '',
            photos: []),
        new CityActivity(
            cityName: 'Bodrum',
            cityNameAr: 'بودروم',
            dateFrom: new DateTime(2018, 06, 16),
            dateTo: new DateTime(2018, 06, 20),
            activitys: '',
            activitiesAr: '',
            photos: []),
      ]));

  // 4) Ukraine
  destinations.add(Destination(
      title: 'Ukraine',
      titleAr: 'أوكرانيا',
      emoji: '🇺🇦',
      photo: 'images/ukraine.jpg',
      price: 1850,
      numDays: 8,
      airlines: 'Iraqi Airlines (Charter)',
      airlnesAr: 'الخطوط الجوية العراقية (چارتر)',
      food: 'Breakfast and dinner',
      foodAr: 'فطور و عشاء',
      hotelStars: 4,
      shortDescription: '8 days in a 4-star hotels/ Turkish Airlines',
      shortDescriptionAr: '8 أيام في فندق أربع نجوم /   الخطوط الجوية العراقية',
      dateFrom: new DateTime(2018, 06, 12),
      dateTo: new DateTime(2018, 06, 20),
      cityActivities: [
        new CityActivity(
            cityName: 'Kiev',
            cityNameAr: 'كييڤ',
            dateFrom: new DateTime(2018, 06, 13),
            dateTo: new DateTime(2018, 06, 15),
            activitys: '',
            activitiesAr: '',
            photos: []),
        new CityActivity(
            cityName: 'Odessa',
            cityNameAr: 'أوديسا',
            dateFrom: new DateTime(2018, 06, 16),
            dateTo: new DateTime(2018, 06, 20),
            activitys: '',
            activitiesAr: '',
            photos: [])
      ]));

  // 5) Armenia
  destinations.add(Destination(
      title: 'Armenia',
      titleAr: 'ارمينيا',
      emoji: '🇦🇲',
      photo: 'images/Armenia1.jpg',
      price: 700,
      numDays: 8,
      airlines: 'Iraqi Airlines (Charter)',
      airlnesAr: 'الخطوط الجوية العراقية (چارتر)',
      food: 'Breakfast and dinner',
      foodAr: 'فطور و عشاء',
      hotelStars: 4,
      shortDescription: '8 days - five-star hotels / Iraqi Airlines (Charter)',
      shortDescriptionAr:
          '8 أيام في فندق أربع نجوم /   الخطوط الجوية العراقية (جارتر)',
      dateFrom: new DateTime(2018, 06, 16),
      dateTo: new DateTime(2018, 06, 24),
      cityActivities: [
        new CityActivity(
            cityName: 'Kiev',
            cityNameAr: 'كييڤ',
            dateFrom: new DateTime(2018, 06, 13),
            dateTo: new DateTime(2018, 06, 15),
            activitys: '',
            activitiesAr: '',
            photos: []),
        new CityActivity(
            cityName: 'Odessa',
            cityNameAr: 'أوديسا',
            dateFrom: new DateTime(2018, 06, 16),
            dateTo: new DateTime(2018, 06, 20),
            activitys: '',
            activitiesAr: '',
            photos: [])
      ]));

  // 6) Tunisia
  destinations.add(Destination(
      title: 'Tunisia',
      titleAr: 'تونس',
      emoji: '🇹🇳',
      photo: 'images/Tunisia tourisim.jpg',
      price: 1100,
      numDays: 8,
      airlines: 'Royal Jordanian',
      airlnesAr: 'الملكية الاردنية',
      food: 'Breakfast and dinner',
      foodAr: 'فطور و عشاء',
      hotelStars: 5,
      shortDescription: '8 days - five-star hotels / Royal Jordanian',
      shortDescriptionAr: '8 أيام في فندق خمس نجوم / الملكية الاردنية',
      dateFrom: new DateTime(2018, 06, 15),
      dateTo: new DateTime(2018, 06, 23),
      cityActivities: [
        new CityActivity(
            cityName: 'Yasmine Hammamet',
            cityNameAr: 'ياسمين الحمامات',
            dateFrom: new DateTime(2018, 06, 15),
            dateTo: new DateTime(2018, 06, 18),
            activitys: '',
            activitiesAr: '',
            photos: []),
        new CityActivity(
            cityName: 'Capital of Tunisia',
            cityNameAr: 'تونس العاصمة',
            dateFrom: new DateTime(2018, 06, 19),
            dateTo: new DateTime(2018, 06, 23),
            activitys: '',
            activitiesAr: '',
            photos: [])
      ]));

  // 7) Egypt
  destinations.add(Destination(
      title: 'Egypt',
      titleAr: 'مصر',
      emoji: '🇪🇬',
      photo: 'images/egypt-pyramids.jpg',
      price: 550,
      numDays: 8,
      airlines: 'الخطوط الجوية العراقية',
      airlnesAr: 'Iraqi Airlines',
      food: 'Breakfast, launch, and dinner',
      foodAr: 'فطور و غداء و عشاء',
      hotelStars: 5,
      shortDescription: '8 days - five and four-star hotels / Iraqi Airlines',
      shortDescriptionAr:
          '8 أيام في فندق أربع و خمس نجوم /  الخطوط الجوية العراقية',
      dateFrom: new DateTime(2018, 06, 14),
      dateTo: new DateTime(2018, 06, 22),
      cityActivities: [
        new CityActivity(
            cityName: 'Cairo',
            cityNameAr: 'القاهرة',
            dateFrom: new DateTime(2018, 06, 15),
            dateTo: new DateTime(2018, 06, 18),
            activitys: '',
            activitiesAr: '',
            photos: []),
        new CityActivity(
            cityName: 'Sharm El Sheikh',
            cityNameAr: 'شرم الشيخ',
            dateFrom: new DateTime(2018, 06, 19),
            dateTo: new DateTime(2018, 06, 23),
            activitys: '',
            activitiesAr: '',
            photos: [])
      ]));

  // 8) Lebanon
  destinations.add(Destination(
      title: 'Lebanon',
      titleAr: 'لبنان',
      emoji: '🇱🇧',
      photo: 'images/lebanon travel.jpg',
      price: 550,
      numDays: 8,
      airlines: 'الخطوط الجوية العراقية',
      airlnesAr: 'Middle East Airlines',
      food: 'Breakfast, launch, and dinner',
      foodAr: 'فطور و غداء و عشاء',
      hotelStars: 5,
      shortDescription:
          '8 days - five and four-star hotels / Middle East Airlines',
      shortDescriptionAr:
          '8 أيام في فندق أربع و خمس نجوم / خطوط الشرق الاوسط اللبنانية',
      dateFrom: new DateTime(2018, 06, 14),
      dateTo: new DateTime(2018, 06, 22),
      cityActivities: [
        new CityActivity(
            cityName: 'Beirut',
            cityNameAr: 'بيروت',
            dateFrom: new DateTime(2018, 06, 14),
            dateTo: new DateTime(2018, 06, 18),
            activitys: '',
            activitiesAr: '',
            photos: []),
        new CityActivity(
            cityName: 'Faraya',
            cityNameAr: 'فاريا',
            dateFrom: new DateTime(2018, 06, 15),
            dateTo: new DateTime(2018, 06, 18),
            activitys: '',
            activitiesAr: '',
            photos: []),
        new CityActivity(
            cityName: 'Beqaa',
            cityNameAr: 'البقاع',
            dateFrom: new DateTime(2018, 06, 19),
            dateTo: new DateTime(2018, 06, 23),
            activitys: '',
            activitiesAr: '',
            photos: [])
      ]));

  // 9) Sea Trip
  destinations.add(Destination(
      title: 'Sea Trip: Lebanon, Trukey and Greece',
      titleAr: 'الرحلة البحرية - لبنان و تركيا و اليونان',
      emoji: '🛥 🇱🇧 🇹🇷 🇬🇷',
      photo: 'images/tourist-boat-trip.jpg',
      price: 1750,
      numDays: 8,
      airlines: 'Middle East Airlines',
      airlnesAr: 'خطوط الشرق الاوسط اللبنانية',
      food: 'Breakfast, launch, and dinner',
      foodAr: 'فطور و غداء و عشاء',
      hotelStars: 5,
      shortDescription:
          '8 days - five and four-star hotels / Middle East Airlines',
      shortDescriptionAr:
          '8 أيام في فندق أربع و خمس نجوم / خطوط الشرق الاوسط اللبنانية',
      dateFrom: new DateTime(2018, 06, 13),
      dateTo: new DateTime(2018, 06, 26),
      cityActivities: [
        new CityActivity(
            cityName: 'Beirut',
            cityNameAr: 'بيروت',
            dateFrom: new DateTime(2018, 06, 14),
            dateTo: new DateTime(2018, 06, 18),
            activitys: '',
            activitiesAr: '',
            photos: []),
        new CityActivity(
            cityName: 'Istanbul',
            cityNameAr: 'إسطنبول',
            dateFrom: new DateTime(2018, 06, 15),
            dateTo: new DateTime(2018, 06, 18),
            activitys: '',
            activitiesAr: '',
            photos: []),
        new CityActivity(
            cityName: 'Athens',
            cityNameAr: 'أثينا',
            dateFrom: new DateTime(2018, 06, 19),
            dateTo: new DateTime(2018, 06, 23),
            activitys: '',
            activitiesAr: '',
            photos: [])
      ]));

  // 10) Indonesia
  destinations.add(Destination(
      title: 'Indonesia',
      titleAr: 'إندونيسيا',
      emoji: '🇮🇩',
      photo: 'images/indonesia.jpg',
      price: 1350,
      numDays: 8,
      airlines: 'Iraqi Airlines',
      airlnesAr: 'الخطوط الجوية العراقية',
      food: 'Breakfast',
      foodAr: 'فطور',
      hotelStars: 5,
      shortDescription: '8 days - five and four-star hotels / Iraqi Airlines',
      shortDescriptionAr:
          '8 أيام في فندق أربع و خمس نجوم /  الخطوط الجوية العراقية ',
      dateFrom: new DateTime(2018, 06, 15),
      dateTo: new DateTime(2018, 06, 23),
      cityActivities: [
        new CityActivity(
            cityName: 'Kuala Lumpur',
            cityNameAr: 'كوالالمبور',
            dateFrom: new DateTime(2018, 06, 14),
            dateTo: new DateTime(2018, 06, 18),
            activitys: '',
            activitiesAr: '',
            photos: []),
        new CityActivity(
            cityName: 'Bali',
            cityNameAr: 'بالي',
            dateFrom: new DateTime(2018, 06, 15),
            dateTo: new DateTime(2018, 06, 18),
            activitys: '',
            activitiesAr: '',
            photos: []),
      ]));

  return destinations;
}

