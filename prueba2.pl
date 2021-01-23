#!C:\Strawberry\perl\bin\perl.exe
use strict;
use Array::Compare;

my $comp1 = Array::Compare->new;
 
my @dna = qw(ATGCGA CAGTGC TTATGT AGAAGG CCCCTA TCACTG);
my @dna1 = qw(AAAA CCCC TTTT GGGG);


my ($arrayVertical) = convertirVertical(\@dna, \@dna1);

my (@vertical) = (@$arrayVertical);

my $resultado_Vertical = verificarVertical(\@vertical);
my $resultado_Horizontal = verificarHorizontal(\@dna, \@dna1);

isMutant($resultado_Vertical, $resultado_Horizontal);


sub verificarVertical {

    ($arrayVertical) = @_;

    my (@Entrega) = @$arrayVertical; 
    my $resultado = 0;

    for(my $i = 0; $i <@Entrega; $i++) {
        if (@Entrega[$i] =~ /CCCC|AAAA|TTTT|GGGG/) {
            $resultado = $resultado + 1;
            print "@Entrega[$i]\n";
        }
    }

    return $resultado;

}



sub verificarHorizontal {
    my ($dato, $dato1) = @_;

    my (@Entrega) = @$dato;   
    my (@Entrega1) = @$dato1; 

    my $resultado = 0;
   
    for(my $i = 0; $i <@Entrega; $i++) {
        if (@Entrega[$i] =~ /CCCC|AAAA|TTTT|GGGG/) {
            $resultado = $resultado + 1;
             print "@Entrega[$i]\n";
        }
    }

    return $resultado;
}

sub isMutant {

    my ($resultadoHorizontal, $resultadoVertical) = @_;

    my $resultado = 0;
    my $isMutant = "false";

    $resultado = $resultadoHorizontal + $resultadoVertical;

    if ($resultado >= 1) {
        $isMutant = "true";
    } else {
        $isMutant = "false";
    }

    print "$isMutant \n";
    return $isMutant;
}


sub convertirVertical {
    my ($dato, $dato1) = @_;

    my (@Entrega) = @$dato;   
    my (@Entrega1) = @$dato1; 

    my @array;
    my @lat;
    my @long;
    my @long_1;
    my @long_2;
    my @long_3;
    my @long_4;
    my @long_5;

    foreach (@Entrega) {
    my @separated = split(' ', $_);
    push @lat, $separated[0];
    }

    my $resultado = 0;

    foreach (@lat) {
    my @separated_1 = split('', $_);
        push @long, $separated_1[0];
        push @long_1, $separated_1[1];
        push @long_2, $separated_1[2];
        push @long_3, $separated_1[3];
        push @long_4, $separated_1[4];
        push @long_5, $separated_1[5];
    }

    my (@dna) = ("@long", "@long_1", "@long_2", "@long_3", "@long_4", "@long_5");

    foreach  (@dna) {
       $_ =~ s/\s//g;
    }
   
    return \@dna; 
}

