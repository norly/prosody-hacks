My hacks for the [Prosody XMPP server](https://prosody.im/)
============================================================

Modules
--------

### `mod_csi_on_away`

This implements CSI for legacy clients that report idleness via 'Away'
presence.

Just about any old client such as Pidgin can be set to report the user's
presence as 'Away' after a few minutes of inactivity, or when the
computer is locked, etc.

With this plugin, these clients will save network traffic and thus power
when they go 'Away'.


### `mod_message_fake_id`

[Monal on iOS](https://monal.im) used to (or still does?) get confused and
drop messages with the same message ID, or no message ID at all.

To avoid silent message loss at the receiving end when sending
messages to a Monal user, this plugin generates a random message ID
(a UUID) for every message stanza.



Patches
--------

### `patch-hangouts`

This is now obsolete.

It was used to hide users who were online online via Google Hangouts,
as Hangouts would report presence via XMPP S2S, but silently drop
incoming messages. It was useless to see these people online unless
they ever used a proper XMPP client to log into Hangouts, at which
point S2S worked just like GTalk did before.

This has become obsolete now that Google has ended the XMPP S2S
support altogether.
