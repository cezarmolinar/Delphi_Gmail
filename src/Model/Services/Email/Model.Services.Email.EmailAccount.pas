unit Model.Services.Email.EmailAccount;

interface

uses
  Model.Services.Email.Interfaces;

type
  TEmailAccount = class(TInterfacedObject, iEmailAccount)
  private
    [weak]
    FParent : iEmail;
    FEmail : string;
    FName : string;
    FAPIKey : string;
  public
    constructor Create(Parent : iEmail);
    destructor Destroy; override;
    class function New(Parent : iEmail) : iEmailAccount;

    function Email(avalue: string) : iEmailAccount; overload;
    function Email : string; overload;
    function Name(avalue: string) : iEmailAccount; overload;
    function Name : string; overload;
    function APIKey(avalue: string) : iEmailAccount; overload;
    function APIKey : string; overload;
    function &End : iEmail;
  end;

implementation

{ TEmailConfig<T> }

function TEmailAccount.APIKey(avalue: string): iEmailAccount;
begin
  Result := Self;
  FAPIKey := avalue;
end;

function TEmailAccount.Email: string;
begin
  Result := FEmail;
end;

function TEmailAccount.&End: iEmail;
begin
  Result := FParent;
end;

function TEmailAccount.APIKey: string;
begin
  Result := FAPIKey;
end;

constructor TEmailAccount.Create(Parent : iEmail);
begin
  FParent := Parent;
end;

destructor TEmailAccount.Destroy;
begin

  inherited;
end;

function TEmailAccount.Email(avalue: string): iEmailAccount;
begin
  Result := Self;
  FEmail := avalue;
end;

function TEmailAccount.Name(avalue: string): iEmailAccount;
begin
  Result := Self;
  FName := avalue;
end;

function TEmailAccount.Name: string;
begin
  Result := FName;
end;

class function TEmailAccount.New(Parent : iEmail): iEmailAccount;
begin
  Result := Self.Create(Parent);
end;

end.
