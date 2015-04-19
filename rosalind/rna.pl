while(my $row = <>){
  chomp $row;
  for my $c (split //, $row) {
    if($c eq 'T'){
      print 'U'
    } else {
      print $c
    }
  }
  print "\n"
}
