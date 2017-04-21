unit vulDelete;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Buttons;

type
  TvulDeleteForm = class(TForm)
    logoBevel: TBevel;
    logoImage: TImage;
    Logo_1: TLabel;
    Logo_2: TLabel;
    deleteCancelBtn: TBitBtn;
    deleteOkBtn: TBitBtn;
    deletePanel: TPanel;
    DeleteLabel_1: TLabel;
    DeleteLabel_2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure deleteCancelBtnClick(Sender: TObject);
    procedure deleteOkBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vulDeleteForm: TvulDeleteForm;

implementation

uses Main;

{$R *.dfm}

procedure TvulDeleteForm.FormShow(Sender: TObject);
begin
  DeleteLabel_1.Caption := 'Информация об уязвимости с идентификатором '+
    inttostr(mainForm.vulDBGrid.Fields[0].AsInteger);
end;

procedure TvulDeleteForm.deleteCancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TvulDeleteForm.deleteOkBtnClick(Sender: TObject);
begin
  mainForm.vulDBNavigator.BtnClick(nbDelete);
  mainForm.vulStatusBar.Panels.Items[0].Text := 'Всего записей в базе: ' +
    inttostr(GetLastNumVulRecord);
  Close;
end;

end.
