unit threatDelete;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Buttons;

type
  TthreatDeleteForm = class(TForm)
    logoBevel: TBevel;
    logoImage: TImage;
    Logo_1: TLabel;
    deleteCancelBtn: TBitBtn;
    deleteOkBtn: TBitBtn;
    deletePanel: TPanel;
    DeleteLabel_1: TLabel;
    DeleteLabel_2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure deleteOkBtnClick(Sender: TObject);
    procedure deleteCancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  threatDeleteForm: TthreatDeleteForm;

implementation

uses Main;

{$R *.dfm}

procedure TthreatDeleteForm.FormShow(Sender: TObject);
begin
  DeleteLabel_1.Caption := 'Информация об угрозе с идентификатором '+
    inttostr(mainForm.threatDBGrid.Fields[0].AsInteger);
end;

procedure TthreatDeleteForm.deleteOkBtnClick(Sender: TObject);
begin
  mainForm.threatDBNavigator.BtnClick(nbDelete);
  mainForm.threatStatusBar.Panels.Items[0].Text := 'Всего записей в базе: ' +
    inttostr(GetLastNumThreadRecord);
  Close;
end;

procedure TthreatDeleteForm.deleteCancelBtnClick(Sender: TObject);
begin
  Close;
end;

end.
