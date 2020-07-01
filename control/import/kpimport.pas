unit kpimport;
interface
    uses crt, sysutils, process,
        kpprint in './effect/print/kpprint.pas';
    procedure kpimport_run;
    procedure kpimport_help;
implementation
    procedure kpimport_run;
    var cmdout: ansiString;
    begin
        if (paramStr(2) = '--help') then
            begin
                kpimport_help;
                exit;
            end;
        if (paramStr(2) = '--c') then
            begin
                kpprint_process('[Start] Import C code');
                writeln('[Start] Importing');
                if (runCommand('h2pas ' + paramStr(3), cmdout)) then
                    begin
                        kpprint_complete('[Done ] Convert done');
                    end
                else 
                    begin
                        kpprint_error('[Error] Some thing wrong');
                        kpprint_error('[Code ]');
                        writeln(cmdout);
                        writeln('[Fatal] Import stop');
                        exit;
                    end;
                writeln('[Start] Make binay lib for Kode');
                if (runCommand('fpc ' + paramStr(3), cmdout)) then
                    begin
                        kpprint_complete('[Done ] Make done')
                    end
                else
                    begin
                        kpprint_error('[Error] Make binary fail');
                        kpprint_error('[Code ]');
                        writeln(cmdout);
                        kpprint_error('[Fatal] Import stop');
                        exit;
                    end;
            end; 
    end;
    procedure kpimport_help;
    begin
        writeln('Try: kodepas import [--option] [value]');
        writeln('Options:');
        writeln('   --help: give help');
        writeln('   --c: import C code (*.h)');
    end;
end.