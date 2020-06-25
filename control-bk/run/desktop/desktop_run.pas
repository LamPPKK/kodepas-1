unit desktop_run;
interface    
    uses crt, sysutils,
        terminalprint in '././effect/print/terminalprint',
        kpini in '././file/kpini';
    procedure desktop_run_run;
implementation
    procedure desktop_run_run;
    var f_bin: string;
    begin   
        f_bin := kpini_string('local.ini', 'CONFIG', 'filebin');
        terminalprint_process('[Info ] Running');
        ExecuteProcess(f_bin,'');
    end;
end.