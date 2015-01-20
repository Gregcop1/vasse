;(function(e,t,n){function i(n,s){if(!t[n]){if(!e[n]){var o=typeof require=="function"&&require;if(!s&&o)return o(n,!0);if(r)return r(n,!0);throw new Error("Cannot find module '"+n+"'")}var u=t[n]={exports:{}};e[n][0](function(t){var r=e[n][1][t];return i(r?r:t)},u,u.exports)}return t[n].exports}var r=typeof require=="function"&&require;for(var s=0;s<n.length;s++)i(n[s]);return i})({1:[function(require,module,exports){
(function() {
  var Slice, SliceManager,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Slice = require('./Slice.coffee');

  SliceManager = (function() {
    SliceManager.prototype.menuSelector = '#mainMenu li:not(.menu-item-25)';

    SliceManager.prototype.slicesSelector = '#slices';

    SliceManager.prototype.slices = [];

    function SliceManager() {
      this.clickOnMenuItem = __bind(this.clickOnMenuItem, this);
      this.build().gotoSlice(0);
      return this;
    }

    SliceManager.prototype.build = function() {
      var sliceContainer, that;
      that = this;
      sliceContainer = $(this.slicesSelector);
      $(this.menuSelector + ' a').each(function() {
        that.slices.push(new Slice($(this), sliceContainer));
        return $(this).on('click', that.clickOnMenuItem);
      });
      return this;
    };

    SliceManager.prototype.gotoSlice = function(index) {
      if (index >= 0 && this.slices[index]) {
        this.slices.map(function(item, key) {
          if (key < index) {
            return item.gotoPrev();
          } else if (key === index) {
            return item.gotoCurrent();
          } else {
            return item.gotoNext();
          }
        });
      }
      return this;
    };

    SliceManager.prototype.clickOnMenuItem = function(e) {
      var $menuItem;
      e.preventDefault();
      $menuItem = $(e != null ? e.target : void 0).closest('li');
      this.gotoSlice($(this.slicesSelector + ' .' + $menuItem.attr('id')).index());
      return false;
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
        _this.$slice.addClass($content.attr('class')).addClass(_this.$menuItem.closest('li').attr('id')).removeClass('page').removeClass('main');
        $content.attr('id', '').attr('role', '').attr('class', function(i, c) {
          return c.replace(/(^|\s)content-page-\S+/g, '');
        });
        return _this.$slice.append($content);
      });
    };

    Slice.prototype.gotoPrev = function() {
      this.$slice.addClass('prev').removeClass('current').removeClass('next');
      return this;
    };

    Slice.prototype.gotoCurrent = function() {
      this.$slice.addClass('current').removeClass('prev').removeClass('next');
      return this;
    };

    Slice.prototype.gotoNext = function() {
      this.$slice.addClass('next').removeClass('current').removeClass('prev');
      return this;
    };

    return Slice;

  })();

}).call(this);


},{}]},{},[1])
;