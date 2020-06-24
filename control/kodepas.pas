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
    packnative_create in 'create/pack/packnative_create.pas';
begin
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
                else kpprint_error('[Error] Unknow param ('+ paramstr(1) + '), try "kodepas help" to see more param');
            end;
        end
    else 
        begin
            kpmagic_kletter;
            kphelp_run;
        end;
end.