import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CleanController extends ChangeNotifier {
  final Ref ref;

  CleanController({
    required this.ref,
  });

  int currentIndex = 1; 
  
  final int totalPages = 4;

  double get progress => currentIndex / totalPages;

  void nextPage() {
    if (currentIndex < totalPages) {
      currentIndex++;
      notifyListeners();
    }
  }

  void previousPage() {
    if (currentIndex > 1 ) {
      currentIndex--;
      notifyListeners();
    }
  }

  int vehicle = 0;
   selectVehicleType(int index) {
    vehicle = index;
    notifyListeners();
  }
}

final homeBookingsCtrl =
    ChangeNotifierProvider.autoDispose<CleanController>((ref) {
  return CleanController(ref: ref);
});



class ProgressController {
  final PageController pageController = PageController();
  int currentPage = 0;
  final int totalPages;

  ProgressController({required this.totalPages});

  void nextPage(VoidCallback onUpdate) {
    if (currentPage < totalPages - 1) {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      onUpdate();
    }
  }

  void previousPage(VoidCallback onUpdate) {
    if (currentPage > 0) {
      currentPage--;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      onUpdate();
    }
  }

  void dispose() {
    pageController.dispose();
  }
}