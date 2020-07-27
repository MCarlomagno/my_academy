
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = localizationValues;

  Map<String, String> get values {
    return _localizedValues[locale.languageCode];
  }
}

class DemoLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}

const localizationValues = {
    'es': {
      'sign_in': 'Iniciar',
      'enter': 'Ingresar',
      'school': 'Escuela',
      'sign_up': 'Registrarse',
      'email_required': 'Email requerido',
      'email': 'Email',
      'password_required': 'Contraseña requerida',
      'password': 'Contraseña',
      'name_required': 'Nombre requerido',
      'name': 'Nombre',
      'surname_required': 'Apellido requerido',
      'surname': 'Apellido',
      'unexpected_error': 'Error inesperado',
      'search': 'Buscar',
      'create': 'Crear',
      'profile': 'Perfil',
      'profile_not_logged': 'Unirte te da la oportunidad de compartir lo que sabes.',
      'my_courses': 'Mis Cursos',
      'school_not_logged': 'Siempre hay una buena excusa para aprender algo nuevo.',
      'learn': 'Aprender',
      'search_courses': 'Buscar cursos',
      'recommended': 'Recomendados para ti',
      'popular': 'Más populares',
      'last_created': 'Últimos creados',
      'at_least_three_letters': 'La busqueda debe tener al menos 3 letras.',
      'not_results_found': 'No se encontraron resultados.',
      'description': 'Descripción',
      'modules': 'Módulos',
      'enroll': 'Inscribirse',
      'created_courses': 'Cursos creados',
      'teach_not_logged': 'Todos tenemos algo para enseñar, esta es tu oportunidad.',
      'teach': 'Enseñar',
      'title': 'Título',
      'course_modules': 'Módulos de tu curso',
      'create_module': 'Crear módulo',
      'classes': 'Clases',
      'create_class': 'Crear clase',
      'delete_module': 'Borrar módulo',
      'edit_class': 'Editar clase',
      'delete': 'Borrar',
      'community': 'Comunidad'
    },
    'en': {
      'sign_in': 'Sign in',
      'school': 'School',
      'enter': 'Start',
      'sign_up': 'Sign up',
      'email_required': 'Email required',
      'email': 'Email',
      'password_required': 'Password required',
      'password': 'Password',
      'name_required': 'Name required',
      'name': 'Name',
      'surname_required': 'Surname required',
      'surname': 'Surname',
      'unexpected_error': 'Unexpected error',
      'search': 'Search',
      'create': 'Create',
      'profile': 'Profile',
      'profile_not_logged': 'Joining gives you an opportunity to share what you know.',
      'my_courses': 'My courses',
      'school_not_logged': 'There is always a good excuse to learn something new.',
      'learn': 'Learn',
      'search_courses': 'Search courses',
      'recommended': 'Rcommended for you',
      'popular': 'Popular',
      'last_created': 'Last created',
      'at_least_three_letters': 'The search must have at least 3 letters.',
      'not_results_found': 'No results found.',
      'description': 'Description',
      'modules': 'Modules',
      'enroll': 'Enroll',
      'created_courses': 'Created courses',
      'teach_not_logged': 'We all have something to teach, this is your chance.',
      'teach': 'Teach',
      'title': 'Title',
      'course_modules': 'Course modules',
      'create_module': 'Create module',
      'classes': 'Classes',
      'create_class': 'Create class',
      'delete_module': 'Delete module',
      'edit_class': 'Edit class',
      'delete': 'Delete',
      'community': 'Community'
    },
  };