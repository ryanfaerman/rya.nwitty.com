+++
date = "2012-07-10T00:00:00-04:00"
title = "Gate (In)security"
aliases = [
  "/notebook/2012/07/10/gate-insecurity.html",
  "/gate-insecurity/index.html"
]
+++

About a month ago, my wife and I moved to a new apartment (technically, it's a condominium that we're renting). It's a gated community complete with RFID access cards and one of those boxes where visitors dial a code to ask us to let them through the gate. Thankfully, the gate isn't tied to a landline and can be associated with a cell phone - it's very modern.

There are a couple shortcomings with the system: you only can connect one number and you can't (or rather, the management office won't) setup a generic access code to give to friends and family. The former is a minor, manageable annoyance; it has been manageable thus far but it is far from ideal. The latter issue is more (but not much more) of a challenge.

My wife and I are observant jews, and as such, keep shabbat and don't answer the phone. We often have guests (some do and some don't keep shabbat) for the shabbat meals and this gate situation was really hampering our style.

Enter [Twilio](http://www.twilio.com/).

Twilio provides an API to programmatically handle phone calls and text messages; after a quick signup and a few lines of [TwiML](http://www.twilio.com/docs/api/twiml), I had a phone number that picks up a call and "dials" the code to open the gate.  If I so desired, with a few lines of ruby code, I can have an access control system that I manage.

I can understand the position of the HOA office. I wouldn't want to open the pandora's box of supporting an access code management system beyond what is currently in place and I certainly wouldn't want to deal with supporting a self-service system either. That being said, I wish they would have given us a general access code (even if they told us not to share it), obviating my need to bypass the security system entirely. My wife requested such a code and, only after a decent amount of convincing, they would only give us a 24 hour code as a rare exception.

The ease that I can bypass the "security" of our gated community just goes to show how little security it provided in the first place.  Despite giving the appearance and (false) sense of security, I suppose that the true purpose of the gate traffic control, not access control and that true security, as always, is up to everyone using the system.
