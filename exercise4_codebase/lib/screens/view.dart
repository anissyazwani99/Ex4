//? MOBILE APPLICATION PROGRAMMING
//? Exercise 4

// Date: 15/1/2022
// Member 1's Name: Tachaini a/p Karunanithi    Section: 01   Location: Ulu Tiram, Johor (i.e. where are you currently located)
// Member 2's Name: Anis Syazwani binti Md. Aini    Section: 02   Location: Semenyih

// Log the time(s) your pair programming sessions
//  Date         Time (From)   To             Duration (in minutes)
//  _________    ___________   ___________    ________
//  _________    ___________   ___________    ________
//  _________    ___________   ___________    ________

// Turn of null-safety by writing the following line
// @dart=2.9

//? The view classes are fully given. You are not expected to modify this file.
//? However, if you feel like to add something or do any changes. Feel free to do so.

// Author: jumail@utm.my.
// Date: Dec 2021

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../app/service_locator.dart';
import 'viewmodel.dart';

//----------------------------------------------------------------------------
// Default View is with Consumer and ChangeNotifierProvier
//----------------------------------------------------------------------------

typedef ViewmodelWidgetBuilder<V> = Widget Function(BuildContext, V, Widget);
typedef ViewmodelSelector<V, S> = S Function(BuildContext, V);
typedef ViewmodelSelectorWidgetBuilder<V, S> = Widget Function(
    BuildContext, V, S, Widget);
typedef AsyncViewmodelCallback<V> = Future<void> Function(V);
typedef ViewmodelCallback<V> = void Function(V);
typedef SelectorShouldRebuildBuilder<T1, T2> = bool Function(T1, T2);

// The abstract class is meant for reducing code duplication

abstract class _AbstractView<V extends Viewmodel> extends StatelessWidget {
  final ViewmodelWidgetBuilder<V> _progressBuilder;
  final ViewmodelWidgetBuilder<V> _builder;
  final Widget _child;
  final V _viewmodel = _viewmodelBuilder();
  V get viewmodel => _viewmodel;

  final bool _showProgressIndicator;

//----------------------------------------------------------------------------
// Helper methods
//----------------------------------------------------------------------------
  static V _viewmodelBuilder<V extends Viewmodel>() {
    final viewmodel = locator<V>();
    if (!viewmodel.initialized) {
      viewmodel.markInitialized();
      viewmodel.init();
    }
    return viewmodel;
  }

  static Widget _defaultProgressBuilder(_, __, ___) =>
      Center(child: CircularProgressIndicator());
//----------------------------------------------------------------------------

  _AbstractView(
      {ViewmodelWidgetBuilder<V> progressBuilder = _defaultProgressBuilder,
      ViewmodelWidgetBuilder<V> builder,
      bool showProgressIndicator = true,
      Widget child})
      : _progressBuilder = progressBuilder ?? _defaultProgressBuilder,
        _showProgressIndicator =
            progressBuilder != null ? true : showProgressIndicator,
        _builder = builder,
        _child = child;

  Widget _baseBuilder(BuildContext context, V viewmodel, Widget child) {
    if (viewmodel.busy || !viewmodel.initialized) {
      if (_showProgressIndicator) {
        return _progressBuilder?.call(context, viewmodel, null);
      }
    }
    return _builder?.call(context, viewmodel, child);
  }
}

/// `View` is the default class to a create view (based on MVVM architechture).
/// Each view will be associated with a viewmodel.
///
/// The `View` class is using `Consumer` widget from `Provider` for dependency injection
/// When a view is created, a viewmodel will also be created and associated
/// to it automatically.
///
/// You need to tell, which viewmodel to be used by specifying the
/// the class of the viewmodel when creating a view. See the example code below.
/// Also, you will need to register the viewmodel as a singleton in the service locator beforehand.
/// (see the file app/service_locator.dart)
///
/// *Example*:
///
///```dart
/// View<HomeViewmodel>(
///   showProgressIndicator: false,
///   progressIndicatorBuilder: (_,__)=>LineProgressIndicator(),
///   builder: (_, vm, ___) => Text('${vm.counter?.value}',
///       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
/// ),
/// ```
///
/// **properties:**
///
/// `progressBuilder` : a callback to build progress indicator. The default
/// progress indicator is `CircularProgressIndicator()`. If you want to
/// override the default progress indicator, set a new callback.
///
/// *Example*:
///
///```dart
///   progressIndicatorBuilder: (_,__)=>Text('Wait!. In progress...', style:TextStyle(color:Colors.red) ),
/// ```
///
/// `builder` : a callback to build the actual widget or content.
///
/// *Example*:
///
///```dart
///   builder: (context, viewmodel, child) => Text('${viewmodel.counter?.value}',
///       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
/// ```
///
/// `showProgressIndicator` : a bool value, to show or not to show progress indicator when
/// the viewmodel is busy. If the `progressBuilder` is specified, `showProgressIndicator` is
/// overriden.
///
/// `shouldRebuid` : a bool value, to allow or not the widget gets rebuild. An example
/// use case is that when you want a widget to rebuild other widgets but not itself.
/// For example, in a counter app, you can set `shouldRebuild` to `false` for the button widget.
///

