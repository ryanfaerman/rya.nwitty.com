+++
date = "2011-02-10T00:00:00-04:00"
title = "4D Systems Touch Display"
aliases = [
  "/projects/2011/02/10/4d-systems-touch-display.html",
  "/4d-systems-touch-display/index.html"
]
+++

I recently ordered a [4D Systems Touch Display](http://www.sparkfun.com/products/10089) from [Sparkfun](http://www.sparkfun.com). It took me a few tries to get things working (basic stuff like load new software) but I figured it out in the end. Turns out the display is fairly strict on wanting 5V logic levels, 3.3V just don't cut it.

Even though I have a FTDI cable, I have the 3.3 volt model, I used an old arduino board with the AVR removed.

With that figured out, I can start programming; I'll be posting updates and such on this page.

## February 11, 2011: It works!

4D Systems includes a bunch of samples to show off what the display can do and to provide a starting point to learn 4DGL (the proprietary language their displays use).

Using the serial keypad example as a base, I modified it to send different commands over serial. I also had to modify some of the serial output (Baud rate, etc.) to make it conform with the control setup I was using before. Then, I connected the serial output to an xbee which gave me a working proof of concept.

<iframe width="560" height="315" src="http://www.youtube.com/embed/KxCVexYUNRk?rel=0" frameborder="0" allowfullscreen></iframe>

I put in another Sparkfun order for a few things, but most relevant here would be a [USB to Serial converter](http://www.sparkfun.com/products/8531) to embed into the controller to make things easier.
