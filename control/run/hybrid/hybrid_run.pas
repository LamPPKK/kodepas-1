unit hybrid_run;
interface
    uses crt, sysutils ,fpjson, jsonparser, process,
        kpprint in './effect/print/kpprint';
    procedure hybrid_run_run;
implementation
    procedure hybrid_run_json;
    var
        json: ansistring;
        cache: string;
        J: TJSONData;
	    i: integer;
	    command: array[1..100] of string;
        s: ansistring;
        f: text;
    begin   
        //đăng kí tệp
        assign(f, 'command.json');
        reset(f);
        json := '';
        while (not eof(f)) do 
        begin
            readln(f, cache);
            json := json + cache;
        end;
        //writeln(json);
        close(f);
        //đọc dữ liệu json từ chuỗi và gán vào biến J
        J := Getjson(json);
        for i:=0 to j.Count-1 do
	    begin
		    command[i] := j.Items[i].FindPath('command').AsString;
	    end;
        for i:=0 to j.count-1 do 
        begin
            if (runcommand(command[i], s)) then
                begin
                    //writeln('[Start] Run command: ', command[i]);
                    kpprint_complete('[Done ] Output: ' + s);
                end
            else 
                begin
                    //writeln('[Start] Run command: ', command[i]);
                    kpprint_complete('[Done ] Output: ' + s);
                end;
        end;
        j.free;
        //writeln('debug 1');
    end;
    procedure hybrid_run_run;
    begin
        hybrid_run_json;
        //writeln('debug 2');
    end;
end.