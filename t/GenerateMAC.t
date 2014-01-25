#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Goodie;

zci answer_type => "MAC Address";
zci is_cached => 0;

my $mac_regxp = "([0-9A-F]{2}[:-]){5}([0-9A-F]{2})";
my $text_start = "Here's a random MAC address: ";
my $text_end="";
my $html_start = "<i>Here's a random MAC address: </i>";
my $html_end = "<br /> More at <a href='http://coffer.com/mac_find/'>coffer.com</a>";

#regexp from http://stackoverflow.com/questions/4260467/what-is-a-regular-expression-for-a-mac-address
ddg_goodie_test (
	[
		'DDG::Goodie::GenerateMAC'
	],
	'generate mac address' => 
		test_zci(
			qr/^$text_start$mac_regxp$/, 
			html => qr/^$html_start$mac_regxp $html_end$/,
		),
	'generate mac addr' => 
		test_zci(
			qr/^$text_start$mac_regxp$/, 
			html => qr/^$html_start$mac_regxp $html_end$/,
		),
	'random mac address' => 
		test_zci(
			qr/^$text_start$mac_regxp$/,
			html => qr/^$html_start$mac_regxp $html_end$/,
		),
	'random mac addr' => 
		test_zci(
			qr/^$text_start$mac_regxp$/,
			html => qr/^$html_start$mac_regxp $html_end$/,
		),
);

done_testing;