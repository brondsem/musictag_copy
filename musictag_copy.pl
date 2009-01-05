#!/usr/bin/perl
use strict;
use warnings;

use Music::Tag;

my $in_file = shift;  
my $out_file = shift;  

my $in = Music::Tag->new($in_file);
$in->get_tag();
my $out = Music::Tag->new($out_file);
$out->get_tag();

#use Data::Dumper;
#print Dumper($in->used_datamethods());
#print Dumper($out->used_datamethods());
#my %in_methods = $in->used_datamethods();
#my @out_methods = $out->used_datamethods();


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
#print Dumper(@methods);
#print Dumper($out->data);
foreach (@methods) {
    print $_ . "\n";
    
    my $val = $in->$_;
    print "\tsource value: " . $val . "\n" if $val;
    
    my $dest_detail;
    if ($val) {
        $dest_detail = "was previously";
    } else {
        $dest_detail = "unchanged";
    }
    
    my $val2 = $out->$_;
    print "\tdestination $dest_detail: " . $val2 . "\n" if $val2;
    
    $out->$_($in->$_);
}
#print Dumper($out->data);
$out->set_tag();
