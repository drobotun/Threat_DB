unit threatFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TthreatFiltreForm = class(TForm)
    logoImage: TImage;
    logoBevel: TBevel;
    threatFiltrePanel: TPanel;
    threatFiltreLabel: TLabel;
    threatFilterMemo: TMemo;
    filterCancelBtn: TBitBtn;
    filterOkBtn: TBitBtn;
    Logo_1: TLabel;
    procedure filterCancelBtnClick(Sender: TObject);
    procedure filterOkBtnClick(Sender: TObject);
    procedure threatFilterMemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  threatFiltreForm: TthreatFiltreForm;

implementation

{$R *.dfm}

uses Main, threatFind;

procedure TthreatFiltreForm.filterCancelBtnClick(Sender: TObject);
begin
 Close;
end;

procedure TthreatFiltreForm.filterOkBtnClick(Sender: TObject);
begin
  try
    mainForm.threatClientDataSet.Filter := threatFilterMemo.Text;
    mainForm.threatStatusBar.Panels.Items[1].Text := 'Найдено записей: ' +
    inttostr(GetLastNumThreadRecord);
    if GetLastNumThreadRecord = 0 then
      begin
        mainForm.threatClientDataSet.Filter := '';
        mainForm.threatStatusBar.Panels.Items[1].Text := '';
        MessageBox(0,'Ничего не найдено',
                     'T&V DataBase', MB_OK or MB_ICONINFORMATION);
      end
    else
      begin
        threatFindForm.Close;
        mainForm.threatClientDataSet.FilterOptions := [];
        Close;
      end;
  except
    MessageBox(0,'Неправильный ввод фильтра поиска',
      'T&V DataBase', MB_OK or MB_ICONERROR);
  end;
end;

procedure TthreatFiltreForm.threatFilterMemoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  threatFilterMemo.ReadOnly := ((key = VK_RETURN) and (ssCtrl in shift));
end;

end.
