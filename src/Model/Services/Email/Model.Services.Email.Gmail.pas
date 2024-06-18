unit Model.Services.Email.Gmail;

interface

uses
  System.Classes, System.SysUtils,
  IdSMTP, IdSSLOpenSSL,
  Model.Services.Email.Interfaces,
  Model.Services.Email.MailMessage;

type
  TGMail = class(TInterfacedObject, iEmail)
  private
    FConfig: iEmailAccount;
    FMessage: iEMailMessage;
    FServer: TIdSMTP;
    FSSL: TIdSSLIOHandlerSocketOpenSSL;
    procedure ConfigServer;
  public
    Constructor Create;
    Destructor Destroy; Override;
    class Function New: iEmail;

    function Account: iEmailAccount;
    function EmailMessage: iEmailMessage;
    function Send: String;
  end;

implementation

uses
  idExplicitTLSClientServerBase,
  Model.Services.Email.EmailAccount;

const
  HOST = 'smtp.gmail.com';
  PORT = 587;

{ TGMail }

function TGMail.Account: iEmailAccount;
begin
  if not Assigned(FConfig) then
    FConfig := TEmailAccount.New(Self);

  Result := FConfig;
end;

procedure TGMail.ConfigServer;
begin
  FSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  FServer := TIdSMTP.Create(nil);

  // segurança
  FSSL.SSLOptions.Mode := sslmClient;
  FSSL.SSLOptions.Method := sslvTLSv1_2;
  FSSL.Host := HOST;
  FSSL.Port := PORT;

  // SMTP
  FServer.IOHandler := FSSL;
  FServer.UseTLS := utUseExplicitTLS;
  FServer.AuthType := satDefault;
  FServer.Host := HOST;
  FServer.Port := PORT;
  FServer.UserName := FConfig.Email;
  FServer.Password := FConfig.APIKey;
end;

constructor TGMail.Create;
begin

end;

destructor TGMail.Destroy;
begin
  FreeAndNil(FSSL);
  FreeAndNil(FServer);

  inherited;
end;

function TGMail.EmailMessage: iEmailMessage;
begin
  if not Assigned(FMessage) then
    FMessage := TMailMessage.New(Self);

  Result := FMessage;
end;

function TGMail.Send: String;
begin
  ConfigServer;
  FServer.Connect;
  FMessage.GenerateMessasse(FConfig.Email, FConfig.Name);
  FServer.Send(FMessage.GetMessasse);
end;

class function TGMail.New: iEmail;
begin
  Result := self.Create;
end;

end.
