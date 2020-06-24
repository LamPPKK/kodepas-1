unit kppack;
interface 
    uses crt, sysutils,
        terminalprint in './effect/print/terminalprint',
        kpzip in './zip/kpzip';
    procedure kppack_run;
implementation
    procedure help;
    begin
        writeln('kodepas pack [value]');
        writeln('Value:');
        writeln('   [name] name pack "name.kpa"');
        writeln('Options:');
        writeln('   --help: give help');
    end;
    procedure kppack_run;
    begin
        case paramStr(2) of
            '--help': help;
            else 
                kpzip_zip(paramStr(2));
        end;
    end;
end.