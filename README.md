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
