;(function(e,t,n){function i(n,s){if(!t[n]){if(!e[n]){var o=typeof require=="function"&&require;if(!s&&o)return o(n,!0);if(r)return r(n,!0);throw new Error("Cannot find module '"+n+"'")}var u=t[n]={exports:{}};e[n][0](function(t){var r=e[n][1][t];return i(r?r:t)},u,u.exports)}return t[n].exports}var r=typeof require=="function"&&require;for(var s=0;s<n.length;s++)i(n[s]);return i})({1:[function(require,module,exports){
(function() {
  var Slice, SliceManager;

  Slice = require('./Slice.coffee');

  SliceManager = (function() {
    SliceManager.prototype.menuContainer = '#mainMenu li:not(.menu-item-25) a';

    SliceManager.prototype.sliceContainer = '#slices';

    SliceManager.prototype.slices = [];

    function SliceManager() {
      this.build();
      return this;
    }

    SliceManager.prototype.build = function() {
      var sliceContainer, that;
      that = this;
      sliceContainer = $(this.sliceContainer);
      $(this.menuContainer).each(function() {
        return that.slices.push(new Slice($(this), sliceContainer));
      });
      return this;
    };

    return SliceManager;

  })();

  $(document).on('ready', function() {
    var sm;
    return sm = new SliceManager;
  });

}).call(this);


},{"./Slice.coffee":2}],2:[function(require,module,exports){
(function() {
  var Slice;

  module.exports = Slice = (function() {
    Slice.prototype.contentConainer = '#main';

    function Slice($menuItem, $sliceContainer) {
      this.$menuItem = $menuItem;
      this.$sliceContainer = $sliceContainer;
      this.build();
      return this;
    }

    Slice.prototype.build = function() {
      var _this = this;
      this.$slice = $('<div/>').addClass('slice').appendTo(this.$sliceContainer);
      return $.get(this.$menuItem.attr('href')).done(function(data) {
        var $content;
        $content = $(data).find(_this.contentConainer);
        return _this.$slice.append($content);
      });
    };

    return Slice;

  })();

}).call(this);


},{}]},{},[1])
;