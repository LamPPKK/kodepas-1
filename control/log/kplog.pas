unit kplog;
interface 
    uses crt, sysutils, process,
        kpprint in './effect/print/kpprint.pas';
    procedure kplog_run(log: ansistring);
implementation
    procedure kplog_run(log: ansistring);
    var f: text;
    begin
        assign(f, 'build.log');
        rewrite(f);
        writeln(f, log);
        close(f);
    end;
end.