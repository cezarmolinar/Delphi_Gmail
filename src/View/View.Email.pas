unit View.Email;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TViewEmail = class(TForm)
    btnEnviar: TButton;
    btnSair: TButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    EdtConta: TEdit;
    Label7: TLabel;
    EdtContaNome: TEdit;
    Label6: TLabel;
    EdtChaveAPI: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edtDestinatario: TEdit;
    Label2: TLabel;
    edtAssunto: TEdit;
    Label3: TLabel;
    memMensagem: TMemo;
    Label4: TLabel;
    edtArquivoAnexo: TEdit;
    Label8: TLabel;
    EdtResponder: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
  private
    { Private declarations }
    procedure EnviarEmail;
  public
    { Public declarations }
  end;

var
  ViewEmail: TViewEmail;

implementation

uses
  Model.Services.Email.Interfaces,
  Model.Services.Email.Gmail;

{$R *.dfm}

procedure TViewEmail.btnEnviarClick(Sender: TObject);
begin
  EnviarEmail;
end;

procedure TViewEmail.btnSairClick(Sender: TObject);
begin
  Close ;
end;

procedure TViewEmail.EnviarEmail;
var
  lEmail : iEmail;
  anexos, destinarios : TStringList;

begin
  destinarios := TStringList.Create;
  anexos := TStringList.Create;

  try
    anexos.Clear;
    anexos.Add(edtArquivoAnexo.Text);

    destinarios.Clear;
    destinarios.Add(edtDestinatario.Text);

    lEmail := TGMail.New
      .Account
        .Email(EdtConta.Text)
        .Name(EdtContaNome.Text)
        .APIKey(EdtChaveAPI.Text)
        .&End();

    lEmail
      .EmailMessage
        .Attachments(anexos)
        .EmailTo(destinarios)
        .ReplyTo(EdtResponder.Text)
        .Subject(edtAssunto.Text)
        .Text(memMensagem.Lines.Text)
        .&End
      .Send;

    showmessage('Mensagem enviada');
  finally
    FreeAndNil(destinarios);
    FreeAndNil(anexos);
  end;
end;

end.
