unit kprun;
interface 
    uses crt, sysutils, process,
        terminalprint in 'effect/terminalprint',
        kpbuid in 'build/kpbuild',
        kplog in 'log/kplog',
        kpini in 'file/kpini',
        desktop_run in 'desktop/desktop_run';
    procedure kprun_run;
implementation
    procedure help;
    begin
        writeln('Try: kodepas run [option]');
        writeln('Options:');
        writeln('   --clear: clear and run');
        writeln('   --help: give help');
        writeln('   --only: run only');
    end;
    procedure kprun_now;
    var f_bin, p_type: string;
    begin
        p_type := kpini_string('local.ini', 'CONFIG', 'type');
        case p_type of
            'desktop' : desktop_run_run;
            'package': terminalprint_wan('[Warn ] This project only build');
            else terminalprint_error('[Error] Unknow to run');
        end;
    end;
    procedure kprun_run;
    begin
        if (paramCount = 1) then
            begin
                kpbuild_now;
                terminalprint_process('[Start] Running');
                kprun_now;
            end
        else
            case paramStr(2) of
                '--help' :help;
                '--only':
                    begin
                        kprun_now;
                    end; 
                else terminalprint_error('[Error] Unknow param(' + paramStr(2) + '). Try "kodepas run --help" to see more param');
            end;
    end;
end.