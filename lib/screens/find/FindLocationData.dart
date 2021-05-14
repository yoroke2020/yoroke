import 'dart:collection';

import 'dart:convert';

import 'package:yoroke/screens/find/Find.dart';

class FindLocationData {
  FindLocationData() {
    regionListLength = LocationName.regionNameList.length;
    this.regionList = <RegionData>[];
    for (int i = 0; i < regionListLength; i++) {
      regionList.add(new RegionData(regionIndex: i));
    }
    selectedCityCount = 0;
  }

  late List<RegionData> regionList;
  late int regionListLength;
  late int selectedCityCount;

  void onPressedCityButton(int regionIndex, int cityIndex) {
    RegionData regionData = regionList[regionIndex];
    CityData cityData = regionData.cityList[cityIndex];
    bool isSelected = !cityData.isSelected;
    cityData.isSelected = isSelected;
    if (isSelected) {
      regionData.selectCity(cityIndex);
      selectedCityCount++;
    } else {
      regionData.deselectCity(cityIndex);
      selectedCityCount--;
    }
  }

  void onPressedAllButton(int regionIndex) {
    RegionData regionData = regionList[regionIndex];
    bool isSelected = !regionData.isSelected;
    if (isSelected) {
      selectedCityCount +=
          regionData.cityListLength - regionData.selectedCity.length;
      regionData.selectAllCities();
    } else {
      selectedCityCount -= regionData.selectedCity.length;
      regionData.deselectAllCities();
    }
  }

  bool isNotEmpty() {
    return selectedCityCount > 0;
  }

  bool isCitySelected(int regionIndex, int cityIndex) {
    RegionData regionData = regionList[regionIndex];
    CityData city = regionData.cityList[cityIndex];
    return city.isSelected;
  }

  bool isRegionSelected(int regionIndex) {
    RegionData regionData = regionList[regionIndex];
    return regionData.isSelected;
  }
}

class RegionData {
  RegionData({required this.regionIndex}) {
    cityList = <CityData>[];
    cityListLength = LocationName.cityNameList[regionIndex].length;
    for (int i = 0; i < cityListLength; i++) {
      cityList.add(new CityData(cityIndex: i));
    }
    selectedCity = new SplayTreeSet();
    isSelected = false;
  }

  late int regionIndex;
  late bool isSelected;

  late List<CityData> cityList;
  late int cityListLength;
  late SplayTreeSet<int> selectedCity;

  selectCity(int index) {
    this.selectedCity.add(index);
    if (this.selectedCity.length == cityListLength) {
      this.isSelected = true;
    }
  }

  deselectCity(int index) {
    this.selectedCity.remove(index);
    if (this.selectedCity.length != cityListLength) {
      this.isSelected = false;
    }
  }

  selectAllCities() {
    for (int i = 0; i < this.cityListLength; i++) {
      CityData cityData = this.cityList[i];
      if (!cityData.isSelected) {
        this.selectedCity.add(i);
        cityData.isSelected = true;
      }
    }
    isSelected = true;
  }

  deselectAllCities() {
    for (int i = 0; i < this.cityListLength; i++) {
      CityData cityData = this.cityList[i];
      if (cityData.isSelected) {
        this.selectedCity.remove(i);
        cityData.isSelected = false;
      }
    }
    isSelected = false;
  }
}

class CityData {
  CityData({required this.cityIndex, this.isSelected = false});

  late int cityIndex;
  late bool isSelected;
}

class LocationName {
  static final List<String> regionNameList = [
    "서울-강남",
    "서울-강북",
    "경기도",
    "인천",
    "대구",
    "부산",
    "제주",
    "대전",
    // "광주",
    // "강원도",
    // "경상남도",
    // "경상북도",
    // "전라남도",
    // "전라북도",
    // "충청남도",
    // "충청북도",
    // "울산",
    // "세종"
  ];

  static List<List<String>> cityNameList = [
    ["가로수길", "강남역", "강동구", "개포/수서/일원", "관악구", "교대/서초", "구로구"],
    ["건대/군자/광진"],
    ["가평군", "고양시"],
    ["강화군", "계양구", "남동구"],
    ["남구"],
    ["강서구", "금정구"],
    ["모슬포/화순"],
    ["대덕구"],
  ];
}
