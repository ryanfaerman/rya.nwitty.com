---
title: Knight Rider Mark II
tags: [electronics, car, leds]
alias: projects/2011/02/10/knight-rider-mark-ii.html
---

I used to have [Knight Rider Lights](/projects/2011/02/10/knight-rider-lights.html) on my car - they broke and were removed. I attempted to repair them but that didn't work out so well; at the end of the day, I chose to just scrap that version and start over with a fresh design.

Design started sometime later but the final implementation really started within the past few months when I actually sat down to do what needed to be done (which was pretty much all the control electronics). The current edition, the Mark II eclipses the old version in just about every way since I *learned* from my mistakes.

### Features
 * 84 LEDs in 28 columns
 * PWM of every channel
 * Regulated +12V and +5V for the LEDs and controller
 * Wireless (Xbee) communications to the controller
 * Many more patterns
 * Update-able "in place"
 * Splash Resistant
 * LCD control panel
 * Wireless  5 function key fob

Instead of having ten "light panels" with 9 LEDs each (90 total), I now have 28 columns with 3 LEDs each(84 total) and even though that's fewer actual LEDs, the new design has them spaced much closer together. 

### Demo

If a picture is worth a thousand words, a video is worth a thousand pictures. Before I get too carried away, this is the finished product (at night).

<iframe width="560" height="315" src="http://www.youtube.com/embed/j0cBl8HyBKA?rel=0" frameborder="0" allowfullscreen></iframe>

I also have a few different control methods. The first version of controls uses an LCD screen, silicone buttons, and a wireless keyfob. This video was taken immediately after installing the lights in my bumper.

<iframe width="560" height="315" src="http://www.youtube.com/embed/0RWShLxQ8OQ?rel=0" frameborder="0" allowfullscreen></iframe>

## Schematics & Drawings

I have these, I just have to compile them all and prepare them for uploading.

## Updates

Never satisfied with anything, I now have a proof-of-concept for a [touch screen](/read/4d-systems-touch-display) remote. The idea is for this to control more than just the lights, but for now, that is all it controls.

<iframe width="560" height="315" src="http://www.youtube.com/embed/KxCVexYUNRk?rel=0" frameborder="0" allowfullscreen></iframe>


