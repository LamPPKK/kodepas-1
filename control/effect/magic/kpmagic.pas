unit kpmagic;
interface
    uses crt;
    procedure kpmagic_kletter;
implementation
    procedure kpmagic_kletter;
    begin
        writeln('##     ##     ####    #######    #########');
        writeln('##    ##   ##     ##  ##     ##  #########');
        writeln('##   ##    ##     ##  ##     ##  ##       ');
        writeln('## ##      ##     ##  ##     ##  #########');
        writeln('##  ##     ##     ##  ##     ##  #########');
        writeln('##   ##    ##     ##  ##     ##  ##       ');
        writeln('##    ##   ##     ##  ##     ##  #########');
        writeln('##     ##    ####     #######    #########');
    end;
end.