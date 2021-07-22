#!/usr/bin/perl
use HTTP::Daemon;
use threads;

chdir "./public";

my $PORT = 8000;
my $d = HTTP::Daemon->new(LocalPort => $PORT);

print "Listening on 'localhost:$PORT'\n";

threads->create(sub {
  my $platform = $^O;

  sleep(0.5);

  system("open \"http://localhost:$PORT\"") if ($platform eq "darwin");
  system("cmd /c start \"\" \"http://localhost:$PORT\"") if ($platform eq "MSWin32");
  system("x-www-browser \"http://localhost:$PORT\"") if ($platform eq "linux");
})->join();

while (my $c = $d->accept) {
  while (my $r = $c->get_request) {
    if ($r->method eq "GET" and $r->uri->path eq "/"){
      $c->send_file_response("./index.html");
    } elsif ($r->method eq "GET") {
      $c->send_file_response("./" . $r->uri->path);
    }
  }
}
