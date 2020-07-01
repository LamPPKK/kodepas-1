unit kprender;
interface 
    uses crt, sysutils, process;
    procedure kprender_run;
    procedure kprender_help;
implementation
    procedure kprender_help;
    begin
        writeln('Try: kodepas render [options] [value]');
        writeln('Options:');
        writeln('   --help: give help');
        writeln('   [input list]: render resource from list');
    end;
    procedure kprender_run;
    begin
        if (paramStr(2) = '--help') then
            begin
                kprender_help;
                exit;
            end;
    end;
end.