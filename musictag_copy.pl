#!/usr/bin/perl
use strict;
use warnings;

use Music::Tag;

# set to 0 or 1, if you want to change how much output is shown per file
my $quiet = 1;

my $num_args = $#ARGV +1;
die "Must use even number of file names; you sent $num_args" if ($num_args % 2 != 0) ;

# ones I think are good
my @methods =  (
    'title',                                                                                                                                  
    'albumartist',                                                                                                                            
    'tracknum',                                                                                                                               
    'totaltracks',                                                                                                                            
    'album',                                                                                                                                  
    'compilation',                                                                                                                            
    'genre',                                                                                                                                  
    'track',                                                                                                                                  
    'artist',                                                                                                                             
    'url',                                                                                                                                    
    'year',                                                                                                                                   
    'artist',                                                                                                                                 
    'comment',
    'composer',
    'recorddate',
    'totaldiscs',
    'artist_type',
    'lyrics',
    'asin',
    'country',
    'discnum',
    'disc',
    'copyright',
    'originalartist',
    'album_type',
    'label',
    'upc',
    'rating',
    'disctitle',
    'releasedate',
    'releasetime',
    'countrycode',
);

my ($in_file, $out_file, $in, $out, $val, $val2, $dest_detail);

my $num_pairs = $num_args/2;
for (my $i = 0; $i < $num_pairs; $i++) {
    $in_file = $ARGV[$i];  
    $out_file = $ARGV[$i+$num_pairs];  

    print "$in_file -> $out_file\n";

    $in = Music::Tag->new($in_file);
    $in->get_tag();
    $out = Music::Tag->new($out_file);
    $out->get_tag();

    foreach (@methods) {
        if (!$quiet) {
            print $_ . "\n";
        }
        
        $val = $in->$_;
        if (!$quiet) {
            print "\tsource value: " . $val . "\n" if $val;
        }
        
        if ($val) {
            $dest_detail = "was previously";
        } else {
            $dest_detail = "unchanged";
        }
        
        $val2 = $out->$_;
        if (!$quiet) {
            print "\tdestination $dest_detail: " . $val2 . "\n" if $val2;
        }
        
        $out->$_($in->$_);
    }
    #print Dumper($out->data);
    $out->set_tag();
}