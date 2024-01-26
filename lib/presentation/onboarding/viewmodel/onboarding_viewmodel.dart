import 'dart:async';

import 'package:avanced_course/domain/models/models.dart';
import 'package:avanced_course/presentation/base/baseviewmodel.dart';
import 'package:avanced_course/presentation/resources/assets_manager.dart';
import 'package:avanced_course/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list; // will crash if not initialized
  int _currentIndex = 0;

  //onboarding viewmodel Inputs
  @override
  void dispose() {
    _streamController.close();
    // TODO: implement dispose
  }

  @override
  void start() {
    _list = _getSliderData();

    _postDataToView();
  }

  @override
  int goNextPage() {
    if (_currentIndex == _list.length - 1) {
      return 0;
    } else {
      return _currentIndex + 1;
    }
  }

  @override
  int goPreviousPage() {
    if (_currentIndex == 0) {
      return _list.length - 1;
    } else {
      return _currentIndex - 1;
    }
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController
      .sink; // use this instance to use stream controller sink to send data to the stream

  //onboarding viewmodel outputs
  @override
  // the map here used if you want to change the data before sending it to the stream
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) =>
          sliderViewObject); // use this instance to use stream controller stream to receive data from the stream

  // onboarding viewmodel private methods
  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),
      ];

  void _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

//inputs is a "orders" that the view can send to the viewmodel
abstract class OnBoardingViewModelInputs { // inputs is a "orders" that the view can send to the viewmodel
  int goNextPage();
  int goPreviousPage();
  void onPageChanged(int index);

  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs { // outputs is a "orders" that the viewmodel can send to the view
  Stream<SliderViewObject> get outputSliderViewObject;
}
