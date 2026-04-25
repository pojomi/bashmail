# bashmail
`bashmail` is a terminal based IMAP client with a TUI inspired by programs like fff and bashtop.
# Dependencies
- bash 4.0+
- openssl
# Installation
```
> git clone https://github.com/pojomi/bashmail.git
# Add to bin
> sudo cp bashmail /usr/bin/bashmail
> bashmail
# Or run here
> ./bashmail
```
# Usage
> [!CAUTION]
> This has only been tested with Gmail/icloud accounts and is not guaranteed to function the same way with other IMAP servers.

On initial launch, an email and password will be requested. These are encrypted and stored using `openssl`. They will be retrieved for future sessions automatically.

If you need to modify these credentials you can remove them with
```
rm ~/.bashmail/.emailenc ~/.bashmail/.passenc
```
and will be prompted to login again on relaunch.

> [!NOTE]
> Gmail/icloud Only if you have 2FA enabled, you must create an [app password](https://myaccount.google.com/apppasswords) and use that in place of your normal password.

On successful login, unread messages will be fetched. Once retrieved, a list will be printed to the screen.

Each message in the "Unread" tab is made up of two lines in the format of:
- Sender
- Subject

> [!NOTE]
> During early stages of release, opening any message will **not** mark the message as read.  This will be removed eventually, but makes testing much more convenient.

The focused message will be highlighted. Pressing `return`/`enter` on a highlighted message will attempt to retrieve the text contents. All key bindings are listed below.

> [!NOTE]
> HTML messages are not supported at this time. When retrieving a message that is described as HTML, a warning popup will appear and not load the message.

Supported/tested message types include:
- Text/Plain
- Quoted-Printable
- Base64 encoded

In most cases, hyperlinks are replaced with "Link" written in your terminal's blue foreground color. These are **not** interactive links.
## Key Bindings
- `q`/`^C` From unread tab, quit `bashmail`; From message view, `q` returns to unread tab, `^C` will quit `bashmail`
- `j`/`k` to go down/up the list of unread messages, or down/up every line when viewing a message
- `^N`/`^P` are bound to the same actions as `j`/`k`
- `f`/`b` (message-view only) forward/back one full page
- `r` (unread tab only) reload unread messages
- `m` (unread tab only) mark message for deletion
- `d` (unread tab only) delete all marked messages
- `a` (unread tab only) archive all marked messages
- `return`/`enter` to open focused message
# Other Useful Information
`bashmail` uses your terminal's default color specifications. Appearance will vary for every user.
# Known Issues
- Some messages will return with little to no text after all the parsing is finished
- QP messages sometimes have leftover `)` after parsing hyperlinks
# Roadmap
Completed tasks will be rewritten with strikethrough style when completed. New tasks may be added. The list below is in planned order of completion.

- ~~Archive/delete support~~
- "Inbox" tab to view all messages in new-old sorting
- Receive date to entries
- Add maximum allowable size to messages retrieved from IMAP server
- SMTP support to allow replying with plain text
- Cleanup message formatting as new bugs appear
- HTML support (maybe external launch in browser)

