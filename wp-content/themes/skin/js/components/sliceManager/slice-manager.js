;(function(e,t,n){function i(n,s){if(!t[n]){if(!e[n]){var o=typeof require=="function"&&require;if(!s&&o)return o(n,!0);if(r)return r(n,!0);throw new Error("Cannot find module '"+n+"'")}var u=t[n]={exports:{}};e[n][0](function(t){var r=e[n][1][t];return i(r?r:t)},u,u.exports)}return t[n].exports}var r=typeof require=="function"&&require;for(var s=0;s<n.length;s++)i(n[s]);return i})({1:[function(require,module,exports){
(function() {
  var Slice, SliceManager,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Slice = require('./Slice.coffee');

  SliceManager = (function() {
    SliceManager.prototype.menuSelector = '#mainMenu li';

    SliceManager.prototype.slicesSelector = '#slices';

    SliceManager.prototype.slicesArrowSelector = '#slices-arrows';

    SliceManager.prototype.slices = [];

    function SliceManager() {
      this.keyPressed = __bind(this.keyPressed, this);
      this.clickOnMenuItem = __bind(this.clickOnMenuItem, this);
      this.gotoPreviousSlice = __bind(this.gotoPreviousSlice, this);
      this.gotoNextSlice = __bind(this.gotoNextSlice, this);
      this.build().gotoSlice(0).binds();
      return this;
    }

    SliceManager.prototype.build = function() {
      var sliceContainer, that;
      that = this;
      sliceContainer = $(this.slicesSelector);
      $(this.menuSelector + ' a').each(function() {
        if ($(this).parent().hasClass('menu-item-25')) {
          that.slices.splice(0, 0, new Slice($(this), sliceContainer, false));
        } else {
          that.slices.push(new Slice($(this), sliceContainer, true));
        }
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
        this.refreshMenu(index);
      }
      return this;
    };

    SliceManager.prototype.gotoNextSlice = function() {
      var currentIndex;
      currentIndex = $(this.slicesSelector + ' .current').index();
      this.gotoSlice(currentIndex + 1);
      return this;
    };

    SliceManager.prototype.gotoPreviousSlice = function() {
      var currentIndex;
      currentIndex = $(this.slicesSelector + ' .current').index();
      this.gotoSlice(currentIndex - 1);
      return this;
    };

    SliceManager.prototype.refreshMenu = function(index) {
      var _ref;
      $(this.menuSelector).removeClass('active');
      if ((_ref = this.slices[index]) != null) {
        _ref.$menuItem.closest('li').addClass('active');
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

    SliceManager.prototype.keyPressed = function(e) {
      switch (e != null ? e.which : void 0) {
        case 37:
        case 38:
          this.gotoPreviousSlice();
          break;
        case 39:
        case 40:
          this.gotoNextSlice();
      }
      console.log(e.which);
      return this;
    };

    SliceManager.prototype.binds = function() {
      var next, prev;
      next = this.gotoNextSlice;
      prev = this.gotoPreviousSlice;
      $(this.slicesArrowSelector + ' .right').on('click', next);
      $(this.slicesArrowSelector + ' .left').on('click', prev);
      $('body').hammer().on('swipeleft panleft pandown', _.debounce(next, 300));
      $('body').hammer().on('panright panup', _.debounce(prev, 300));
      $('body').on('keydown', _.debounce(this.keyPressed, 300));
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

    function Slice($menuItem, $sliceContainer, append) {
      this.$menuItem = $menuItem;
      this.$sliceContainer = $sliceContainer;
      this.append = append;
      this.build();
      return this;
    }

    Slice.prototype.build = function() {
      var _this = this;
      if (this.append) {
        this.$slice = $('<div/>').addClass('slice').appendTo(this.$sliceContainer);
        $.get(this.$menuItem.attr('href')).done(function(data) {
          var $content;
          $content = $(data).find(_this.contentConainer);
          return _this.buildSlice($content);
        });
      } else {
        this.$slice = $('#content-page-0').prependTo(this.$sliceContainer);
        this.buildSlice(this.$slice.find(this.contentConainer));
      }
      return this;
    };

    Slice.prototype.buildSlice = function($content) {
      this.$slice.addClass($content.attr('class')).addClass(this.$menuItem.closest('li').attr('id')).removeClass('page').removeClass('main');
      $content.attr('id', '').attr('role', '').attr('class', function(i, c) {
        return c.replace(/(^|\s)content-page-\S+/g, '');
      });
      this.$slice.append($content);
      $content.css('height', $content.height()).addClass('verticalAlignMiddle');
      return this;
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