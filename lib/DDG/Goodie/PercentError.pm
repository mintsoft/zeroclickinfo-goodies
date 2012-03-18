package DDG::Goodie::PercentError;

use DDG::Goodie;

triggers start => "percent", "%", "percent-error";

zci answer_type => "PercentError";

handle query_parts => sub {
    shift;
    shift if @_[0] =~ /(?: |-|)error/ || @_[0] =~ /(?: |-|)err/;

    my $length = @_;
    print "$length\n";
    return unless $length == 2;

    my ( $acc, $exp ) = @_;
    $acc =~ s/[{},;\s]+//g;
    $exp =~ s/[{},;\s]+//g;
    
    return if $acc =~ m/[^0-9\.\-]/ || $exp =~ m/[^0-9\.\-]/;

    my $diff = abs $acc - $exp;
    my $err = abs ($diff/$acc*100);
    
    return "Accepted: $acc\nExperimental: $exp\nError: $err%";
};

1;