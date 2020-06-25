unit kpzip;
interface 
    uses crt, sysutils, process,
    getos in './system/getos.pas',
    kpprint in './effect/print/kpprint.pas';
    procedure kpzip_zip(f_name: string);
    procedure kpzip_unzip(f_name: string);
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
                                kpprint_complete('[Done ] Already packed');
                            end
                        else
                            begin
                                kpprint_error('[Error] Pack fail');
                                writeln(s);
                                exit;
                            end;
                    end;
                'windows':
                    begin
                        runStr := 'zip -r '+f_name+'.kpa *';
                        if (RunCommand(runstr, s)) then
                            begin
                                kpprint_complete('[Done ] Already packed')
                            end
                        else
                            begin
                                kpprint_error('[Error] Pack fail');
                                exit;
                            end;
                    end;
                else kpprint_error('[Error] Unknow OS');
            end;
        end;
    procedure kpzip_unzip(f_name: string);
    var s: ansistring;
    begin
        kpprint_process('[Start] Unpack');
        case getos_run of
            'linux':
                begin
                    if (runCommand('unzip -o ' + f_name + '.kpa', s)) then
                        kpprint_complete('[Done ] Unpacked')
                    else
                        begin
                            kpprint_error('[Error] Unpack fail. Error output: ');
                            writeln(s);
                            exit;
                        end;
                end;
            'windows':
                begin
                    if (runCommand('unzip -o ' + f_name + '.kpa', s)) then
                        kpprint_complete('[Done ] Unpacked')
                    else
                        begin
                            kpprint_error('[Error] Unpack fail. Error output: ');
                            writeln(s);
                            exit;
                        end;
                end;
            else kpprint_error('[Error] Unknow OS');
        end;
    end;
end.