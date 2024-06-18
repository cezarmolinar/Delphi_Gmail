unit Model.Services.Email.Config;

interface

type
  TConfig = class
  private
    FEmail: string;
    FPassword: string;
    FSMTP: string;
    FPort: integer;
    FName: string;
    procedure SetEmail(const Value: string);
    procedure SetPort(const Value: integer);
    procedure SetPassword(const Value: string);
    procedure SetSMTP(const Value: string);
    procedure SetName(const Value: string);
  published
    property Port: integer read FPort write SetPort;
    property SMTP: string read FSMTP write SetSMTP;
    property Email: string read FEmail write SetEmail;
    property Password: string read FPassword write SetPassword;
    property Name: string read FName write SetName;
  end;

implementation

{ TConfig }

procedure TConfig.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TConfig.SetPort(const Value: integer);
begin
  FPort := Value;
end;

procedure TConfig.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TConfig.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TConfig.SetSMTP(const Value: string);
begin
  FSMTP := Value;
end;


end.
