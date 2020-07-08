program kodepas;
uses 
    //thư viện mặc định
    crt, sysutils,
    //Setup Kode
    kpsetup in 'setup/kpsetup.pas',
    //Lấy thông tin về hệ điều hành
    getos in 'system/getos.pas',
    //In ra màn hình kết quả đã được định dạng
    kpprint in 'effect/print/kpprint.pas',
    //Một số hiệu ứng
    kpmagic in 'effect/magic/kpmagic.pas',
    //Hiển thị hướng dẫn
    kphelp in 'help/kphelp.pas',
    //Lấy gói từ máy chủ
    kpget in 'get/kpget.pas',
    //Xử lí file nén
    kpzip in 'zip/kpzip.pas',
    //tạo dự án mới
    kpcreate in 'create/kpcreate.pas',
    //tạo các loại dự án
    native_create in 'create/native/native_create.pas',
    web_create in 'create/web/web_create.pas',
    hibrid_create in 'create/hibrid/hibrid_create.pas',
    cli_create in 'create/cli/cli_create.pas',
    packnative_create in 'create/pack/packnative_create.pas',
    node_create in 'create/node/node_create.pas',
    //thư viện xử lí tệp INI
    kpini in 'ini/kpini.pas',
    //Thêm thư viện build dự án
    kpbuild in 'build/kpbuild.pas',
    //thêm thư viện tạo dự án thành Kode Packges
    kppack in 'pack/kppack.pas',
    //Thêm số phiên bản
    kpversion in 'version/kpversion.pas',
    //xây dựng native project
    native_build in 'build/native/native_build.pas',
    //xây dựng cli project
    cli_build in 'build/cli/cli_build.pas',
    //Thay đổi đường dẫn ở các hệ điều hành
    renderos in 'system/renderos.pas',
    //Thư viện ghi tệp log
    kplog in 'log/kplog.pas',
    //Chạy
    kprun in 'run/kprun.pas',
    //native run
    native_run in 'run/native/native_run.pas',
    //cli run
    cli_run in 'run/cli/cli_run.pas',
    //Kode Live
    kpstart in 'start/kpstart.pas',
    //import mã nguồn
    kpimport in 'import/kpimport.pas',
    //Thư viện kết xuất tài nguyên
    kprender in 'render/kprender.pas',
    //thêm thư viện xây dựng ứng dụng node
    node_build in 'build/node/node_build.pas',
    //cái này là thư viện để chạy mấy dự án Node
    node_run in 'run/node/node_run.pas';
begin
    renderos_run;
    if (ParamCount > 0) then
        begin
            case ParamStr(1) of
                //Cài đặt Kode
                'setup': kpsetup_run;
                //Hiển thị bảng hướng dẫn sử dụng
                'help': kphelp_run;
                //Lấy gói và tương tác với Kode Server
                'get': kpget_run;
                //tạo dự án
                'create': kpcreate_run;
                //Xây dựng dự án
                'build': kpbuild_run;
                //Đóng gói thư mục thành Kode Packages (*.kpa)
                'pack': kppack_run;
                //Xem phiên bản
                'version': kpversion_run;
                //show log
                'log': kplog_show;
                //cái này để chạy
                'run': kprun_run;
                //Start
                'start': kpstart_run;
                //import chạy
                'import': kpimport_run;
                //Chuyển hướng qua KPRender
                'render': kprender_run;
                else kpprint_error('[Error] Unknow param ('+ paramstr(1) + '), try "kodepas help" to see more param');
            end;
        end
    else 
        begin
            kpmagic_kletter;
            kphelp_run;
        end;
end.