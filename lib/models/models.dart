class Destination {
  Destination(
      {this.title,
      this.titleAr,
      this.emoji,
      this.photo,
      this.price,
      this.numDays,
      this.hotelStars,
      this.airlines,
      this.airlinesAr,
      this.food,
      this.foodAr,
      this.shortDescription,
      this.shortDescriptionAr,
      this.dateFrom,
      this.dateTo,
      this.cityActivities});

  final String title;
  final String titleAr;
  final String emoji;
  final String photo;
  final int price;
  final int numDays;
  final int hotelStars;
  final String airlines;
  final String airlinesAr;
  final String food;
  final String foodAr;
  final String shortDescription;
  final String shortDescriptionAr;
  final DateTime dateFrom;
  final DateTime dateTo;
  final List<CityActivity> cityActivities;
}

class CityActivity {
  CityActivity(
      {this.cityName,
      this.cityNameAr,
      this.photos,
      this.dateFrom,
      this.dateTo,
      this.activitys,
      this.activitiesAr});

  final String cityName;
  final String cityNameAr;
  final List<String> photos;
  final DateTime dateFrom;
  final DateTime dateTo;
  final String activitys;
  final String activitiesAr;
}
