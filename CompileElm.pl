#!/usr/bin/perl
opendir(Pages, "src/Pages");
my @files = map { "src/Pages/$_" } grep !/^\./, readdir(Pages);
$, = " ";
my $command = "elm make @files @ARGV --output=public/app.js";
system($command);
