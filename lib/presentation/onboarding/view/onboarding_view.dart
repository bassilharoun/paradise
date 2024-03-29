import 'package:avanced_course/domain/models/models.dart';
import 'package:avanced_course/presentation/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:avanced_course/presentation/resources/assets_manager.dart';
import 'package:avanced_course/presentation/resources/color_manager.dart';
import 'package:avanced_course/presentation/resources/constant_manager.dart';
import 'package:avanced_course/presentation/resources/routes_manager.dart';
import 'package:avanced_course/presentation/resources/strings_manager.dart';
import 'package:avanced_course/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() {
    // meains "connect"
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _viewModel.outputSliderViewObject,
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data);
        });
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return const SizedBox();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarBrightness: Brightness.dark),
        ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: sliderViewObject.numOfSlides,
            onPageChanged: (index) {
              _viewModel.onPageChanged(index);
            },
            itemBuilder: (context, index) {
              return OnBoardingPage(sliderViewObject.sliderObject);
            }),
        bottomSheet: Container(
          color: ColorManager.white,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  AppStrings.skip,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.end,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
              ),
            ),
            _getBottomSheetWidget(sliderViewObject),
          ]
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject? sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(
                  ImageAssets.arrowLeftIc,
                  color: ColorManager.white,
                ),
              ),
            ),
            onTap: () {
              _pageController.animateToPage(_viewModel.goPreviousPage(),
                  duration: const Duration(
                      milliseconds: AppConstants.sliderAnimationTime),
                  curve: Curves.bounceOut);
            },
          ),
          Row(
            children: [
              for (int i = 0; i < sliderViewObject!.numOfSlides; i++)
                Padding(
                    padding: const EdgeInsets.all(AppPadding.p12),
                    child: _getProperCircle(i, sliderViewObject.currentIndex)),
            ],
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(
                  ImageAssets.arrowRightIc,
                  color: ColorManager.white,
                ),
              ),
            ),
            onTap: () {
              _pageController.animateToPage(_viewModel.goNextPage(),
                  duration: const Duration(
                      milliseconds: AppConstants.sliderAnimationTime),
                  curve: Curves.bounceInOut);
            },
          ),
        ],
      ),
    );
  }

  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(
        ImageAssets.hollowCircleIc,
        color: ColorManager.white,
        height: AppSize.s20,
      );
    } else {
      return SvgPicture.asset(
        ImageAssets.solidCircleIc,
        color: ColorManager.white,
        height: AppSize.s18,
      );
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        if (_sliderObject.image.endsWith(".svg"))
          Container(
              height: AppSize.s300,
              child: SvgPicture.asset(_sliderObject.image)),
        if (_sliderObject.image.endsWith(".gif"))
          Image.asset(_sliderObject.image),
      ],
    );
  }
}
