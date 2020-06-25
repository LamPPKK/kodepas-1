unit kpget;
interface
    uses crt, sysutils, process,
        terminalprint in './effect/terminalprint',
        getos in './system/getos',
        kpzip in './zip/kpzip',
        kptext in './file/kptext';
    procedure kpget_run;
    procedure kpget_download(channel, input: string);
implementation
    {Lấy đường daãn mẹ}
    function GetParent(input:string):string;
        begin
        exit(extractFileName(ExtractFileDir(input)));
        end;
    {Lấy dudowngf dẫn con}
    function GetChild(input:string):string;
        begin
        exit(extractFileName(input));
        end;
    procedure help;
        begin
            writeln('Try: kodepas get [--option] [value]');
            writeln('Options:');
            writeln('   [channel]/[name] download and unpack');
            writeln('   --native [channel]/[name] only get');
            writeln('   --help: give help');
            writeln('   --info [channel]/[name] get info');
            writeln('   --list [chanel] get list pack in channel');
        end;
    {Tải gói}
    procedure kpget_download(channel, input: string);
    var link : string;
        s: ansiString;
    begin
        link := 'https://github.com/' + channel + '/kpstore/raw/master/' + input +'.kpa';
        writeln('[Start] Downloading...');
        case getos_run of
            'linux':
                begin
                    if (RunCommand('wget ' + link, s)) then
                        begin
                            terminalprint_complete('[Done ] Download complete');
                        end
                    else
                        begin
                            terminalprint_error('[Error] Cannot download. Error code:');
                            writeln(s);
                            exit;
                        end;
                end;
            'windows':
                begin
                    if (RunCommand('kpget ' + link, s)) then
                        terminalprint_complete('[Done ] Download complete')
                    else
                        begin
                            terminalprint_error('[Error] Cannot download, Error code:');
                            writeln(s);
                        end;
                end;
            else terminalprint_error('[Error] Unknow OS');
        end;    
    end;
    {Lấy thông tin gói}
    procedure kpget_info(channel, input: string);
    var s, link: ansistring;
    begin
        link := 'https://github.com/' + channel + '/kpstore/raw/master/' + input +'.md';
        case getos_run of
            'linux':
                begin
                    if (RunCommand('wget ' + link, s)) then
                        begin
                            {Nothing to do ://}
                        end
                    else
                        begin
                            terminalprint_error('[Error] Cannot download. Error code:');
                            writeln(s);
                            exit;
                        end;
                end;
            'windows':
                begin
                    if (RunCommand('kpget ' + link, s)) then
                        begin
                            {Nothing to do}
                        end
                    else
                        begin
                            terminalprint_error('[Error] Cannot download, Error code:');
                            writeln(s);
                            exit;
                        end;
                end;
            else terminalprint_error('[Error] Unknow OS');
            kptext_print(getcurrentDir + getChild(paramStr(3)));
        end;  
        kptext_print(getcurrentDir + '/' + input + '.md');
        deleteFile(getcurrentDir + '/' + input + '.md')
    end;
    procedure kpget_run;
    begin
        case (ParamStr(2)) of
            '--help': help;
            '--native':
                begin
                    kpget_download(GetParent(paramStr(3)), GetChild(paramStr(3)));
                end;
            '': help;
            '--info': kpget_info(GetParent(paramStr(3)), GetChild(paramStr(3)));
            '--list': kpget_info(paramStr(3), 'LIST');
            else
                begin
                    kpget_download(GetParent(paramStr(2)), GetChild(paramStr(2)));
                    kpzip_unzip(getChild(paramStr(2)));
                    if (deleteFile(getChild(paramStr(2))+ '.kpa')) then 
                        terminalprint_complete('[Done ] Clear file temp')
                    else terminalprint_error('[Error] Fail clear');
                end;
        end;
    end;
end.