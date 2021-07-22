#!/usr/bin/perl
use File::Copy::Recursive qw/dircopy/;

open FH, "<", "config/project_name" or do {
  print "Impossible to execute action, project not initialised.";
  exit 1;
};
my $project_name = <FH>;
unless (-d $project_name) {
  print "Impossible to execute action, $project_name does not exist.";
  exit 1;
}

dircopy("public/", "./$project_name/android/app/src/main/assets");

chdir "./$project_name";
system("react-native", "run-android");
