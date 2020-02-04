# Generate Random Passwords

This is a quick perl script that I knocked together to generate blocks
of random passwords.  It generates fifty at a time, and each one is at
least 15 chars long (before separators) and made up of at least four
words.   Word separators are randomized.

Pick one, or mix and match parts, swap separators, change case,
whatever you want.  This just gives you a good random starting point.
Once you are done, be sure write it down on a post-it and stick it to
your monitor :-)

The words come from a wordlist.txt file.  We use the set of 10k most
common english words 5-8 chars in length, found below:

- https://github.com/first20hours/google-10000-english
- google-10000-english-usa-no-swears-medium.txt

By all means, replace it with your own set of source words.  Use a
file with at least as many words.  A four element password with the
10k word source has at least ten quadrillion (10^16) possibilities.

This site has a collection of 58k words.

- http://www.mieliestronk.com/wordlist.html

John Lawler has compiled a set of around 70k words. 

- http://www-personal.umich.edu/~jlawler/wordlist.html

This is a monster 466k word file.

- https://github.com/dwyl/english-words


This script uses Math::Random::Secure to get a better version of
rand() Install via cpan or libmath-random-secure-perl package.


\- David Loffredo
