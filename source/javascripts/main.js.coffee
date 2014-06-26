domready ->
  elem = document.querySelector('.header')
  headroom = new Headroom(elem, {tolerance: {down : 10, up : 20}});
  headroom.init();