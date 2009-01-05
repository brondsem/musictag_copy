
This is a Perl script, and requires Music::Tag and its dependencies.  Install Music::Tag::MP3, Music::Tag::M4A, etc, based on what formats you want to convert.
It will automatically detect type to use, based on file extension.

Files must already exist.  This just copies metadata, it does not create the destination file.

I use this to copy metadata, after converting from one format to another.

Usage:

# one file
./musictag_copy.pl some_song.m4a some_song.mp3
# two files, from m4a and mp3, both to ogg
./musictag_copy.pl one.m4a two.mp3 one.ogg two.ogg
# lots
./musictag_copy.pl *.m4a *.mp3