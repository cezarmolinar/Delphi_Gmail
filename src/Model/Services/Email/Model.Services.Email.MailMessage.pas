unit Model.Services.Email.MailMessage;

interface

uses
  System.Classes, Model.Services.Email.Interfaces, idMessage, idText;

type
  TMailMessage = class(TInterfacedObject, iEMailMessage)
  private
    [weak]
    FParent : iEmail;
    FAttachments: TStringList;
    FEmailTo: TStringList;
    FReplyTo: string;
    FSubject: string;
    FText: string;
    FMessagem: TIdMessage;
  public
    constructor Create(Parent : iEmail);
    destructor Destroy; override;
    class function New(Parent : iEmail) : iEMailMessage;

    function Attachments(aValue: TStringList): iEMailMessage;
    function EmailTo(aValue: TStringList): iEMailMessage;
    function ReplyTo(aValue: string): iEMailMessage;
    function Subject(aValue: string): iEMailMessage;
    function Text(aValue: string): iEMailMessage;
    function &End: iEmail;

    procedure GenerateMessasse(const email: string; const name: String);
    function GetMessasse : TIdMessage;
  end;

implementation

uses
  System.SysUtils,
  idAttachmentFile,
  idExplicitTLSClientServerBase;

{ TMailMessage }

function TMailMessage.Attachments(aValue: TStringList): iEMailMessage;
begin
  Result := Self;
  FAttachments := aValue;
end;

function TMailMessage.&End: iEmail;
begin
  Result := FParent;
end;

{
Exemplo de estrutura da mensagem
https://www.devmedia.com.br/enviar-anexo-no-corpo-do-email-com-indy/2657
}
procedure TMailMessage.GenerateMessasse(const email: string; const name: String);
var
  x: Integer;

begin
  // Menssagem
  FMessagem.ContentType := 'multipart/alternative';
  FMessagem.Encoding := meMIME;

  FMessagem.From.Address := email;
  FMessagem.From.Name := name;
  FMessagem.ReplyTo.EMailAddresses := FReplyTo;

  FMessagem.Recipients.Clear;
  for x := 0 to FEmailTo.count - 1 do
  begin
    FMessagem.Recipients.Add;
    FMessagem.Recipients.Items[x].Address := FEmailTo[x];
  end;

  FMessagem.Subject := FSubject;

  // Parte 0 - texto puro
  with TIdText.Create(FMessagem.MessageParts) do
  begin
    Body.Text := '';
    ContentTransfer := '7bit';
    ContentType := 'text/plain';
  end;

  // Parte 1
  with TIdText.Create(FMessagem.MessageParts) do
  begin
    ContentType := 'multipart/related';
    Body.Clear;
  end;

  // Parte 1 - HTML
  with TIdText.Create(FMessagem.MessageParts) do
  begin
    Body.Clear;
    ContentType := 'text/html';
    ContentTransfer := '7bit';
    Body.Text := FText;
    ParentPart := 1;
  end;

  // Parte 1 - Arquivos em anexo
  if Assigned(FAttachments) then
    if not FAttachments.IsEmpty then
      for x := 0 to FAttachments.count - 1 do
        if FileExists(FAttachments[x]) then
          with TIdAttachmentFile.Create(FMessagem.MessageParts, FAttachments[x]) do
            ParentPart := 1;
end;

function TMailMessage.GetMessasse: TIdMessage;
begin
  Result := FMessagem;
end;

constructor TMailMessage.Create(Parent: iEmail);
begin
  FParent := Parent;
  FMessagem := TIdMessage.Create();
end;

destructor TMailMessage.Destroy;
begin
  FMessagem.Free;
  inherited;
end;

class function TMailMessage.New(Parent: iEmail): iEMailMessage;
begin
  Result := Self.Create(Parent);
end;

function TMailMessage.EmailTo(aValue: TStringList): iEMailMessage;
begin
  Result := Self;

  if aValue.IsEmpty then
    raise Exception.Create('Informe o(s) destinatário(s) da mensagem.');

  FEmailTo := aValue;
end;

function TMailMessage.ReplyTo(aValue: string): iEMailMessage;
begin
  Result := Self;

  if aValue.IsEmpty then
    raise Exception.Create('Informe o e-mail de resposta (ResponderPara)');

  FReplyTo := aValue;
end;

function TMailMessage.Subject(aValue: string): iEMailMessage;
begin
  Result := Self;

  if aValue.IsEmpty then
    raise Exception.Create('Informe o assunto da mensagem.');

  FSubject := aValue;
end;

function TMailMessage.Text(aValue: string): iEMailMessage;
begin
  Result := Self;

  if aValue.IsEmpty then
    raise Exception.Create('Informe o texto da mensagem.');

  FText := aValue;
end;

end.
