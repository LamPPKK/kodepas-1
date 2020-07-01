unit kprender;
interface 
    uses crt, sysutils, process,
        kpprint in './effect/print/kpprint.pas';
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
    var cmdout: ansistring;
    begin
        if (paramStr(2) = '--help') then
            begin
                kprender_help;
                exit;
            end;
        kpprint_process('[Start] Render');
        if (runCommand('koderes ' + paramStr(2) + '.krs @' + paramStr(2), cmdout)) then
            begin
                kpprint_complete('[Done ] Render complete')
            end
        else
            begin
                kpprint_error('[Error] Render fail');
                kpprint_error('[Code ]');
                writeln(cmdout);
                kpprint_error('[Fatal] Render stop');
                exit;
            end; 
    end;
end.