class View<V extends Viewmodel> extends _AbstractView<V> {
  final bool _shouldRebuild;

  View(
      {bool shouldRebuild = true,
      bool showProgressIndicator = true,
      @required ViewmodelWidgetBuilder<V> builder,
      ViewmodelWidgetBuilder<V> progressBuilder,
      Widget child})
      : _shouldRebuild = shouldRebuild,
        super(
            builder: builder,
            child: child,
            progressBuilder: progressBuilder,
            showProgressIndicator: showProgressIndicator);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewmodel,
        child: _shouldRebuild
            ? Consumer<V>(builder: _baseBuilder)
            : _builder(context, viewmodel, _child));
  }
}

/// `SelectorView` is another class of view, but `Selector` widget.
/// It allows to rebuild selectively.
///
/// The `SelectorView` class is using `Selector` widget from `Provider` for dependency injection
/// When a view is created, a viewmodel will also be created and associated
/// to it automatically.
///
/// You need to tell, which viewmodel to be used by specifying the
/// the class of the viewmodel when creating a view. See the example code below.
/// Also, you will need to register the viewmodel as a singleton in the service locator beforehand.
/// (see the file app/service_locator.dart)
///
/// *Example*:
///
///```dart
/// SelectorView<HomeViewmodel, int>(
///     showProgressIndicator: false,
///     selector: (_, vm) => vm.counter?.value,
///     builder: (_, __, value, ___) {
///             return Text('${value ?? ""}',
///                         style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold));
///             },
///  )
/// ```
///
/// **properties:**
///
/// `progressBuilder` : a callback to build progress indicator. The default
/// progress indicator is `CircularProgressIndicator()`. If you want to
/// override the default progress indicator, set a new callback.
///
/// *Example*:
///
///```dart
///   progressIndicatorBuilder: (_,__)=>Text('Wait!. In progress...', style:TextStyle(color:Colors.red) ),
/// ```
///
/// `builder` : a callback to build the actual widget or content.
///
/// *Example*:
///
///```dart
///     builder: (context, viewmodel, selectorValue, child) {
///             return Text('${selectorValue ?? ""}',
///                         style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold));
///             },
/// ```
///
/// `selector` : a callback to decide whether to re-build or not the widget.
/// The callback will return a value. It use this value to decide whether to rebuild
/// by comparing the current value with the previous one (i.e., from the last rebuilt)
/// Widget will get rebuilt if the values are different.
///
/// A use case for this property, for example, in a todo list app, you only want
/// to rebuild the entire list if the size of the list gets changed, due to for example
/// deletion or insertion of new todos.  However, if the case that only update
/// an existing item, the list should not be re-build, but only that one item.
///
/// However, the `selector` will not take an effect if `showProgressIndicator` is `true`.
/// This makes sense because, showing progress indicator will rebuild the widget.
/// Therefore, if it is necessary to have selective build, you should set `showProgressIndicator` to `false`.
///
/// In the following example, the widget will get rebuilt only if the counter value gets changed
///
/// *Example*:
///
///```dart
/// selector: (context, viewmodel) => viewmodel.counter?.value.
/// ```
///
/// `showProgressIndicator` : a bool value, to show or not to show progress indicator when
/// the viewmodel is busy. If the `progressBuilder` is specified, `showProgressIndicator` is
/// overriden.
///

class SelectorView<V extends Viewmodel, S> extends _AbstractView<V> {
  final ViewmodelSelector<V, S> _selector;

// helper methods
  SelectorShouldRebuildBuilder _buildShouldRebuildCallback() {
    if (!viewmodel.busy || !_showProgressIndicator) return null;
    return (_, __) => true;
  }

  SelectorView(
      {bool showProgressIndicator = true,
      @required ViewmodelSelectorWidgetBuilder<V, S> builder,
      @required ViewmodelSelector<V, S> selector,
      ViewmodelWidgetBuilder<V> progressBuilder,
      Widget child})
      : _selector = selector,
        super(
            builder: (context, viewmodel, child) => builder(
                context, viewmodel, selector(context, viewmodel), child),
            child: child,
            progressBuilder: progressBuilder,
            showProgressIndicator: showProgressIndicator);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: _viewmodel,
        child: Selector<V, Tuple2<V, S>>(
          shouldRebuild: _buildShouldRebuildCallback(),
          selector: (context, viewmodel) =>
              Tuple2(viewmodel, _selector(context, viewmodel)),
          builder: (context, data, child) =>
              _baseBuilder(context, data.item1, child),
          child: _child,
        ));
  }
}
