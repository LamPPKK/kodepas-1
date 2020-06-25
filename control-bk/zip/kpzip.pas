unit kpzip;
interface 
    uses crt, sysutils, process,
    getos in './system/getos',
    terminalprint in './effect/terminalprint',
    getkpdir in './system/getkpdir';
    procedure kpzip_zip(f_name: string);
    procedure kpzip_unzip(f_name: string);
    procedure kpzip_updates(f_name:string);
implementation
    procedure kpzip_zip(f_name: string);
        var s, runStr: ansistring;
        begin
            case getos_run of
                'linux':
                    begin
                        {zip -r cc.kpa . -i *}
                        runStr := 'zip -r '+f_name+'.kpa . -i *';
                        if (RunCommand(runStr, s)) then
                            begin
                                terminalprint_complete('[Done ] Already packed');
                            end
                        else
                            begin
                                terminalprint_error('[Error] Pack fail');
                                writeln(s);
                            end;
                    end;
                'windows':
                    begin
                        runStr := 'zip -r '+f_name+'.kpa *';
                        if (RunCommand(runstr, s)) then
                            begin
                                terminalprint_complete('[Done ] Already packed')
                            end
                        else
                            begin
                                terminalprint_error('[Error] Pack fail');
                            end;
                    end;
                else terminalprint_error('[Error] Unknow OS');
            end;
        end;
    procedure kpzip_unzip(f_name: string);
    var s: ansistring;
    begin
        case getos_run of
            'linux':
                begin
                    if (runCommand('unzip -o ' + f_name + '.kpa', s)) then
                        terminalprint_complete('[Done ] Unpacked')
                    else
                        begin
                            terminalprint_error('[Eror] Unpack fail. Error output: ');
                            writeln(s);
                        end;
                end;
            'windows':
                begin
                    if (runCommand('unzip -o ' + f_name + '.kpa', s)) then
                        terminalprint_complete('[Done ] Unpacked')
                    else
                        begin
                            terminalprint_error('[Eror] Unpack fail. Error output: ');
                            writeln(s);
                        end;
                end;
            else terminalprint_error('[Error] Unknow OS');
        end;
    end;
    procedure kpzip_updates(f_name: string);
    var s: ansistring;
    begin
        case getos_run of
            'linux':
                begin
                    if (runCommand('unzip -o ' + f_name + '.kpa -d ' + getkpdir_run, s)) then
                        terminalprint_complete('[Done ] Unpacked')
                    else
                        begin
                            terminalprint_error('[Eror] Unpack fail. Error output: ');
                            writeln(s);
                        end;
                end;
            'windows':
                begin
                    if (runCommand('unzip -o ' + f_name + '.kpa -d ' + getkpdir_run, s)) then
                        terminalprint_complete('[Done ] Unpacked')
                    else
                        begin
                            terminalprint_error('[Eror] Unpack fail. Error output: ');
                            writeln(s);
                        end;
                end;
            else terminalprint_error('[Error] Unknow OS');
        end;
    end;
end.