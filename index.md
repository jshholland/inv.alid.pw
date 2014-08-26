---
layout: default
title: Josh Holland
permalink: /
---

<div class="container" markdown="1">

# Josh Holland
{: .page-header}

Former student of Mathematics at Keble College, Oxford, currently working
for [Sirius Corporation] in Surrey.
{: .lead}

<div class="row" markdown="1">

<div class="col-md-5" markdown="1">

## About me

In the day, I spend most of my time writing [Puppet] code to deploy
software such as [Icinga] and [Drupal]. At evenings and weekends, I try to
improve my [chess] skills, pretend I know what I am doing with a camera
(with both terrestrial and celestial subjects) and try to teach myself
more languages (both human and computer) than I really have time for.

I can usually be found on IRC as `dutchie` on [Freenode] and elsewhere,
and can be reached by email at <josh@inv.alid.pw>.

Find me elsewhere on the web:

 * [Facebook]
 * [Google+]
 * [Twitter]
 * [Github]
 * [Last.fm]
{: #links}

</div>

<div class="col-md-7" markdown="1">

{% if site.posts %}

## Articles

{% for post in site.posts %}
  * [{{ post.title}}]({{post.url}})
{% endfor %}

{% endif %}

</div>

</div>

</div>

[Sirius Corporation]: http://www.siriusopensource.com/
[Puppet]: http://puppetlabs.com/
[Icinga]: https://www.icinga.org/
[Drupal]: https://www.drupal.org/
[chess]: http://en.lichess.org/@/jshholland
[Facebook]: https://www.facebook.com/jshholland
[Google+]: https://plus.google.com/+JoshHolland
[Twitter]: https://twitter.com/jshholland
[Github]: https://github.com/jshholland
[Last.fm]: http://www.last.fm/user/jshholland
[Freenode]: http://freenode.net/

*[IRC]: Internet Relay Chat
