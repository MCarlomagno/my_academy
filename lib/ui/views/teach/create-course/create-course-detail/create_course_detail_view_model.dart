import 'package:my_academy/app/locator.dart';
import 'package:my_academy/app/router.gr.dart';
import 'package:my_academy/models/module_model.dart';
import 'package:my_academy/services/api/modules_service.dart';
import 'package:my_academy/services/ui_services/teach_view_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateCourseDetailViewModel extends BaseViewModel {
  /// Service Injection
  NavigationService _navigationService = locator<NavigationService>();
  ModulesService _modulesService = locator<ModulesService>();
  TeachViewService _teachViewService = locator<TeachViewService>();

  List<Module> _modules = [];
  List<Module> get modules => this._modules;

  int _courseId;

  onModelReady(int courseId) async {
    this._courseId = courseId;
    setBusy(true);
    this._modules = await _modulesService.getModulesByCourseId(courseId);
    setBusy(false);
  }

  Future<void> onRefresh() async {
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    return;
  }

  onBackButtonPressed() {
    _teachViewService.loadList();
    _navigationService.popUntil((route) => route.settings.name == Routes.homeViewRoute);
  }

  createModule() async {
    /// result: true -> means that the module was successfully created
    /// resutl: false -> meeans that the user got back
    CreateModuleViewArguments createModuleViewArguments = CreateModuleViewArguments(courseId: this._courseId);
    bool result = await _navigationService.navigateTo(Routes.createModuleView, arguments: createModuleViewArguments);
    setBusy(true);
    if(result != null && result) {
      this._modules = await _modulesService.getModulesByCourseId(this._courseId);
    }
    setBusy(false);
  }
}
