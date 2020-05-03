unit kpinit;
interface 
    uses crt, sysutils,
        terminalprint in './effect/print/terminalprint';
    procedure kpinit_run;
implementation
    procedure help;
    begin
        writeln('Try: kodepas init [--options]');
        writeln('Options:');
        writeln('   --help: give help');
        writeln('   --local: init local.ini');
    end;
    procedure kpinit_local;
    var f_project, p_type, f_bin, f_compiled : string;
        f_ini : text;
    begin
        write('[Input] File run project: ');
        readln(f_project);
        write('[Input] Project type: ');
        readln(p_type);
        write('[Input] Directory of compiled files: ');
        readln(f_compiled);
        if (p_type = 'desktop') then
            begin
                write('[Input] Directory of binary: ');
                readln(f_bin);
            end;
        assign(f_ini, 'local.ini');
        rewrite(f_ini);
        writeln(f_ini, '[CONFIG]');
        writeln(f_ini, 'run='+f_project);
        writeln(f_ini, 'compiled='+f_compiled);
        writeln(f_ini, 'filebin='+ f_bin);
        writeln(f_ini, 'type='+p_type);
        writeln(f_ini, 'sdk=kodepas');
        close(f_ini);
    end;
    procedure kpinit_run;
    begin
        case (paramStr(2)) of
            '--help': help;
            '--local': kpinit_local;
            else terminalprint_error('[Error] Unknow option [' + paramStr(2) + ']. Try: "kodepas init --help"');
        end;   
    end;
end.