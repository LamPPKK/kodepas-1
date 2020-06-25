unit kplog;
interface 
    uses crt, sysutils, process,
        kpprint in './effect/print/kpprint.pas';
    procedure kplog_run(log: ansistring);
    procedure kplog_show;
implementation
    procedure kplog_run(log: ansistring);
    var f: text;
    begin
        assign(f, 'build.log');
        rewrite(f);
        writeln(f, log);
        close(f);
    end;
    procedure kplog_show;
    var i, line: word;
        a: array[1..10000] of string;
        f: text;
    begin
        writeln('[Start] Show log');
        if (not FileExists('build.log')) then
            begin
                kpprint_error('[Fatal] Log file not found');
                exit;
            end;
        line :=1;
        assign(f, 'build.log');
        reset(f);
        while (not eof(f)) do 
        begin
            readln(f, a[line]);
            inc(line);
        end;
        dec(line);
        for i:=1 to line do writeln(a[i]);
        close(f);
    end;
end.