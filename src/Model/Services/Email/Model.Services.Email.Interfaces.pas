unit Model.Services.Email.Interfaces;

interface

uses
  System.Classes, System.SysUtils, idMessage;

type
  iEmailAccount = interface;
  iEMailMessage = interface;

  iEmail = Interface
    ['{73AB3FCD-71BD-43A9-BD86-315B68B08DD5}']
    function Account: iEmailAccount;
    function EmailMessage: iEmailMessage;
    function Send: String;
  end;

  iEmailAccount = interface
    ['{F9DE7E01-9FFA-4F04-B0BE-6F3E9C943F46}']
    function Email(aValue: string): iEmailAccount; overload;
    function Email: string; overload;
    function Name(aValue: string): iEmailAccount; overload;
    function Name: string; overload;
    function APIKey(aValue: string): iEmailAccount; overload;
    function APIKey: string; overload;
    function &End: iEmail;
  end;

  iEMailMessage = interface
    ['{8AD3EA32-A9DB-4FD2-A47B-B6E734D36E0C}']
    function Attachments(aValue: TStringList): iEMailMessage;
    function EmailTo(aValue: TStringList): iEMailMessage;
    function ReplyTo(aValue: string): iEMailMessage;
    function Subject(aValue: string): iEMailMessage;
    function Text(aValue: string): iEMailMessage;
    procedure GenerateMessasse(const email: string; const name: String);
    function GetMessasse : TIdMessage;
    function &End: iEmail;
  end;

implementation

end.
