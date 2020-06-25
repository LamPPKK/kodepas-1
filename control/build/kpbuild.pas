unit kpbuild;
interface 
    uses crt, sysutils, process,
        kpprint in './effect/print/kpprint.pas',
        kpini in './ini/kpini.pas',
        getos in './system/getos.pas',
        native_build in 'native/native_build.pas';
    procedure kpbuild_run;
    procedure kpbuild_help;
implementation
    procedure kpbuild_help;
    begin
        writeln('Try: kodepas build [options]');
        writeln('Options:');
        writeln('   --help: show help');
    end;
    procedure kpbuild_run;
    var test: string;
    begin
        if (ParamStr(2) = '--help') then
            begin
                kpbuild_help;
                exit;
            end;
        kpprint_process('[Start] Build project');
        writeln('[Check] Project cofig');
        //Kiểm tra tệp local.ini còn không.
        //Nếu còn thì đi tiếp còn mất thì báo lỗi đồng thời thoát khỏi kpbuild_run
        if (not FileExists('local.ini')) then
            begin
                kpprint_error('[Error] Local.ini not found in project. Try "kodepas init --local" to create it');
                kpprint_error('[Fatal] Build project stoped');
                exit;
            end;
        //Đọc dữ liệu từ local.ini
        //Cấu trúc mẫu local.ini
        //    [CONFIG] ;cái này là NODE quan trọng nhất
        //    run=project.kode ;cái này là tệp khai báo dự án
        //    type=(native/web/hibrid) ;cái này là loại dự án
        //    bin=bin/project ;cái này là đường dẫn output cho Binary project, chỉ dành riêng cho Native và Hibrid
        //    compiled=compiled/code ;cái này là đường dẫn output các tệp hậu biên dịch
        //    sdk=kodepas //cái này khai báo SDK
        //    [INFO] ;cái này thêm cho vui, chủ yếu là thông báo quản quyền
        //    author=quocthinhvo ;cái này tên tác giả dự án
        //    project=project ; cái này tên dự án khi phát hành lên Kode Store
        //    ..=.. ;thêm không giới hạn và tùy theo loại và mục đích
        kpprint_process('[Start] Read data in local.ini');
        //Đọc thử xem có lỗi không
        test := kpini_string('local.ini', 'CONFIG', 'run');
        //nếu đọc được thì thông báo không có lỗi
        kpprint_complete('[Done ] Read data complete');
        //Sau đó phân loại dự án nhằm chọn hướng xây dựng phù hợp theo từng loại
        case (kpini_string('local.ini', 'CONFIG','type')) of
            'native': native_build_run;
            else 
                begin
                    kpprint_error('[Error] Unknow how to build (' + kpini_string('local.ini', 'CONFIG','type') +')');
                    kpprint_error('[Fatal] Build project stop');
                    exit;
                end;
        end;
    end;
end.