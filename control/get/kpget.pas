unit kpget;
interface
    uses crt, sysutils, process,
        getos in './system/getos.pas',
        kpprint in './effect/print/kpprint.pas',
        kpzip in './zip/kpzip.pas';
    //xử lí khi Kode Gettter khởi động
    procedure kpget_run;
    //Tải khi có đường dẫn và đường URL
    procedure kpget_download(urlget, pathsave: string);
    //Đưa ra hướng dẫn
    procedure kpget_help;
    //Tải khi biết tên Channel và Pack
    procedure kpget_channel(input: string);
implementation
    //lấy đường dẫn mẹ
    function GetParent(input:string):string;
        begin
            exit(extractFileName(ExtractFileDir(input)));
        end;
    //lấy đường dẫn con
    function GetChild(input:string):string;
        begin
            exit(extractFileName(input));
        end;
    //Ví dụ: kodestudio/quocthinh thì
    //quocthinh là con, kodestudio là mẹ
    //hàm này để chọn ra đâu là channel và đâu là packages
    procedure kpget_help;
    begin
        writeln('Try: kodepas get [--options] [value]');
        writeln('Options:');
        writeln('   [channel]/[package]: download and install package');
        writeln('   --help: give help of Kode Get');
        writeln('   --native: only get Package at KPA');
        writeln('   --info [channel]/[package]: get info of package');
        writeln('   --list [channel]: get list packages of channel');
    end;
    procedure kpget_run;
    begin
        if (paramCount >= 2) then
            begin
                case (paramStr(2)) of
                    '--help': kpget_help;
                    '--native':
                        begin
                            kpget_channel(ParamStr(3));
                        end;
                    else
                        begin
                            //tải xuống
                            kpget_channel(paramStr(2));
                            //giải nén
                            kpzip_unzip(getChild(paramStr(2)));
                            //xóa file thừa
                            kpprint_process('[Start] Clear temp');
                            if (deleteFile(getChild(paramStr(2))+ '.kpa')) then 
                                kpprint_complete('[Done ] Clear file temp')
                            else kpprint_error('[Error] Fail clear');
                        end;
                end;
            end
        else 
            begin
                kpget_help;
            end;
    end;
    procedure kpget_download(urlget, pathsave: string);
    var cmdout: ansistring;
    begin
        kpprint_process('[Start] Download form Kode Server');
        case (getos_run) of
            'windows':
                begin
                    if (RunCommand('kpget ' + urlget + ' -P ' + pathsave, cmdout)) then
                    begin
                        kpprint_complete('[Done ] Download complete');
                        exit;
                    end else
                    begin
                        kpprint_error('[Error] Download error');
                        writeln('[Code ] ', cmdout);
                        kpprint_error('[Fatal] Kode Getter stop');
                        exit;
                    end;
                end;
            'linux':
                begin
                    if (RunCommand('wget ' + urlget + ' -P ' + pathsave, cmdout)) then
                    begin
                        kpprint_complete('[Done ] Download complete');
                        exit;
                    end else
                    begin
                        kpprint_error('[Error] Download error');
                        writeln('[Code ] ', cmdout);
                        kpprint_error('[Fatal] Kode Getter stop');
                        exit;
                    end;
                end;
            'macos':
                begin
                    if (RunCommand('wget ' + urlget + ' -P ' + pathsave, cmdout)) then
                    begin
                        kpprint_complete('[Done ] Download complete');
                        exit;
                    end else
                    begin
                        kpprint_error('[Error] Download error');
                        writeln('[Code ] ', cmdout);
                        kpprint_error('[Fatal] Kode Getter stop');
                        exit;
                    end;
                end;
        end;
    end;

    procedure kpget_channel(input: string);
    var channel, pack, url: string;
    begin
        channel := GetParent(input);
        pack := GetChild(input);
        //https://github.com/kodestudio/kpstore/raw/master/project-desktop.kpa
        //https://github.com/kodestudio/kpstore/raw/master/project-native/project-native.kpa
        url := 'https://www.github.com/'+channel+'/kpstore/raw/master/'+pack+'/'+ pack + '.kpa';
        kpget_download(url, getCurrentDir);
    end;
end.