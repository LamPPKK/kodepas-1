unit kptext;
interface 
    uses crt, sysutils,
        terminalprint in './effect/print/terminalprint';
    procedure kptext_print(f_path : string);
implementation
    procedure kptext_print(f_path: string);
    var f: text;
        a: array[1..10000] of string;
        i, line: longint;
    begin
        if (not fileExists(f_path)) then
            begin
                terminalprint_error('[Error] File not found');
                exit;
            end; 
        assign(f, f_path);
        reset(f);
        line := 1;
        while (not eof(f)) do
            begin
                readln(f , a[line]);
                inc(line);
            end;
        for i:=1 to (line -1) do writeln(a[i]);
        close(f);
    end;
end.