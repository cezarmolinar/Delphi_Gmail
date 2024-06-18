program SendEmailGmail;

uses
  Vcl.Forms,
  View.Email in 'src\View\View.Email.pas' {ViewEmail},
  Model.Services.Email.Gmail in 'src\Model\Services\Email\Model.Services.Email.Gmail.pas',
  Model.Services.Email.Interfaces in 'src\Model\Services\Email\Model.Services.Email.Interfaces.pas',
  Model.Services.Email.MailMessage in 'src\Model\Services\Email\Model.Services.Email.MailMessage.pas',
  Model.Services.Email.EmailAccount in 'src\Model\Services\Email\Model.Services.Email.EmailAccount.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewEmail, ViewEmail);
  Application.Run;
end.
