class FindLocationSettingData {
  FindLocationSettingData({required this.location,
    required this.locationSpecific,
    required this.locationIsOn});

  final String location;
  final List<String> locationSpecific;
  late List<bool> locationIsOn;

  static FindLocationSettingData seoulGangnam = FindLocationSettingData(
      location: "서울-강남", locationSpecific: [
    "전체",
    "건대/군자/광진",
    "광화문",
    "대학로/혜화",
    "마포/공덕",
    "상암/성산",
    "신촌/이대",
    "연남동",
    "용산/숙대",
    "이태원/한남동",
    "종로",
    "중구",
    "합정/망원",
    "홍대"
  ], locationIsOn: List<bool>.filled(14, false));
}


