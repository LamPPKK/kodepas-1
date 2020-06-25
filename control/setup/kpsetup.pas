unit kpsetup;
interface 
    uses crt, sysutils, StrUtils,
        getos in './system/getos.pas',
        kpprint in './effect/print/kpprint.pas';
    procedure kpsetup_run;
    procedure kpsetup_help;
implementation
    procedure kpsetup_help;
    begin
        writeln('Kode Setup help');
        writeln('[Step1]: Input your path of Kode directory and KC');
        writeln('[Step2]: Press Enter and wait');
        writeln('*Note');
        writeln('   Please enter true directory');
        writeln('   Found native files in Kode');
        writeln('   The best way is run as Admin or SUDO');
        writeln('See full setup at: https://kodelang.dev/docs/install');
    end;
    procedure kpsetup_run;
    var kp_path, kc_path: string;
        f: text;
        i, count: word;
        a: array[1..1000] of string;
        //kp_path và kc_path là đường dẫn người dùng nhập
        //f là tệp đọc ghi dữ liệu
        //biến i count đếm
        //mảng a lưu tệp theo từng dòng code
    begin
        //nhập đường dẫn KodePas và Kode Compiler
        if ((ParamCount >1) and (ParamStr(2) = '--help')) then
            begin
                kpsetup_help;
                exit;
            end;
        write('[Input] KodePas Directory: '); 
        readln(kp_path);
        write('[Input] Kode Compiler Directory: ');
        readln(kc_path);
        writeln('[Check] Directory');
        //Kiểm tra đường dẫn KodePas
        writeln('[Check] Directory');
        if (DirectoryExists(kp_path)) then
            kpprint_complete('[Done ] KodePas found')
            else 
                begin
                    kpprint_error('[Error] KodePas not found');
                    kpprint_error('[Fatal] Setup Kode fail');
                    exit;
                end;
        //Kiểm tra Kode Compiler
        if (DirectoryExists(kc_path)) then
            kpprint_complete('[Done ] Kode Compiler found')
            else 
                begin
                    kpprint_error('[Error] Kode Compiler not found');
                    kpprint_error('[Fatal] Setup Kode fail');
                    exit;
                end;
        //Kiểm tra LCL
        writeln('[Check] System packages in KodePas directory');
        if (DirectoryExists(kp_path + '/lcl')) then
            kpprint_complete('[Done ] System packages found')
        else
            begin
                kpprint_error('[Error] System packages not found');
                kpprint_error('[Fatal] Setup Kode fail');
                exit;
            end; 
        //Đọc dữ liệu từ tệp nguyên mẫu trong bin/native/environmentoptions.xml
        //Kiểm tra xem tệp nguyên mẫu còn không
        writeln('[Check] File Native');
        if (FileExists(kp_path + '/bin/native/environmentoptions.xml')) then
            kpprint_complete('[Done ] File native found')
        else    
            begin
                kpprint_error('[Error] Native file not found');
                kpprint_error('[Fatal] Setup Kode fail');
                exit;
            end;
        //Đọc tệp environmentoptions.xml theo từng dòng
        assign(f, kp_path + '/bin/native/environmentoptions.xml');
        reset(f);
        i := 1;
        while (not eof(f)) do 
        begin
            readln(f, a[i]);
            inc(i);
        end;    
        dec(i);
        close(f);
        //for count := 1 to i do writeln(a[count]);
        for count :=1 to i do
        begin
            a[count] := ReplaceStr(a[count], 'KodePasDirectoryValue', kp_path);
            a[count] := ReplaceStr(a[count], 'KCDirectoryValue', kc_path);
        end;
        //for count := 1 to i do writeln(a[count]);
        //ghi dữ liệu ra đĩa tại thư mục tùy chỉnh
        kpprint_process('[Start] Save setup');
        case getos_run of
            'linux':
                begin
                    assign(f, getUserDir + '/.kodepas/environmentoptions.xml');
                    rewrite(f);
                    for count :=1 to i do writeln(f, a[count]);
                    close(f);
                    kpprint_complete('[Done ] Setup Complete');
                end;
            'windows':
                begin
                    assign(f, getUserDir + '/.kodepas/environmentoptions.xml');
                    rewrite(f);
                    for count :=1 to i do writeln(f, a[count]);
                    close(f);
                    kpprint_complete('[Done ] Setup Complete');
                end;
            'macos':
                begin
                    assign(f, getUserDir + '/.kodepas/environmentoptions.xml');
                    rewrite(f);
                    for count :=1 to i do writeln(f, a[count]);
                    close(f);
                    kpprint_complete('[Done ] Setup Complete');
                end;
            else kpprint_error('[Error] Unknow OS');
        end;
    end;
end.