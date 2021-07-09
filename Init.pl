#!/usr/bin/perl
sub read_all {
  my $file_name = $_[0];
  my $file = "";
  open FH, "<", $file_name;
  $file .= "$_" while (<FH>);
  close FH;
  return $file;
}

print "Enter app name:";
chomp(my $project_name = <STDIN>);

# Create project
system("npx react-native init $project_name --template react-native-template-typescript");
# Add WebView dependencies
chdir "$project_name";
system("npm i react-native-webview");

# Create config folder
chdir "../";
mkdir "config" unless (-d "config");

# Save project name for future reference
open FH, ">", "config/project_name";
print FH $project_name;
close FH;

# Inject base WebView into android app
my $WebViewBase = read_all("./templates/App.tsx");
open FH, ">", "./$project_name/App.tsx";
print FH $WebViewBase;
close FH;

# Fix react-native issue with resolutions
# Watch out for a fix if ever it happens, remove this part of the code.
my $package_json = read_all("./$project_name/package.json");
my $resolutions = read_all("./templates/resolutions.json");
open PACKAGE_JSON, ">", "./$project_name/package.json";
$package_json =~ s/"resolutions": \{[\s\n"@a-z\/:\^0-9,.-]+\}/$resolutions/;
print PACKAGE_JSON $package_json;