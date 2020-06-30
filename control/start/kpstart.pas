unit kpstart;
interface
    uses crt, sysutils,
        kpprint in './effect/print/kpprint.pas',
        kpbuild in './build/kpbuild.pas',
        kprun in './run/kprun.pas',
        kplog in './log/kplog.pas';
    procedure kpstart_run;
implementation
    procedure help;
    begin
        writeln('KodePas Live help. ');
        writeln('In KodePas Live, you press key to control. ');
        writeln('Key:');
        writeln('   "h" give help');
        writeln('   "b" build project without run');
        writeln('   "r" build and run project');
        writeln('   "l" show log');
        writeln('   "c" stop KodePas Live');
    end;
    procedure main;
    var keys: char;
    begin
        keys := readkey;
        case keys of
            'r' : 
                begin
                    kpprint_process('Run project');
                    kprun_run;
                end;
            'b':
                begin 
                    kpprint_process('Build project');
                    kpbuild_run;
                end;
            'h' : help;
            'c': exit;
            'l':
                begin
                    kpprint_process('Log');
                    kplog_show;
                end; 
            'd': clrscr;
            else writeln('Unknow key, try press "h" to get help')
        end; 
        writeln('-----------------------------------------------------');
        main;
    end;
    procedure kpstart_run;
    begin
        kpprint_process('KodePas Live. Press "h" to see help, "c" to end.');
        main
    end; 
end.