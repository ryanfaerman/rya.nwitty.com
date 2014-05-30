domready ->
  elem = document.querySelector('.header')
  headroom = new Headroom(elem, {tolerance: {down : 10, up : 20}});
  headroom.init();

  for p in document.querySelectorAll('article h3+p')
    text = p.innerHTML.split(' ')
    text.splice(5,1, '</span>')
    text.unshift('<span>')
    p.innerHTML = text.join(' ')