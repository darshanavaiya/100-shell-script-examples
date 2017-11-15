use Digest::MD5 ;
%seen = ();
while( <*> ){
    -d and next;
    $filename="$_"; 
    print "doing .. $filename\n";
    $md5 = getmd5($filename) ."\n";    
    if ( ! defined( $seen{$md5} ) ){
        $seen{$md5}="$filename";
    }else{
        print "Duplicate: $filename and $seen{$md5}\n";
    }
}
sub getmd5 {
    my $file = "$_";            
    open(FH,"<",$file) or die "Cannot open file: $!\n";
    binmode(FH);
    my $md5 = Digest::MD5->new;
    $md5->addfile(FH);
    close(FH);
    return $md5->hexdigest;
}
