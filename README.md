% QVM-DRUIDE-ANTIDOTE(1) | User Commands

NAME
========
qvm-druide-antidote - Call "Antidote" 

SYNOPSIS
=============
**qvm-druide-antidote** [_FILE_]

DESCRIPTION
=================
Qubes Druide-Antidote is a [Qubes](https://qubes-os.org) Application.
It send a file to the Antidote Qube, invoke Antidote, and retrieve the file back.
Antidote is a commercial proprietary spellchecker: https://www.antidote.info/en/antidote-10.

PREREQUISITE
================
You installed 'Antidote' on a Qube named 'antidote'.

If you want to use another name, or a disposable VM,
you need to adjust the RPC policy in dom0, and the 'druide-antidote-client' file

EXAMPLE
===============
qvm-druide-antidote ./README.md

AUTHOR
==============
See the commit log for details.
