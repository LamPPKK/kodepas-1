unit kppack;
interface 
    uses crt, sysutils, process,
        kpprint in './effect/print/kpprint.pas',
        kpzip in './zip/kpzip.pas';
    procedure kppack_run;
    procedure kppack_help;
implementation
    procedure kppack_run;
    begin
        if (ParamCount >1 ) then
            begin
                case (paramStr(2)) of
                    '--help': kppack_help;
                    else 
                        begin
                            kpprint_process('[Start] Pack folder to KPA');
                            kpzip_zip(paramStr(2));
                        end;   
                end; 
            end
        else
            begin
                kppack_help;
            end;  
    end;
    procedure kppack_help;
    begin
        writeln('Try: kodepas pack [-options]');
        writeln('Options:');
        writeln('   --help: give help');
        writeln('   [filename]: pack to [filename].kpa');
    end;
end.